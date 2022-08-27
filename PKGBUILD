# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=cemu
pkgname=$_pkgname-git
pkgver=2.0.r38.g5cba1a1
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
options=('!lto')
source=(
	'Cemu::git+https://github.com/cemu-project/Cemu.git'
	'ZArchive::git+https://github.com/Exzap/ZArchive.git'
	'bootstrap.sh'
	'cemu.sh'
	'unbundle-libs.patch'
)
b2sums=(
	'SKIP'
	'SKIP'
	'db6d12c2c56f6025b7cac2016803b0a5ca508350ea3eba50fe999dcacc4ef3909301ff529715c9d4dd42d6997f071e214fcdbbe903aa945633e10d40a55970dc'
	'391ab049e4ecf031f5b916930b44f10dbdbe7308531682b2d78911e8fbdde71b8a8e296b149d31f1aa48e0b220eeeea43696ce5b1b82cd58b48cf9145cc84c4d'
	'da4c607462ac0c97ad33fc3588b5eb0b7ede039964365830807ad003604df7f24d8fd65374596dceb9449ef49ff9c78ec5bb3d8fda50061c79cf397e149debc2'
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
}

build() {
	cmake -S Cemu -B build \
		-DCMAKE_BUILD_TYPE=None \
		-DCMAKE_C_COMPILER=clang \
		-DCMAKE_CXX_COMPILER=clang++ \
		-DCMAKE_CXX_FLAGS_INIT="-I/opt/fmt7/include" \
		-DCMAKE_RUNTIME_OUTPUT_DIRECTORY=bin \
		-DCMAKE_TOOLCHAIN_FILE= \
		-DPUBLIC_RELEASE=OFF \
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
	install -D -t "$pkgdir"/usr/lib/$_pkgname ../build/src/bin/Cemu
	install -D ../cemu.sh "$pkgdir"/usr/bin/$_pkgname
	install -D ../bootstrap.sh "$pkgdir"/usr/lib/$_pkgname/$_pkgname
	cp -dr --no-preserve=ownership -t "$pkgdir"/usr/lib/$_pkgname bin/*
	install -Dm644 -t "$pkgdir"/usr/share/applications dist/linux/info.cemu.Cemu.desktop
	install -Dm644 -t "$pkgdir"/usr/share/metainfo dist/linux/info.cemu.Cemu.metainfo.xml
}
