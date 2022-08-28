# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=cemu
pkgname=$_pkgname-git
pkgver=2.0.r45.g0f24b06
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
	'0e3b053910d6e8587e587d4f221c268dc62a83d0d887e5e6fe565281d0b8c0a528aa8832bcccccb67d11d34b36803c1b62f1a7ab9df7fba4876aab96258d708a'
	'1484049222ce3303645d3436dfc7732820069281b5a79087e2e22f34546aa86c39e266ce0ee155e5d86a8d2d989e11c28841fe35c18c905946488bf9a9fdce83'
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
