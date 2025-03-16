# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=azahar
pkgver=2120.rc1
pkgrel=1
pkgdesc="An open-source 3DS emulator project based on Citra."
arch=('x86_64')
url="https://github.com/azahar-emu/azahar"
license=('GPL-2.0-or-later')
depends=('glibc' 'gcc-libs' 'qt6-base' 'catch2' 'crypto++' 'fmt' 'glslang' 'libinih' 'libusb' 'openal' 'openssl' 'sdl2' 'soundtouch' 'zstd'
	 'qt6-multimedia' 'zydis' 'hicolor-icon-theme')
makedepends=('git' 'cmake' 'ninja' 'vulkan-headers' 'rapidjson' 'doxygen')
_commit=9f831391185c2f6dd915560bfe1ff8fc39761b5e
source=("git+$url.git#commit=$_commit"
	boost::git+https://github.com/azahar-emu/ext-boost.git
	git+https://github.com/neobrain/nihstro.git
	git+https://codeberg.org/soundtouch/soundtouch.git
	catch2::git+https://github.com/catchorg/Catch2
	git+https://github.com/azahar-emu/dynarmic.git
	git+https://github.com/herumi/xbyak.git
	git+https://github.com/fmtlib/fmt.git
	git+https://github.com/lsalzman/enet.git
	git+https://github.com/benhoyt/inih.git
	libressl::git+https://github.com/azahar-emu/ext-libressl-portable.git
	git+https://github.com/libusb/libusb.git
	git+https://github.com/mozilla/cubeb
	git+https://github.com/azahar-emu/discord-rpc.git
	git+https://github.com/arun11299/cpp-jwt.git
	git+https://github.com/wwylele/teakra.git
	git+https://github.com/lvandeve/lodepng.git
	git+https://github.com/facebook/zstd.git
	git+https://github.com/lemenkov/libyuv.git
	sdl2::git+https://github.com/libsdl-org/SDL
	git+https://github.com/abdes/cryptopp-cmake.git
	git+https://github.com/weidai11/cryptopp.git
	git+https://github.com/septag/dds-ktx
	git+https://github.com/kcat/openal-soft
	git+https://github.com/KhronosGroup/glslang
	vma::git+https://github.com/GPUOpen-LibrariesAndSDKs/VulkanMemoryAllocator
	vulkan-headers::git+https://github.com/KhronosGroup/Vulkan-Headers
	git+https://github.com/azahar-emu/sirit
	git+https://github.com/knik0/faad2
	library-headers::git+https://github.com/azahar-emu/ext-library-headers.git
	git+https://github.com/bylaws/libadrenotools
        git+https://github.com/merryhime/oaknut.git
        git+https://github.com/azahar-emu/compatibility-list
	#cubeb submodules
	git+https://github.com/google/googletest
	git+https://github.com/arsenm/sanitizers-cmake
	git+https://github.com/mozilla/cubeb-coreaudio-rs
	git+https://github.com/mozilla/cubeb-pulse-rs
	#dynarmic zydis submodules
	git+https://github.com/zyantific/zycore-c
	#libadrenotools submodules
	git+https://github.com/bylaws/liblinkernsbypass
	#sirit submodules
	git+https://github.com/KhronosGroup/SPIRV-Headers
)
sha256sums=('10a9d20b801e6df2b91de44f97f0c1be42081935a0bb1de48934aa9d1f289a8c'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')
validpgpkeys=()

prepare() {
	cd "$srcdir/$pkgname"
	git submodule init
	for submodule in {boost,nihstro,soundtouch,catch2,dynarmic,xbyak,fmt,enet,inih,libressl,libusb,cubeb,discord-rpc,cpp-jwt,teakra,zstd,libyuv,sdl2,cryptopp-cmake,cryptopp,dds-ktx,openal-soft,glslang,vma,vulkan-headers,sirit,faad2,library-headers,libadrenotools,oaknut,compatibility-list};
	do
		git config submodule.$submodule.url "$srcdir/$submodule"
	done
	git -c protocol.file.allow=always submodule update

	pushd "$srcdir/$pkgname/externals/cubeb"
	git submodule init
	git config submodule.googletest.url "$srcdir/googletest"
	git config submodule.cmake/sanitizers-cmake.url "$srcdir/sanitizers-cmake"
	git config submodule.src/cubeb-coreaudio-rs.url "$srcdir/cubeb-coreaudio-rs"
	git config submodule.src/cubeb-pulse-rs.url "$srcdir/cubeb-pulse-rs"
	git -c protocol.file.allow=always submodule update
	popd
	pushd "$srcdir/$pkgname/externals/dynarmic/externals/zydis"
	git submodule init
	git config submodule.dependencies/zycore.url "$srcdir/zycore-c"
	git -c protocol.file.allow=always submodule update
	popd
	pushd "$srcdir/$pkgname/externals/libadrenotools"
	git submodule init
	git config submodule.lib/linkernsbypass.url "$srcdir/liblinkernsbypass"
	git -c protocol.file.allow=always submodule update
	popd
	pushd "$srcdir/$pkgname/externals/sirit"
	git submodule init
	git config submodule.externals/SPIRV-Headers.url "$srcdir/SPIRV-Headers"
	git -c protocol.file.allow=always submodule update
	popd
}

build() {
	cd "$srcdir"
	CFLAGS="$(echo $CFLAGS | sed 's/-Wp,-D_FORTIFY_SOURCE=3 //g')"
	CXXFLAGS="$(echo $CXXFLAGS | sed 's/-Wp,-D_FORTIFY_SOURCE=3 //g')"
	cmake -B build -S "$pkgname" -G Ninja \
	-DCMAKE_INSTALL_PREFIX=/usr \
	-DCMAKE_BUILD_TYPE=None \
	-DUSE_DISCORD_PRESENCE=ON \
	-DUSE_SYSTEM_BOOST=OFF \
	-DUSE_SYSTEM_CATCH2=ON \
	-DUSE_SYSTEM_CRYPTOPP=ON \
	-DUSE_SYSTEM_FFMPEG_HEADERS=OFF \
	-DUSE_SYSTEM_FMT=ON \
	-DUSE_SYSTEM_GLSLANG=ON \
	-DUSE_SYSTEM_INIH=ON \
	-DUSE_SYSTEM_LIBUSB=ON \
	-DUSE_SYSTEM_OPENAL=ON \
	-DUSE_SYSTEM_OPENSSL=ON \
	-DUSE_SYSTEM_SDL2=ON \
	-DUSE_SYSTEM_SOUNDTOUCH=ON \
	-DUSE_SYSTEM_VULKAN_HEADERS=ON \
	-DUSE_SYSTEM_ZSTD=ON \
	-Wno-dev

	cmake --build build
}


package() {
	cd "$srcdir"
	DESTDIR="$pkgdir" cmake --install build
}
