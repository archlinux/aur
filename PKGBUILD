# Maintainer: Anuskuss <anuskuss@googlemail.com>
pkgname=cemu
pkgver=2.0.128
pkgrel=1
pkgdesc='Software to emulate Wii U games and applications on PC (with cutting edge Linux patches)'
arch=(x86_64)
url=https://cemu.info
license=(MPL2)
depends=(
	# unbundled vcpkg
	'sdl2>=2.0.22' 'pugixml>=1.12.1' 'libzip>=1.9.2' 'libpng>=1.6.37' 'wxwidgets-gtk3>=3.2.0'
)
makedepends=(
	# pkgbuild
	git 'cmake>=3.21.1' make
	# unbundled vcpkg
	rapidjson 'boost>=1.79.0' 'glslang>=11.8.0' 'glm>=0.9.9.8' 'fmt>=9.1'
	# cemu
	nasm 'vulkan-headers>=1.3.225'
	# wxwidgets
	glu
)
optdepends=(
	'vulkan-driver: Vulkan graphics'
)
install=cemu.install
source=(
	git+https://github.com/cemu-project/Cemu#commit=cebdccfdf5aec30aa2ab7c61c4720ec2191bdb8f
	# dependencies
	imgui-1.88.tar.gz::https://github.com/ocornut/imgui/archive/refs/tags/v1.88.tar.gz
	imgui.cmake::https://raw.githubusercontent.com/microsoft/vcpkg/1b0252ca70ca2244a711535462c7f981eb439e83/ports/imgui/CMakeLists.txt
	imgui.conf::https://raw.githubusercontent.com/microsoft/vcpkg/1b0252ca70ca2244a711535462c7f981eb439e83/ports/imgui/imgui-config.cmake.in
	# submodules
	git+https://github.com/mozilla/cubeb#commit=dc511c6b3597b6384d28949285b9289e009830ea
	# git+https://github.com/microsoft/vcpkg#commit=1b0252ca70ca2244a711535462c7f981eb439e83
	# git+https://github.com/KhronosGroup/Vulkan-Headers#commit=715673702f5b18ffb8e5832e67cf731468d32ac6
	git+https://github.com/Exzap/ZArchive#commit=48914a07df3c213333c580bb5e5bb3393442ca5b
	# cubeb submodules
	git+https://github.com/arsenm/sanitizers-cmake#commit=aab6948fa863bc1cbe5d0850bc46b9ef02ed4c1a
	git+https://github.com/google/googletest#commit=800f5422ac9d9e0ad59cd860a2ef3a679588acb4
	# patches
	xdg.diff # 00dbe939f29c6fa6670a6f71946e52b520d51033
	overlay.diff # edeb14d4c68ee8bf500b990b13079177e01c25f1
	dark.diff # dd8c91f7fa1af00a85dd54a7a24d10bc11c4ee4b
	gamelist.diff # 182b40d38964a4c296127c5eb4497b5cccc01802
	mic.diff # 5231a71527cb57ea79b1b2ab9e4d7247d9141dd1
)
sha256sums=(
	SKIP
	9f14c788aee15b777051e48f868c5d4d959bd679fc5050e3d2a29de80d8fd32e
	262faed507149c89aab7572fd2c2a968f843ca2900043e30a9c339735ed08a8f
	91528f60cca93d3bce042d2ac16a63169025ec25a34453b49803126ed19153ae
	SKIP
	SKIP
	SKIP
	SKIP
	8c108b92d641b404d753b72aecfd7ebfa7609f84e8fa4b1318227a5a33bbe240
	f25d13fe76cc6a0b475f0131211a951288160ddae92cd7a815f5aea61d7cfc0f
	3c5527c6aa07bca9425b2bad5cd84102d5a7ab5ce61dadff727ce977a005aeae
	7f1b11b78de3f9f96d2af9569a980f066422bfc68f76e03bf8c253dc926c03f2
	3a3b29fc2643433c94d5244eaa3c3ff689929563c74f540b7b29266329c5a494
)

pkgver() {
	cd Cemu
	MAJ=$(awk -F '\t' '/LEAD/ {print $NF;exit}' src/Common/version.h)
	MIN=$(awk -F '\t' '/MAJOR/ {print $NF;exit}' src/Common/version.h)
	PAT=$(git rev-list --count HEAD)
	echo "$MAJ.$MIN.$PAT"
}

