# Maintainer: A. Jack Roehr <jack at roe dot hr>
pkgname="ktx_software-git"
_pkgname="ktx_software"
pkgver=4.3.2.r62.g797098b4
pkgrel=1
pkgdesc="KTX (Khronos Texture) Library and Tools"
arch=("i686" "pentium4" "x86_64" "arm" "armv6h" "armv7h" "aarch64")
url="https://github.com/KhronosGroup/KTX-Software"
license=("Apache-2.0")
depends=("glibc" "gcc-libs")
makedepends=("clang"
	     "cmake"
	     "git"
             "zstd")
options=("!debug")
provides=("ktx_software")
conflicts=("ktx_software")
source=("KTX-Software::git+https://github.com/KhronosGroup/KTX-Software#branch=main")
sha256sums=("SKIP")

_reponame="KTX-Software"
_builddir="build"

pkgver() {
	cd "$srcdir/$_reponame"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	mkdir -p "$srcdir/$_reponame/$_builddir"
}

build() {
	cd "$srcdir/$_reponame/$_builddir"
	cmake .. -DKTX_FEATURE_DOC=OFF -DKTX_FEATURE_LOADTEST=OFF -DKTX_FEATURE_STATIC_LIBRARY=ON -DKTX_FEATURE_TESTS=OFF -DCMAKE_C_COMPILER=clang -DCMAKE_CXX_COMPILER=clang++ -DCMAKE_BUILD_TYPE=Release
	cmake --build . --config Release
}

package() {
	cd "$srcdir/$_reponame/$_builddir"
	cmake --install . --prefix ${pkgdir}/usr
}
