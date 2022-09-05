# Maintainer: Anuskuss <anuskuss@googlemail.com>
pkgname=cemu
pkgver=2.0.89
pkgrel=1
pkgdesc='Software to emulate Wii U games and applications on PC'
arch=(x86_64)
url=https://github.com/cemu-project/Cemu
license=(MPL2)
depends=(
	# unbundled vcpkg
	sdl2 pugixml libzip libpng 'wxwidgets-gtk3>=3.2'
)
makedepends=(
	# pkgbuild
	git 'cmake>=3.21.1' make
	# unbundled vcpkg
	rapidjson boost glslang glm
	# cemu
	nasm vulkan-headers
	# wxwidgets
	glu
)
optdepends=(
	'vulkan-driver: Vulkan graphics'
)
provides=(cemu)
source=(
	git+https://github.com/cemu-project/Cemu#commit=a54a3ec74ea95326096feb46317fb9c6cd277742
	# dependencies
	fmt-7.1.3.tar.gz::https://github.com/fmtlib/fmt/archive/refs/tags/7.1.3.tar.gz
	imgui-1.88.tar.gz::https://github.com/ocornut/imgui/archive/refs/tags/v1.88.tar.gz
	imgui.cmake::https://raw.githubusercontent.com/microsoft/vcpkg/master/ports/imgui/CMakeLists.txt
	imgui.conf::https://raw.githubusercontent.com/microsoft/vcpkg/master/ports/imgui/imgui-config.cmake.in
	# submodules
	git+https://github.com/mozilla/cubeb#commit=dc511c6b3597b6384d28949285b9289e009830ea
	# git+https://github.com/microsoft/vcpkg#commit=1b0252ca70ca2244a711535462c7f981eb439e83
	# git+https://github.com/KhronosGroup/Vulkan-Headers#commit=715673702f5b18ffb8e5832e67cf731468d32ac6
	git+https://github.com/Exzap/ZArchive#commit=48914a07df3c213333c580bb5e5bb3393442ca5b
	# cubeb submodules
	git+https://github.com/arsenm/sanitizers-cmake#commit=aab6948fa863bc1cbe5d0850bc46b9ef02ed4c1a
	git+https://github.com/google/googletest#commit=800f5422ac9d9e0ad59cd860a2ef3a679588acb4
)
sha256sums=(
	SKIP
	5cae7072042b3043e12d53d50ef404bbb76949dad1de368d7f993a15c8c05ecc
	9f14c788aee15b777051e48f868c5d4d959bd679fc5050e3d2a29de80d8fd32e
	262faed507149c89aab7572fd2c2a968f843ca2900043e30a9c339735ed08a8f
	91528f60cca93d3bce042d2ac16a63169025ec25a34453b49803126ed19153ae
	SKIP
	SKIP
	SKIP
	SKIP
)

pkgver() {
	cd Cemu
	MAJ=$(awk -F '\t' '/LEAD/ {print $NF;exit}' src/Common/version.h)
	MIN=$(awk -F '\t' '/MAJOR/ {print $NF;exit}' src/Common/version.h)
	CNT=$(git rev-list --count HEAD)
	# HASH=$(git rev-parse --short HEAD)
	echo "$MAJ.$MIN.$CNT"
}

prepare() {
	cd Cemu

	# cemu submodules
	for submodule in dependencies/{cubeb,ZArchive}; do
		git config submodule.$submodule.url "$srcdir/${submodule##*/}"
		git submodule update --init $submodule
	done
	pushd dependencies/cubeb
	for submodule in {cmake/sanitizers-cmake,googletest}; do
		git config submodule.$submodule.url "$srcdir/${submodule##*/}"
		git submodule update --init $submodule
	done
	popd

	# unbundled fmt
	sed -i '/fmt/c\add_subdirectory(dependencies/fmt)' CMakeLists.txt
	ln -srf "$srcdir/fmt-7.1.3" dependencies/fmt

	# unbundled imgui
	sed -i '/imgui/c\add_subdirectory(dependencies/imgui)' CMakeLists.txt
	ln -srf "$srcdir/imgui-1.88" dependencies/imgui
	ln -srf "$srcdir/imgui.cmake" dependencies/imgui/CMakeLists.txt
	ln -srf "$srcdir/imgui.conf" dependencies/imgui/imgui-config.cmake.in

	# prefer clang (faster)
	which clang   &> /dev/null && [[ -z $CC  ]] && export CC=$(which clang)
	which clang++ &> /dev/null && [[ -z $CXX ]] && export CXX=$(which clang++)

	# clang workaround
	[[ $CXX == *clang* ]] && git apply << 'EOF'
--- a/src/Cemu/Logging/CemuLogging.h
+++ b/src/Cemu/Logging/CemuLogging.h
@@ -58,9 +58,6 @@ bool cemuLog_log(LogType type, TFmt format, TArgs&&... args)
 	if (!cemuLog_isLoggingEnabled(type))
 		return false;
 
-	const auto format_view = fmt::to_string_view(format);
-	const auto text = fmt::vformat(format_view, fmt::make_args_checked<TArgs...>(format_view, args...));
-	cemuLog_log(type, std::basic_string_view(text.data(), text.size()));
 	return true;
 }
 
EOF

	# glm fix
	sed -i 's/glm::glm/glm/' src/Common/CMakeLists.txt src/input/CMakeLists.txt

	# glslang fix
	sed -i 's/GLSLANG_VERSION_LESS/GLSLANG_VERSION_GREATER/' src/Cafe/HW/Latte/Renderer/Vulkan/RendererShaderVk.cpp

	# xdg base dir support
	_xdg_patch

	# gameProfiles improvement
	git apply << 'EOF'
--- a/src/Cafe/GameProfile/GameProfile.cpp
+++ b/src/Cafe/GameProfile/GameProfile.cpp
@@ -185,7 +185,7 @@ bool GameProfile::Load(uint64_t title_id)
 	std::optional<std::vector<uint8>> profileContents = FileStream::LoadIntoMemory(gameProfilePath);
 	if (!profileContents)
 	{
-		gameProfilePath = ActiveSettings::GetSystemDataPath("gameProfiles/default/{:016x}.ini", title_id);
+		gameProfilePath = ActiveSettings::GetSystemDataPath("gameProfiles/{:016x}.ini", title_id);
 		profileContents = FileStream::LoadIntoMemory(gameProfilePath);
 		if (!profileContents)
 			return false;
EOF
}

