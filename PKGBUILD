# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=cemu
pkgname=$_pkgname-git
pkgver=2.0.r44.g454b587
pkgrel=1
pkgdesc="Nintendo Wii U emulator"
arch=('x86_64')
url="https://cemu.info/"
license=('MPL2')
depends=(
	'discord-rpc'
	'glslang'
	'imgui'
	'pugixml'
	'wxgtk3'
)
makedepends=(
	'boost'
	'cmake'
	'cubeb'
	'curl'
	'fmt7'
	'git'
	'glm'
	'glu'
	'libzip'
	'nasm'
	'rapidjson'
	'sdl2'
	'vulkan-headers'
	'webkit2gtk'
	'zstd'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(
	'Cemu::git+https://github.com/cemu-project/Cemu.git'
	'ZArchive::git+https://github.com/Exzap/ZArchive.git'
	'unbundle-libs.patch'
	"$_pkgname.bash"
)
b2sums=(
	'SKIP'
	'SKIP'
	'739dfcb54d4f818c2f638c63e6471747470ff32327c37e7e13c11a93885728933b3314bda29699a3ec704081b78c3697261e8437c1d6e732a1e470e3f82720a5'
	'c5deb443e09fa4d10f29a1a8865f11d660c97a2dd2da361673b02b90f60abd3d67c73fde0fe6760fcb7c2ab424d5d7d91f26245c8b63af05c736662e8cc2f3ef'
)

pkgver() {
	cd Cemu
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd Cemu
	git config submodule.dependencies/ZArchive.url ../ZArchive
	git submodule update
	patch -Np1 < ../unbundle-libs.patch
	sed -i '/CMAKE_INTERPROCEDURAL_OPTIMIZATION/d' CMakeLists.txt
}

build() {
	cmake -S Cemu -B build \
		-DCMAKE_BUILD_TYPE=None \
		-DCMAKE_CXX_FLAGS_INIT="-I/opt/fmt7/include" \
		-DCMAKE_RUNTIME_OUTPUT_DIRECTORY=bin \
		-DCMAKE_TOOLCHAIN_FILE= \
		-DPUBLIC_RELEASE=ON \
		-Wno-dev
	cmake --build build
}

package() {
	depends+=(
		'libboost_filesystem.so'
		'libboost_program_options.so'
		'libcubeb.so'
		'libcurl.so'
		'libzip.so'
		'libzstd.so'
	)
	cd Cemu
	# shellcheck disable=SC2154
	install -D ../$_pkgname.bash "$pkgdir"/usr/bin/$_pkgname
	install -D -t "$pkgdir"/usr/lib/$_pkgname ../build/src/bin/Cemu
	cp -dr --no-preserve=ownership -t "$pkgdir"/usr/lib/$_pkgname bin/*
	install -Dm644 -t "$pkgdir"/usr/share/applications dist/linux/info.cemu.Cemu.desktop
	install -Dm644 -t "$pkgdir"/usr/share/metainfo dist/linux/info.cemu.Cemu.metainfo.xml
}