prepare() {
	cd Cemu
	echo "#define BUILD_VERSION_WITH_NAME_STRING \"Cemu $pkgver\"" >> src/Common/version.h

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

	# unbundled imgui
	sed -i '/imgui/cadd_subdirectory(dependencies/imgui)' CMakeLists.txt
	ln -srf "$srcdir/imgui-1.88" dependencies/imgui
	ln -srf "$srcdir/imgui.cmake" dependencies/imgui/CMakeLists.txt
	ln -srf "$srcdir/imgui.conf" dependencies/imgui/imgui-config.cmake.in

	# cubeb fix
	sed -i '/find_package(cubeb)/d' CMakeLists.txt

	# glm fix
	sed -i 's/glm::glm/glm/' src/Common/CMakeLists.txt src/input/CMakeLists.txt

	# glslang fix
	sed -i 's/GLSLANG_VERSION_LESS/GLSLANG_VERSION_GREATER/' src/Cafe/HW/Latte/Renderer/Vulkan/RendererShaderVk.cpp

	# experimental: xdg base dir (https://github.com/cemu-project/Cemu/pull/130)
	git apply "$srcdir/xdg.diff"
	sed -i 's|gameProfiles/default|gameProfiles|' src/Cafe/GameProfile/GameProfile.cpp

	# experimental: linux overlay (https://github.com/cemu-project/Cemu/pull/142)
	rm -rf src/util/SystemInfo
	git apply "$srcdir/overlay.diff"

	# experimental: dark mode fix (https://github.com/cemu-project/Cemu/pull/241)
	git apply "$srcdir/dark.diff"

	# experimental: gamelist auto resize (https://github.com/cemu-project/Cemu/pull/214)
	git apply "$srcdir/gamelist.diff"

	# experimental: microphone (https://github.com/cemu-project/Cemu/pull/251)
	rm -f src/audio/{Cubeb,IAudio}InputAPI.{cpp,h}
	git apply "$srcdir/mic.diff"
}

build() {
	# prefer clang (faster)
	if [[ $(clang --version 2> /dev/null | sed -E '1!d;s/^clang version ([0-9]+)\.[0-9]+\.[0-9]+$/\1/') -ge 12 ]] &&
	   [[ $(llvm-config --version 2> /dev/null | sed -E 's/^([0-9]+)\.[0-9]+\.[0-9]+$/\1/') -ge 12 ]]; then
		export CC=$(which clang)
		export CXX=$(which clang++ 2> /dev/null || which clang)
	fi

	cd Cemu
	cmake -B build \
	      -DCMAKE_CXX_FLAGS="$CXXFLAGS -w" -Wno-dev \
	      -DSYSTEM_DATA_PATH=/opt/cemu \
	      -DENABLE_VCPKG=OFF \
	      -DCMAKE_BUILD_TYPE=Release \
	      -DPUBLIC_RELEASE=ON
	make -C build -j $(nproc)
}

package() {
	cd Cemu
	install -D bin/Cemu_release "$pkgdir/usr/bin/cemu"

	pushd bin/gameProfiles/default
	mv 000500001011000.ini 0005000010111000.ini
	for ini in *[A-Z]*; do mv $ini ${ini,,}; done
	# install -Dm644 ../example.ini "$pkgdir/opt/cemu/gameProfiles/example.ini"
	install -Dm644 * -t "$pkgdir/opt/cemu/gameProfiles"
	popd

	install -Dm644 bin/resources/sharedFonts/* -t "$pkgdir/opt/cemu/resources/sharedFonts"
	for lang in {ca,de,es,fr,hu,it,ja,ko,nb,nl,pl,pt,ru,sv,tr,zh}; do
		install -Dm644 bin/resources/$lang/cemu.mo "$pkgdir/opt/cemu/resources/$lang/cemu.mo"
	done
	# install -Dm644 bin/shaderCache/info.txt "$pkgdir/opt/cemu/shaderCache/info.txt"

	install -Dm644 src/resource/logo_icon.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/cemu.png"
	sed -i -e '/^Icon=/cIcon=cemu' -e '/^Exec=/cExec=env GDK_BACKEND=x11 cemu' dist/linux/info.cemu.Cemu.desktop
	install -Dm644 dist/linux/info.cemu.Cemu.desktop "$pkgdir/usr/share/applications/cemu.desktop"
}