build() {
	cd Cemu
	cmake -B build \
	      -DSYSTEM_DATA_PATH=/opt/cemu \
	      -DENABLE_VCPKG=OFF \
	      -DCMAKE_BUILD_TYPE=Release \
	      -DPUBLIC_RELEASE=ON
	make -C build -j $(nproc)
}

package() {
	cd Cemu
	install -D bin/Cemu_release "$pkgdir/usr/bin/cemu"

	mv bin/gameProfiles/default/000500001011000.ini bin/gameProfiles/default/0005000010111000.ini
	for ini in bin/gameProfiles/default/*[A-Z]*; do
		mv $ini bin/gameProfiles/default/$(basename ${ini,,});
	done
	# install -Dm644 bin/gameProfiles/example.ini "$pkgdir/opt/cemu/gameProfiles/example.ini"
	install -Dm644 bin/gameProfiles/default/* -t "$pkgdir/opt/cemu/gameProfiles"
	install -Dm644 bin/resources/sharedFonts/* -t "$pkgdir/opt/cemu/resources/sharedFonts"
	for lang in {ca,de,es,fr,hu,it,ja,ko,nb,nl,pl,pt,ru,sv,tr,zh}; do
		install -Dm644 bin/resources/$lang/cemu.mo "$pkgdir/opt/cemu/resources/$lang/cemu.mo"
	done
	# install -Dm644 bin/shaderCache/info.txt "$pkgdir/opt/cemu/shaderCache/info.txt"

	install -Dm644 src/resource/logo_icon.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/cemu.png"
	sed -i "s|^Icon=info.cemu.Cemu$|Icon=cemu|;s|^Exec=cemu$|Exec=env GDK_BACKEND=x11 /usr/bin/cemu|" dist/linux/info.cemu.Cemu.desktop
	install -Dm644 dist/linux/info.cemu.Cemu.desktop "$pkgdir/usr/share/applications/cemu.desktop"
}

_xdg_patch() {
	# https://github.com/cemu-project/Cemu/pull/130
	git apply << 'EOF'
--- a/CMakeLists.txt
+++ b/CMakeLists.txt
@@ -50,6 +50,13 @@ option(ENABLE_OPENGL "Enables the OpenGL backend" ON)
 option(ENABLE_VULKAN "Enables the Vulkan backend" ON)
 option(ENABLE_DISCORD_RPC "Enables the Discord Rich Presence feature" ON)
 
+if (UNIX)
+  option(ENABLE_XDG_DIRS "Enable storage according to XDG specification" ON)
+endif()
+if (SYSTEM_DATA_PATH)
+  add_compile_definitions(SYSTEM_DATA_PATH=\"${SYSTEM_DATA_PATH}\")
+endif()
+
 # input backends
 if (WIN32)
 	option(ENABLE_XINPUT "Enables the usage of XInput" ON)
@@ -125,6 +132,10 @@ if (ENABLE_CUBEB)
 	add_compile_definitions("HAS_CUBEB=1")
 endif()
 
+if (ENABLE_XDG_DIRS)
+	add_compile_definitions(XDG)
+endif()
+
 add_subdirectory("dependencies/ih264d" EXCLUDE_FROM_ALL)
 
 find_package(ZArchive)
--- a/src/Cafe/Account/Account.cpp
+++ b/src/Cafe/Account/Account.cpp
@@ -424,7 +424,7 @@ OnlineValidator Account::ValidateOnlineFiles() const
 {
 	OnlineValidator result{};
 	
-	const auto otp = ActiveSettings::GetPath("otp.bin");
+	const auto otp = ActiveSettings::GetDataPath("otp.bin");
 	if (!fs::exists(otp))
 		result.otp = OnlineValidator::FileState::Missing;
 	else if (fs::file_size(otp) != 1024)
@@ -432,7 +432,7 @@ OnlineValidator Account::ValidateOnlineFiles() const
 	else
 		result.otp = OnlineValidator::FileState::Ok;
 	
-	const auto seeprom = ActiveSettings::GetPath("seeprom.bin");
+	const auto seeprom = ActiveSettings::GetDataPath("seeprom.bin");
 	if (!fs::exists(seeprom))
 		result.seeprom = OnlineValidator::FileState::Missing;
 	else if (fs::file_size(seeprom) != 512)
--- a/src/Cafe/CafeSystem.cpp
+++ b/src/Cafe/CafeSystem.cpp
@@ -289,7 +289,7 @@ uint32 loadSharedData()
 	for (sint32 i = 0; i < sizeof(shareddataDef) / sizeof(shareddataDef[0]); i++)
 	{
 		bool existsInMLC = fs::exists(ActiveSettings::GetMlcPath(shareddataDef[i].mlcPath));
-		bool existsInResources = fs::exists(ActiveSettings::GetPath(shareddataDef[i].resourcePath));
+		bool existsInResources = fs::exists(ActiveSettings::GetSystemDataPath(shareddataDef[i].resourcePath));
 
 		if (!existsInMLC && !existsInResources)
 		{
@@ -314,7 +314,7 @@ uint32 loadSharedData()
 			// alternatively fall back to our shared fonts
 			if (!fontFile)
 			{
-				path = ActiveSettings::GetPath(shareddataDef[i].resourcePath);
+				path = ActiveSettings::GetSystemDataPath(shareddataDef[i].resourcePath);
 				fontFile = FileStream::openFile2(path);
 			}
 			if (!fontFile)
@@ -340,7 +340,7 @@ uint32 loadSharedData()
 		return memory_getVirtualOffsetFromPointer(dataWritePtr);
 	}
 	// alternative method: load RAM dump
-	const auto path = ActiveSettings::GetPath("shareddata.bin");
+	const auto path = ActiveSettings::GetSystemDataPath("shareddata.bin");
 	FileStream* ramDumpFile = FileStream::openFile2(path);
 	if (ramDumpFile)
 	{
--- a/src/Cafe/Filesystem/FST/KeyCache.cpp
+++ b/src/Cafe/Filesystem/FST/KeyCache.cpp
@@ -59,7 +59,7 @@ void KeyCache_Prepare()
 	sKeyCachePrepared = true;
 	g_keyCache.clear();
 	// load keys
-	auto keysPath = ActiveSettings::GetPath("keys.txt");
+	auto keysPath = ActiveSettings::GetConfigPath("keys.txt");
 	FileStream* fs_keys = FileStream::openFile2(keysPath);
 	if( !fs_keys )
 	{
--- a/src/Cafe/GameProfile/GameProfile.cpp
+++ b/src/Cafe/GameProfile/GameProfile.cpp
@@ -180,12 +180,12 @@ void gameProfile_load()
 
 bool GameProfile::Load(uint64_t title_id)
 {
-	auto gameProfilePath = ActiveSettings::GetPath("gameProfiles/{:016x}.ini", title_id);
+	auto gameProfilePath = ActiveSettings::GetConfigPath("gameProfiles/{:016x}.ini", title_id);
 
 	std::optional<std::vector<uint8>> profileContents = FileStream::LoadIntoMemory(gameProfilePath);
 	if (!profileContents)
 	{
-		gameProfilePath = ActiveSettings::GetPath("gameProfiles/default/{:016x}.ini", title_id);
+		gameProfilePath = ActiveSettings::GetSystemDataPath("gameProfiles/default/{:016x}.ini", title_id);
 		profileContents = FileStream::LoadIntoMemory(gameProfilePath);
 		if (!profileContents)
 			return false;
@@ -276,7 +276,7 @@ bool GameProfile::Load(uint64_t title_id)
 
 void GameProfile::Save(uint64_t title_id)
 {
-	auto gameProfilePath = ActiveSettings::GetPath("gameProfiles/{:016x}.ini", title_id);
+	auto gameProfilePath = ActiveSettings::GetConfigPath("gameProfiles/{:016x}.ini", title_id);
 	FileStream* fs = FileStream::createFile2(gameProfilePath);
 	if (!fs)
 	{
--- a/src/Cafe/GraphicPack/GraphicPack2.cpp
+++ b/src/Cafe/GraphicPack/GraphicPack2.cpp
@@ -63,7 +63,7 @@ void GraphicPack2::LoadGraphicPack(fs::path graphicPackPath)
 void GraphicPack2::LoadAll()
 {
 	std::error_code ec;
-	fs::path basePath = ActiveSettings::GetPath("graphicPacks");
+	fs::path basePath = ActiveSettings::GetDataPath("graphicPacks");
 	for (fs::recursive_directory_iterator it(basePath, ec); it != end(it); ++it)
 	{
 		if (!it->is_directory(ec))
--- a/src/Cafe/HW/Latte/Core/LatteShaderCache.cpp
+++ b/src/Cafe/HW/Latte/Core/LatteShaderCache.cpp
@@ -197,17 +197,17 @@ void LatteShaderCache_load()
 	LatteShaderCache_initCompileQueue();
 	// create directories
 	std::error_code ec;
-	fs::create_directories(ActiveSettings::GetPath("shaderCache/transferable"), ec);
-	fs::create_directories(ActiveSettings::GetPath("shaderCache/precompiled"), ec);
+	fs::create_directories(ActiveSettings::GetCachePath("shaderCache/transferable"), ec);
+	fs::create_directories(ActiveSettings::GetCachePath("shaderCache/precompiled"), ec);
 	// initialize renderer specific caches
 	if (g_renderer->GetType() == RendererAPI::Vulkan)
 		RendererShaderVk::ShaderCacheLoading_begin(cacheTitleId);
 	else if (g_renderer->GetType() == RendererAPI::OpenGL)
 		RendererShaderGL::ShaderCacheLoading_begin(cacheTitleId);
 	// get cache file name
-	const auto pathGeneric = ActiveSettings::GetPath("shaderCache/transferable/{:016x}_shaders.bin", cacheTitleId);
-	const auto pathGenericPre1_25_0 = ActiveSettings::GetPath("shaderCache/transferable/{:016x}.bin", cacheTitleId); // before 1.25.0
-	const auto pathGenericPre1_16_0 = ActiveSettings::GetPath("shaderCache/transferable/{:08x}.bin", CafeSystem::GetRPXHashBase()); // before 1.16.0
+	const auto pathGeneric = ActiveSettings::GetCachePath("shaderCache/transferable/{:016x}_shaders.bin", cacheTitleId);
+	const auto pathGenericPre1_25_0 = ActiveSettings::GetCachePath("shaderCache/transferable/{:016x}.bin", cacheTitleId); // before 1.25.0
+	const auto pathGenericPre1_16_0 = ActiveSettings::GetCachePath("shaderCache/transferable/{:08x}.bin", CafeSystem::GetRPXHashBase()); // before 1.16.0
 
 	LatteShaderCache_handleDeprecatedCacheFiles(pathGeneric, pathGenericPre1_25_0, pathGenericPre1_16_0);
 	// calculate extraVersion for transferable and precompiled shader cache
--- a/src/Cafe/HW/Latte/Renderer/OpenGL/RendererShaderGL.cpp
+++ b/src/Cafe/HW/Latte/Renderer/OpenGL/RendererShaderGL.cpp
@@ -279,7 +279,7 @@ void RendererShaderGL::ShaderCacheLoading_begin(uint64 cacheTitleId)
 	{
 		const uint32 cacheMagic = GeneratePrecompiledCacheId();
 		const std::string cacheFilename = fmt::format("{:016x}_gl.bin", cacheTitleId);
-		const std::wstring cachePath = ActiveSettings::GetPath("shaderCache/precompiled/{}", cacheFilename).generic_wstring();
+		const std::wstring cachePath = ActiveSettings::GetCachePath("shaderCache/precompiled/{}", cacheFilename).generic_wstring();
 		g_programBinaryCache = FileCache::Open(cachePath, true, cacheMagic);
 		if (g_programBinaryCache == nullptr)
 			cemuLog_log(LogType::Force, "Unable to open OpenGL precompiled cache {}", cacheFilename);
--- a/src/Cafe/HW/Latte/Renderer/Renderer.cpp
+++ b/src/Cafe/HW/Latte/Renderer/Renderer.cpp
@@ -133,7 +133,7 @@ void Renderer::SaveScreenshot(const std::vector<uint8>& rgb_data, int width, int
 		// save to png file
 		if (save_screenshot)
 		{
-			fs::path screendir = ActiveSettings::GetPath("screenshots");
+			fs::path screendir = ActiveSettings::GetDataPath("screenshots");
 			if (!fs::exists(screendir))
 				fs::create_directory(screendir);
 
--- a/src/Cafe/HW/Latte/Renderer/Vulkan/RendererShaderVk.cpp
+++ b/src/Cafe/HW/Latte/Renderer/Vulkan/RendererShaderVk.cpp
@@ -456,7 +456,7 @@ void RendererShaderVk::ShaderCacheLoading_begin(uint64 cacheTitleId)
 	}
 	uint32 spirvCacheMagic = GeneratePrecompiledCacheId();
 	const std::string cacheFilename = fmt::format("{:016x}_spirv.bin", cacheTitleId);
-	const std::wstring cachePath = ActiveSettings::GetPath("shaderCache/precompiled/{}", cacheFilename).generic_wstring();
+	const std::wstring cachePath = ActiveSettings::GetCachePath("shaderCache/precompiled/{}", cacheFilename).generic_wstring();
 	s_spirvCache = FileCache::Open(cachePath, true, spirvCacheMagic);
 	if (s_spirvCache == nullptr)
 		cemuLog_log(LogType::Force, "Unable to open SPIR-V cache {}", cacheFilename);
--- a/src/Cafe/HW/Latte/Renderer/Vulkan/VulkanPipelineStableCache.cpp
+++ b/src/Cafe/HW/Latte/Renderer/Vulkan/VulkanPipelineStableCache.cpp
@@ -32,8 +32,8 @@ VulkanPipelineStableCache& VulkanPipelineStableCache::GetInstance()
 uint32 VulkanPipelineStableCache::BeginLoading(uint64 cacheTitleId)
 {
 	std::error_code ec;
-	fs::create_directories(ActiveSettings::GetPath("shaderCache/transferable"), ec);
-	const auto pathCacheFile = ActiveSettings::GetPath("shaderCache/transferable/{:016x}_vkpipeline.bin", cacheTitleId);
+	fs::create_directories(ActiveSettings::GetCachePath("shaderCache/transferable"), ec);
+	const auto pathCacheFile = ActiveSettings::GetCachePath("shaderCache/transferable/{:016x}_vkpipeline.bin", cacheTitleId);
 	
 	// init cache loader state
 	g_vkCacheState.pipelineLoadIndex = 0;
--- a/src/Cafe/HW/Latte/Renderer/Vulkan/VulkanRenderer.cpp
+++ b/src/Cafe/HW/Latte/Renderer/Vulkan/VulkanRenderer.cpp
@@ -2303,7 +2303,7 @@ void VulkanRenderer::WaitCommandBufferFinished(uint64 commandBufferId)
 
 void VulkanRenderer::PipelineCacheSaveThread(size_t cache_size)
 {
-	const auto dir = ActiveSettings::GetPath("shaderCache/driver/vk");
+	const auto dir = ActiveSettings::GetCachePath("shaderCache/driver/vk");
 	if (!fs::exists(dir))
 	{
 		try
@@ -2380,7 +2380,7 @@ void VulkanRenderer::PipelineCacheSaveThread(size_t cache_size)
 void VulkanRenderer::CreatePipelineCache()
 {
 	std::vector<uint8_t> cacheData;
-	const auto dir = ActiveSettings::GetPath("shaderCache/driver/vk");
+	const auto dir = ActiveSettings::GetCachePath("shaderCache/driver/vk");
 	if (fs::exists(dir))
 	{
 		const auto filename = dir / fmt::format("{:016x}.bin", CafeSystem::GetForegroundTitleId());
--- a/src/Cafe/HW/MMU/MMU.cpp
+++ b/src/Cafe/HW/MMU/MMU.cpp
@@ -409,7 +409,7 @@ void memory_writeDumpFile(uint32 startAddr, uint32 size, const fs::path& path)
 void memory_createDump()
 {
 	const uint32 pageSize = MemMapper::GetPageSize();
-	fs::path path = ActiveSettings::GetPath("dump/ramDump{:}", (uint32)time(nullptr));
+	fs::path path = ActiveSettings::GetDataPath("dump/ramDump{:}", (uint32)time(nullptr));
 	fs::create_directories(path);
 
 	for (auto& itr : g_mmuRanges)
--- a/src/Cafe/IOSU/legacy/iosu_crypto.cpp
+++ b/src/Cafe/IOSU/legacy/iosu_crypto.cpp
@@ -563,7 +563,7 @@ void iosuCrypto_loadSSLCertificates()
 void iosuCrypto_init()
 {
 	// load OTP dump
-	if (std::ifstream otp_file(ActiveSettings::GetPath("otp.bin"), std::ifstream::in | std::ios::binary); otp_file.is_open())
+	if (std::ifstream otp_file(ActiveSettings::GetDataPath("otp.bin"), std::ifstream::in | std::ios::binary); otp_file.is_open())
 	{
 		otp_file.seekg(0, std::ifstream::end);
 		const auto length = otp_file.tellg();
@@ -586,7 +586,7 @@ void iosuCrypto_init()
 		hasOtpMem = false;
 	}
 
-	if (std::ifstream seeprom_file(ActiveSettings::GetPath("seeprom.bin"), std::ifstream::in | std::ios::binary); seeprom_file.is_open())
+	if (std::ifstream seeprom_file(ActiveSettings::GetDataPath("seeprom.bin"), std::ifstream::in | std::ios::binary); seeprom_file.is_open())
 	{
 		seeprom_file.seekg(0, std::ifstream::end);
 		const auto length = seeprom_file.tellg();
@@ -630,13 +630,13 @@ sint32 iosuCrypt_checkRequirementsForOnlineMode(std::wstring& additionalErrorInf
 {
 	std::error_code ec;
 	// check if otp.bin is present
-	const auto otp_file = ActiveSettings::GetPath("otp.bin");
+	const auto otp_file = ActiveSettings::GetDataPath("otp.bin");
 	if(!fs::exists(otp_file, ec))
 		return IOS_CRYPTO_ONLINE_REQ_OTP_MISSING;
 	if(fs::file_size(otp_file, ec) != 1024)
 		return IOS_CRYPTO_ONLINE_REQ_OTP_CORRUPTED;
 	// check if seeprom.bin is present
-	const auto seeprom_file = ActiveSettings::GetPath("seeprom.bin");
+	const auto seeprom_file = ActiveSettings::GetDataPath("seeprom.bin");
 	if (!fs::exists(seeprom_file, ec))
 		return IOS_CRYPTO_ONLINE_REQ_SEEPROM_MISSING;
 	if (fs::file_size(seeprom_file, ec) != 512)
--- a/src/Cafe/OS/RPL/rpl.cpp
+++ b/src/Cafe/OS/RPL/rpl.cpp
@@ -2122,7 +2122,7 @@ void RPLLoader_LoadDependency(rplDependency_t* dependency)
 	// attempt to load rpl from Cemu's /cafeLibs/ directory
 	if (ActiveSettings::LoadSharedLibrariesEnabled())
 	{
-		const auto filePath = ActiveSettings::GetPath("cafeLibs/{}", dependency->filepath);
+		const auto filePath = ActiveSettings::GetDataPath("cafeLibs/{}", dependency->filepath);
 		auto fileData = FileStream::LoadIntoMemory(filePath);
 		if (fileData)
 		{
--- a/src/Cafe/OS/libs/coreinit/coreinit_FS.cpp
+++ b/src/Cafe/OS/libs/coreinit/coreinit_FS.cpp
@@ -107,7 +107,7 @@ namespace coreinit
 			return;
 
 		std::error_code ec;
-		const auto path = ActiveSettings::GetPath("sdcard/");
+		const auto path = ActiveSettings::GetDataPath("sdcard/");
 		fs::create_directories(path, ec);
 		FSCDeviceHostFS_Mount("/vol/external01", path.generic_wstring().c_str() , FSC_PRIORITY_BASE);
 
@@ -140,7 +140,7 @@ namespace coreinit
 				return FS_RESULT::ERR_PLACEHOLDER;
 
 			std::error_code ec;
-			const auto path = ActiveSettings::GetPath("sdcard/");
+			const auto path = ActiveSettings::GetDataPath("sdcard/");
 			fs::create_directories(path, ec);
 			if (!FSCDeviceHostFS_Mount(mountPathOut, path.generic_wstring().c_str(), FSC_PRIORITY_BASE))
 				return FS_RESULT::ERR_PLACEHOLDER;
--- a/src/Cemu/Logging/CemuLogging.cpp
+++ b/src/Cemu/Logging/CemuLogging.cpp
@@ -98,7 +98,7 @@ void cemuLog_createLogFile(bool triggeredByCrash)
 	if (LogContext.file_stream.is_open())
 		return;
 
-	const auto path = ActiveSettings::GetPath("log.txt");
+	const auto path = ActiveSettings::GetDataPath("log.txt");
 	LogContext.file_stream.open(path, std::ios::out);
 	if (LogContext.file_stream.fail())
 	{
--- a/src/config/ActiveSettings.cpp
+++ b/src/config/ActiveSettings.cpp
@@ -18,7 +18,7 @@ void ActiveSettings::LoadOnce()
 	s_path = s_full_path.parent_path();
 	s_filename = s_full_path.filename();
 
-	g_config.SetFilename(GetPath("settings.xml").generic_wstring());
+	g_config.SetFilename(GetConfigPath("settings.xml").generic_wstring());
 	g_config.Load();
 
 	std::wstring additionalErrorInfo;
@@ -220,8 +220,59 @@ fs::path ActiveSettings::GetMlcPath()
 	return GetDefaultMLCPath();
 }
 
-fs::path ActiveSettings::GetDefaultMLCPath()
+#ifdef XDG
+std::string ActiveSettings::GetXDGPath(const char* envVar, const std::string& defaultValue)
+{
+	auto raw_value = std::getenv(envVar);
+	return !raw_value || std::strlen(raw_value) == 0 ? defaultValue : std::string(raw_value);
+}
+#endif
+
+fs::path ActiveSettings::GetConfigPath()
+{
+#ifdef XDG
+	auto config_home = GetXDGPath("XDG_CONFIG_HOME", fmt::format("{}/.config", std::getenv("HOME")));
+	auto dir = fs::path(fmt::format("{}/cemu", config_home));
+	if (!fs::exists(dir))
+		fs::create_directories(dir);
+	return dir;
+#endif
+	return s_full_path;
+}
+
+fs::path ActiveSettings::GetCachePath()
+{
+#ifdef XDG
+	auto config_home = GetXDGPath("XDG_CACHE_HOME", fmt::format("{}/.cache", std::getenv("HOME")));
+	auto dir = fs::path(fmt::format("{}/cemu", config_home));
+	if (!fs::exists(dir))
+		fs::create_directories(dir);
+	return dir;
+#endif
+	return s_full_path;
+}
+
+fs::path ActiveSettings::GetDataPath()
+{
+#ifdef XDG
+	auto config_home = GetXDGPath("XDG_DATA_HOME", fmt::format("{}/.local/share", std::getenv("HOME")));
+	auto dir = fs::path(fmt::format("{}/cemu", config_home));
+	if (!fs::exists(dir))
+		fs::create_directories(dir);
+	return dir;
+#endif
+	return s_full_path;
+}
+
+fs::path ActiveSettings::GetSystemDataPath()
 {
-	return GetPath("mlc01");
+#ifdef SYSTEM_DATA_PATH
+	return fs::path(SYSTEM_DATA_PATH);
+#endif
+	return s_full_path;
 }
 
+fs::path ActiveSettings::GetDefaultMLCPath()
+{
+	return GetDataPath("mlc01");
+}
--- a/src/config/ActiveSettings.h
+++ b/src/config/ActiveSettings.h
@@ -13,6 +13,11 @@ public:
 	[[nodiscard]] static fs::path GetFilename() { return s_filename; }
 	
 	[[nodiscard]] static fs::path GetMlcPath();
+	[[nodiscard]] static fs::path GetCachePath();
+	[[nodiscard]] static fs::path GetConfigPath();
+	[[nodiscard]] static fs::path GetDataPath();
+	[[nodiscard]] static fs::path GetSystemDataPath();
+	[[nodiscard]] static std::string GetXDGPath(const char* envVar, const std::string& defaultValue);
 
 	[[nodiscard]] static fs::path GetPath(std::string_view p) 
 	{
@@ -57,6 +62,62 @@ public:
 		return GetMlcPath() / fmt::format(format, std::forward<TArgs>(args)...);
 	}
 	
+	template <typename ...TArgs>
+	[[nodiscard]] static fs::path GetCachePath(std::string_view format, TArgs&&... args)
+	{
+		cemu_assert_debug(format.empty() || (format[0] != L'/' && format[0] != L'\\'));
+		return GetCachePath() / fmt::format(format, std::forward<TArgs>(args)...);
+	}
+
+	template <typename ...TArgs>
+	[[nodiscard]] static fs::path GetCachePath(std::wstring_view format, TArgs&&... args)
+	{
+		cemu_assert_debug(format.empty() || (format[0] != L'/' && format[0] != L'\\'));
+		return GetCachePath() / fmt::format(format, std::forward<TArgs>(args)...);
+	}
+
+	template <typename ...TArgs>
+	[[nodiscard]] static fs::path GetConfigPath(std::string_view format, TArgs&&... args)
+	{
+		cemu_assert_debug(format.empty() || (format[0] != L'/' && format[0] != L'\\'));
+		return GetConfigPath() / fmt::format(format, std::forward<TArgs>(args)...);
+	}
+
+	template <typename ...TArgs>
+	[[nodiscard]] static fs::path GetConfigPath(std::wstring_view format, TArgs&&... args)
+	{
+		cemu_assert_debug(format.empty() || (format[0] != L'/' && format[0] != L'\\'));
+		return GetConfigPath() / fmt::format(format, std::forward<TArgs>(args)...);
+	}
+
+	template <typename ...TArgs>
+	[[nodiscard]] static fs::path GetDataPath(std::string_view format, TArgs&&... args)
+	{
+		cemu_assert_debug(format.empty() || (format[0] != L'/' && format[0] != L'\\'));
+		return GetDataPath() / fmt::format(format, std::forward<TArgs>(args)...);
+	}
+
+	template <typename ...TArgs>
+	[[nodiscard]] static fs::path GetDataPath(std::wstring_view format, TArgs&&... args)
+	{
+		cemu_assert_debug(format.empty() || (format[0] != L'/' && format[0] != L'\\'));
+		return GetDataPath() / fmt::format(format, std::forward<TArgs>(args)...);
+	}
+
+	template<typename ...TArgs>
+	[[nodiscard]] static fs::path GetSystemDataPath(std::string_view format, TArgs&&... args)
+	{
+		cemu_assert_debug(format.empty() || (format[0] != L'/' && format[0] != L'\\'));
+		return GetSystemDataPath() / fmt::format(format, std::forward<TArgs>(args)...);
+	}
+
+	template<typename ...TArgs>
+	[[nodiscard]] static fs::path GetSystemDataPath(std::wstring_view format, TArgs&&... args)
+	{
+		cemu_assert_debug(format.empty() || (format[0] != L'/' && format[0] != L'\\'));
+		return GetSystemDataPath() / fmt::format(format, std::forward<TArgs>(args)...);
+	}
+
 	// get mlc path to default cemu root dir/mlc01
 	[[nodiscard]] static fs::path GetDefaultMLCPath();
 
@@ -126,4 +187,3 @@ private:
 
 	inline static bool s_has_required_online_files = false;
 };
-
--- a/src/gui/CemuApp.cpp
+++ b/src/gui/CemuApp.cpp
@@ -115,7 +115,7 @@ bool CemuApp::OnInit()
 
 	Bind(wxEVT_ACTIVATE_APP, &CemuApp::ActivateApp, this);
 
-	if (!TestWriteAccess(ActiveSettings::GetPath()))
+	if (!TestWriteAccess(ActiveSettings::GetConfigPath()))
 		wxMessageBox(_("Cemu can't write to its directory.\nPlease move it to a different location or run Cemu as administrator!"), _("Warning"), wxOK | wxCENTRE | wxICON_EXCLAMATION, nullptr);
 
 	auto& config = GetConfig();
@@ -183,7 +183,7 @@ int CemuApp::FilterEvent(wxEvent& event)
 
 std::vector<const wxLanguageInfo*> CemuApp::GetAvailableLanguages()
 {
-	const auto path = ActiveSettings::GetPath("resources");
+	const auto path = ActiveSettings::GetSystemDataPath("resources");
 	if (!exists(path))
 		return {};
 	
@@ -308,11 +308,15 @@ void CemuApp::CreateDefaultFiles(bool first_start)
 	// cemu directories
 	try
 	{
-		const auto controllerProfileFolder = GetCemuPath(L"controllerProfiles").ToStdWstring();
+		const auto controllerProfileFolder = ActiveSettings::GetConfigPath(L"controllerProfiles").generic_wstring();
 		if (!fs::exists(controllerProfileFolder))
 			fs::create_directories(controllerProfileFolder);
 
-		const auto memorySearcherFolder = GetCemuPath(L"memorySearcher").ToStdWstring();
+		const auto gameProfileFolder = ActiveSettings::GetConfigPath(L"gameProfiles").generic_wstring();
+		if (!fs::exists(gameProfileFolder))
+			fs::create_directories(gameProfileFolder);
+
+		const auto memorySearcherFolder = ActiveSettings::GetConfigPath(L"memorySearcher").generic_wstring();
 		if (!fs::exists(memorySearcherFolder))
 			fs::create_directories(memorySearcherFolder);
 	}
@@ -398,5 +402,3 @@ void CemuApp::ActivateApp(wxActivateEvent& event)
 	g_window_info.app_active = event.GetActive();
 	event.Skip();
 }
-
-
--- a/src/gui/ChecksumTool.cpp
+++ b/src/gui/ChecksumTool.cpp
@@ -133,7 +133,7 @@ ChecksumTool::ChecksumTool(wxWindow* parent, wxTitleManagerList::TitleEntry& ent
 				const auto title_id_str = fmt::format("{:016x}", m_json_entry.title_id);
 				const auto default_file = fmt::format("{}_v{}.json", title_id_str, m_info.GetAppTitleVersion());
 
-				const auto checksum_path = ActiveSettings::GetPath("resources/checksums/{}", default_file);
+				const auto checksum_path = ActiveSettings::GetDataPath("resources/checksums/{}", default_file);
 				if (exists(checksum_path))
 					m_verify_online->Enable();
 			}
@@ -185,7 +185,7 @@ void ChecksumTool::LoadOnlineData() const
 
 		std::string latest_commit;
 
-		const auto checksum_path = ActiveSettings::GetPath("resources/checksums");
+		const auto checksum_path = ActiveSettings::GetDataPath("resources/checksums");
 		if (exists(checksum_path))
 		{
 			std::string current_commit;
@@ -593,7 +593,7 @@ void ChecksumTool::OnVerifyOnline(wxCommandEvent& event)
 	const auto title_id_str = fmt::format("{:016x}", m_json_entry.title_id);
 	const auto default_file = fmt::format("{}_v{}.json", title_id_str, m_info.GetAppTitleVersion());
 	
-	const auto checksum_path = ActiveSettings::GetPath("resources/checksums/{}", default_file);
+	const auto checksum_path = ActiveSettings::GetDataPath("resources/checksums/{}", default_file);
 	if(!exists(checksum_path))
 		return;
 	
--- a/src/gui/DownloadGraphicPacksWindow.cpp
+++ b/src/gui/DownloadGraphicPacksWindow.cpp
@@ -65,7 +65,7 @@ bool DownloadGraphicPacksWindow::curlDownloadFile(const char *url, curlDownloadF
 bool checkGraphicPackDownloadedVersion(const char* nameVersion, bool& hasVersionFile)
 {
 	hasVersionFile = false;
-	const auto path = ActiveSettings::GetPath("graphicPacks/downloadedGraphicPacks/version.txt");
+	const auto path = ActiveSettings::GetDataPath("graphicPacks/downloadedGraphicPacks/version.txt");
 	std::unique_ptr<FileStream> file(FileStream::openFile2(path));
 
 	std::string versionInFile;
@@ -78,7 +78,7 @@ bool checkGraphicPackDownloadedVersion(const char* nameVersion, bool& hasVersion
 
 void createGraphicPackDownloadedVersionFile(const char* nameVersion)
 {
-	const auto path = ActiveSettings::GetPath("graphicPacks/downloadedGraphicPacks/version.txt");
+	const auto path = ActiveSettings::GetDataPath("graphicPacks/downloadedGraphicPacks/version.txt");
 	std::unique_ptr<FileStream> file(FileStream::createFile2(path));
 	if (file)
 		file->writeString(nameVersion);
@@ -90,7 +90,7 @@ void createGraphicPackDownloadedVersionFile(const char* nameVersion)
 
 void deleteDownloadedGraphicPacks()
 {
-	const auto path = ActiveSettings::GetPath("graphicPacks/downloadedGraphicPacks");
+	const auto path = ActiveSettings::GetDataPath("graphicPacks/downloadedGraphicPacks");
 	std::error_code er;
 	if (!fs::exists(path, er))
 		return;
@@ -238,7 +238,7 @@ void DownloadGraphicPacksWindow::UpdateThread()
 		return;
 	}
 
-	auto path = ActiveSettings::GetPath("graphicPacks/downloadedGraphicPacks");
+	auto path = ActiveSettings::GetDataPath("graphicPacks/downloadedGraphicPacks");
 	std::error_code er;
 	//fs::remove_all(path, er); -> Don't delete the whole folder and recreate it immediately afterwards because sometimes it just fails
 	deleteDownloadedGraphicPacks();
@@ -258,7 +258,7 @@ void DownloadGraphicPacksWindow::UpdateThread()
 			std::strstr(sb.name, "..\\") != nullptr)
 			continue; // bad path
 
-		path = ActiveSettings::GetPath("graphicPacks/downloadedGraphicPacks/{}", sb.name);
+		path = ActiveSettings::GetDataPath("graphicPacks/downloadedGraphicPacks/{}", sb.name);
 
 		size_t sbNameLen = strlen(sb.name);
 		if(sbNameLen == 0)
--- a/src/gui/MainWindow.cpp
+++ b/src/gui/MainWindow.cpp
@@ -997,7 +997,7 @@ void MainWindow::OnDebugSetting(wxCommandEvent& event)
 		{
 			try
 			{
-				const auto path = CemuApp::GetCemuPath(L"dump\\curl").ToStdWstring();
+				const auto path = ActiveSettings::GetDataPath(L"dump/curl").generic_wstring();
 				fs::create_directories(path);
 			}
 			catch (const std::exception& ex)
@@ -1054,8 +1054,8 @@ void MainWindow::OnDebugDumpUsedTextures(wxCommandEvent& event)
 		try
 		{
 			// create directory
-			const auto path = CemuApp::GetCemuPath(L"dump\\textures");
-			fs::create_directories(path.ToStdWstring());
+			const auto path = ActiveSettings::GetDataPath(L"dump/textures");
+			fs::create_directories(path.generic_wstring());
 		}
 		catch (const std::exception& ex)
 		{
@@ -1075,8 +1075,8 @@ void MainWindow::OnDebugDumpUsedShaders(wxCommandEvent& event)
 		try
 		{
 			// create directory
-			const auto path = CemuApp::GetCemuPath(L"dump\\shaders");
-			fs::create_directories(path.ToStdWstring());
+			const auto path = ActiveSettings::GetDataPath(L"dump/shaders");
+			fs::create_directories(path.generic_wstring());
 		}
 		catch (const std::exception & ex)
 		{
--- a/src/gui/MemorySearcherTool.cpp
+++ b/src/gui/MemorySearcherTool.cpp
@@ -270,7 +270,7 @@ void MemorySearcherTool::OnFilter(wxCommandEvent& event)
 
 void MemorySearcherTool::Load()
 {
-	const auto memorySearcherPath = ActiveSettings::GetPath("memorySearcher/{:016x}.ini", CafeSystem::GetForegroundTitleId());
+	const auto memorySearcherPath = ActiveSettings::GetConfigPath("memorySearcher/{:016x}.ini", CafeSystem::GetForegroundTitleId());
 	auto memSearcherIniContents = FileStream::LoadIntoMemory(memorySearcherPath);
 	if (!memSearcherIniContents)
 		return;
@@ -322,7 +322,7 @@ void MemorySearcherTool::Load()
 
 void MemorySearcherTool::Save()
 {
-	const auto memorySearcherPath = ActiveSettings::GetPath("memorySearcher/{:016x}.ini", CafeSystem::GetForegroundTitleId());
+	const auto memorySearcherPath = ActiveSettings::GetConfigPath("memorySearcher/{:016x}.ini", CafeSystem::GetForegroundTitleId());
 	FileStream* fs = FileStream::createFile2(memorySearcherPath);
 	if (fs)
 	{
--- a/src/gui/debugger/DebuggerWindow2.cpp
+++ b/src/gui/debugger/DebuggerWindow2.cpp
@@ -272,7 +272,7 @@ DebuggerWindow2::DebuggerWindow2(wxFrame& parent, const wxRect& display_size)
 {
 	this->wxWindowBase::SetBackgroundColour(*wxWHITE);
 
-	const auto file = ActiveSettings::GetPath("debugger/config.xml");
+	const auto file = ActiveSettings::GetConfigPath("debugger/config.xml");
 	m_config.SetFilename(file.generic_wstring());
 	m_config.Load();
 
@@ -472,7 +472,7 @@ bool DebuggerWindow2::Show(bool show)
 std::wstring DebuggerWindow2::GetModuleStoragePath(std::string module_name, uint32_t crc_hash) const
 {
 	if (module_name.empty() || crc_hash == 0) return std::wstring();
-	return ActiveSettings::GetPath("debugger/{}_{:#10x}.xml", module_name, crc_hash).generic_wstring();
+	return ActiveSettings::GetConfigPath("debugger/{}_{:#10x}.xml", module_name, crc_hash).generic_wstring();
 }
 
 void DebuggerWindow2::OnBreakpointHit(wxCommandEvent& event)
--- a/src/gui/input/InputSettings2.cpp
+++ b/src/gui/input/InputSettings2.cpp
@@ -669,10 +669,10 @@ void InputSettings2::on_profile_delete(wxCommandEvent& event)
 	}
 	try
 	{
-		const fs::path old_path = ActiveSettings::GetPath(fmt::format("controllerProfiles/{}.txt", selection));
+		const fs::path old_path = ActiveSettings::GetConfigPath(fmt::format("controllerProfiles/{}.txt", selection));
 		fs::remove(old_path);
 
-		const fs::path path = ActiveSettings::GetPath(fmt::format("controllerProfiles/{}.xml", selection));
+		const fs::path path = ActiveSettings::GetConfigPath(fmt::format("controllerProfiles/{}.xml", selection));
 		fs::remove(path);
 
 		profile_names->ChangeValue(kDefaultProfileName);
--- a/src/input/InputManager.cpp
+++ b/src/input/InputManager.cpp
@@ -76,9 +76,9 @@ bool InputManager::load(size_t player_index, std::string_view filename)
 {
 	fs::path file_path;
 	if (filename.empty())
-		file_path = ActiveSettings::GetPath(fmt::format("controllerProfiles/controller{}", player_index));
+		file_path = ActiveSettings::GetConfigPath(fmt::format("controllerProfiles/controller{}", player_index));
 	else
-		file_path = ActiveSettings::GetPath(fmt::format("controllerProfiles/{}", filename));
+		file_path = ActiveSettings::GetConfigPath(fmt::format("controllerProfiles/{}", filename));
 
 	auto old_file = file_path;
 	old_file.replace_extension(".txt"); // test .txt extension
@@ -448,7 +448,7 @@ bool InputManager::save(size_t player_index, std::string_view filename)
 	if (!emulated_controller)
 		return false;
 
-	fs::path file_path = ActiveSettings::GetPath("controllerProfiles");
+	fs::path file_path = ActiveSettings::GetConfigPath("controllerProfiles");
 	fs::create_directories(file_path);
 
 	const auto is_default_file = filename.empty();
@@ -664,8 +664,8 @@ EmulatedControllerPtr InputManager::delete_controller(size_t player_index, bool
 			if(delete_profile)
 			{
 				std::error_code ec{};
-				fs::remove(ActiveSettings::GetPath(fmt::format("controllerProfiles/controller{}.xml", player_index)), ec);
-				fs::remove(ActiveSettings::GetPath(fmt::format("controllerProfiles/controller{}.txt", player_index)), ec);
+				fs::remove(ActiveSettings::GetConfigPath(fmt::format("controllerProfiles/controller{}.xml", player_index)), ec);
+				fs::remove(ActiveSettings::GetConfigPath(fmt::format("controllerProfiles/controller{}.txt", player_index)), ec);
 			}
 
 			return result;
@@ -680,8 +680,8 @@ EmulatedControllerPtr InputManager::delete_controller(size_t player_index, bool
 			controller = {};
 
 			std::error_code ec{};
-			fs::remove(ActiveSettings::GetPath(fmt::format("controllerProfiles/controller{}.xml", player_index)), ec);
-			fs::remove(ActiveSettings::GetPath(fmt::format("controllerProfiles/controller{}.txt", player_index)), ec);
+			fs::remove(ActiveSettings::GetConfigPath(fmt::format("controllerProfiles/controller{}.xml", player_index)), ec);
+			fs::remove(ActiveSettings::GetConfigPath(fmt::format("controllerProfiles/controller{}.txt", player_index)), ec);
 
 			return result;
 		}
@@ -782,7 +782,7 @@ void InputManager::apply_game_profile()
 
 std::vector<std::string> InputManager::get_profiles()
 {
-	const auto path = ActiveSettings::GetPath("controllerProfiles");
+	const auto path = ActiveSettings::GetConfigPath("controllerProfiles");
 	if (!exists(path))
 		return {};
 
--- a/src/main.cpp
+++ b/src/main.cpp
@@ -160,7 +160,7 @@ void _putenvSafe(const char* c)
 void reconfigureGLDrivers()
 {
 	// reconfigure GL drivers to store 
-	const fs::path nvCacheDir = ActiveSettings::GetPath("shaderCache/driver/nvidia/");
+	const fs::path nvCacheDir = ActiveSettings::GetCachePath("shaderCache/driver/nvidia/");
 
 	std::error_code err;
 	fs::create_directories(nvCacheDir, err);
@@ -242,7 +242,7 @@ void unitTests()
 
 int mainEmulatorHLE()
 {
-	if (!TestWriteAccess(ActiveSettings::GetPath()))
+	if (!TestWriteAccess(ActiveSettings::GetConfigPath()))
 		wxMessageBox("Cemu doesn't have write access to it's own directory.\nPlease move it to a different location or run Cemu as administrator!", "Warning", wxOK|wxICON_ERROR); // todo - different error messages per OS
 	LatteOverlay_init();
 	// run a couple of tests if in non-release mode
@@ -264,7 +264,7 @@ int mainEmulatorHLE()
 	// init Cafe system (todo - the stuff above should be part of this too)
 	CafeSystem::Initialize();
 	// init title list
-	CafeTitleList::Initialize(ActiveSettings::GetPath("title_list_cache.xml"));
+	CafeTitleList::Initialize(ActiveSettings::GetCachePath("title_list_cache.xml"));
 	for (auto& it : GetConfig().game_paths)
 		CafeTitleList::AddScanPath(it);
 	fs::path mlcPath = ActiveSettings::GetMlcPath();
--- a/src/util/libusbWrapper/libusbWrapper.cpp
+++ b/src/util/libusbWrapper/libusbWrapper.cpp
@@ -18,7 +18,7 @@ void libusbWrapper::init()
 	m_module = LoadLibraryW(L"libusb-1.0.dll");
 	if (!m_module)
 	{
-		const auto path = ActiveSettings::GetPath("resources/libusb-1.0.dll");
+		const auto path = ActiveSettings::GetSystemDataPath("resources/libusb-1.0.dll");
 		m_module = LoadLibraryW(path.generic_wstring().c_str());
 		if (!m_module)
 		{
EOF
}
