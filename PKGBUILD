# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=cemu
pkgname=$_pkgname-git
pkgver=2.0.61.r6.gdee76447
pkgrel=1
pkgdesc="Nintendo Wii U emulator"
arch=('x86_64')
url="https://cemu.info/"
license=('MPL2')
depends=(
	'discord-rpc'
	'gcc-libs'
	'glibc'
	'glslang'
	'hicolor-icon-theme'
	'libx11'
	'pugixml'
	'sdl2'
	'wxwidgets-gtk3>=3.2'
)
makedepends=(
	'boost'
	'cmake>=3.21.1'
	'cubeb'
	'curl'
	'fmt>=9'
	'git'
	'glib2'
	'glm'
	'glu'
	'gtk3'
	'hidapi'
	'libgl'
	'libpng'
	'libsm' # https://gitlab.archlinux.org/archlinux/packaging/packages/wxwidgets/-/issues/1
	'libusb'
	'libzip'
	'nasm'
	'openssl'
	'rapidjson'
	'vulkan-headers>=1:1.3.225'
	'wayland'
	'wayland-protocols'
	'zarchive>=0.1.2'
	'zlib'
	'zstd'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(
	"$_pkgname::git+https://github.com/cemu-project/Cemu.git"
	'imgui::git+https://github.com/ocornut/imgui.git'
)
b2sums=(
	'SKIP'
	'SKIP'
)

pkgver() {
	cd $_pkgname
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd $_pkgname
	git config submodule.dependencies/imgui.url ../imgui
	git -c protocol.file.allow=always submodule update
	rm -r bin/shaderCache
	sed -i '/CMAKE_INTERPROCEDURAL_OPTIMIZATION/d' CMakeLists.txt
	sed -i '/discord-rpc/d' CMakeLists.txt
	sed -i '/FMT_HEADER_ONLY/d' src/Common/precompiled.h
	# https://gitlab.archlinux.org/archlinux/packaging/packages/glm/-/issues/1
	sed -i 's/glm::glm/glm/' src/{Common,input}/CMakeLists.txt
	# https://gitlab.archlinux.org/archlinux/packaging/packages/glslang/-/issues/1
	sed -i '/find_package/s/glslang/Vulkan COMPONENTS &/' CMakeLists.txt
	sed -i 's/glslang::SPIRV/Vulkan::glslang-spirv/' src/Cafe/CMakeLists.txt
}

build() {
	cmake -S $_pkgname -B build \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_C_FLAGS_RELEASE="-DNDEBUG" \
		-DCMAKE_CXX_FLAGS_RELEASE="-DNDEBUG" \
		-DENABLE_VCPKG=OFF \
		-DPORTABLE=OFF \
		-Wno-dev
	cmake --build build
}

package() {
	depends+=(
		'libboost_program_options.so'
		'libcrypto.so'
		'libcubeb.so'
		'libcurl.so'
		'libfmt.so'
		'libgdk-3.so'
		'libgobject-2.0.so'
		'libgtk-3.so'
		'libhidapi-hidraw.so'
		'libssl.so'
		'libusb-1.0.so'
		'libwayland-client.so'
		'libz.so'
		'libzarchive.so'
		'libzip.so'
		'libzstd.so'
	)
	cd $_pkgname
	# shellcheck disable=SC2154
	install -d "$pkgdir"/usr/{bin,share/Cemu}
	mv bin/Cemu_release "$pkgdir"/usr/bin/Cemu
	cp -dr --no-preserve=ownership -t "$pkgdir"/usr/share/Cemu bin/*
	install -Dm644 -t "$pkgdir"/usr/share/applications dist/linux/info.cemu.Cemu.desktop
	install -Dm644 -t "$pkgdir"/usr/share/metainfo dist/linux/info.cemu.Cemu.metainfo.xml
	install -Dm644 src/resource/logo_icon.png "$pkgdir"/usr/share/icons/hicolor/128x128/apps/info.cemu.Cemu.png
}
