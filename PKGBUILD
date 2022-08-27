# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=cemu
pkgname=$_pkgname-git
pkgver=2.0.r40.g01c5855
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
	'clang'
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
	'da4c607462ac0c97ad33fc3588b5eb0b7ede039964365830807ad003604df7f24d8fd65374596dceb9449ef49ff9c78ec5bb3d8fda50061c79cf397e149debc2'
	'99d7bf7cfa7f809a1bfa32f1ddb78a66078f84bad792149195531ba38d2b816ce3dcc536e3aeb9ceff8a3566851528da322c0942dac5484ab8d97af1b749bdf3'
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
		-DCMAKE_C_COMPILER=clang \
		-DCMAKE_CXX_COMPILER=clang++ \
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
	# shellcheck disable=SC2154
	install -D $_pkgname.bash "$pkgdir"/usr/bin/$_pkgname
	install -D -t "$pkgdir"/usr/lib/$_pkgname build/src/bin/Cemu
	cd Cemu
	cp -dr --no-preserve=ownership -t "$pkgdir"/usr/lib/$_pkgname bin/*
	install -Dm644 -t "$pkgdir"/usr/share/applications dist/linux/info.cemu.Cemu.desktop
	install -Dm644 -t "$pkgdir"/usr/share/metainfo dist/linux/info.cemu.Cemu.metainfo.xml
}
