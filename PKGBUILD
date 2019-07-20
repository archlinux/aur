# Maintainer: Utkan Güngördü <utkan@freeconsole.org>

pkgname=ncnn-git
_pkgname=ncnn
pkgver=20190611.r36.g81a5dfe
pkgrel=1
pkgdesc="High-performance neural network inference framework optimized for the mobile platform"
url="https://github.com/Tencent/ncnn"
license=('BSD')
depends=('vulkan-headers')
makedepends=('git' 'cmake')
conflicts=('ncnn')
provides=('ncnn')
arch=('i686' 'x86_64')
source=("git://github.com/Tencent/ncnn.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/ncnn"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

#prepare() {
#}

build() {
	cd "${srcdir}/ncnn"
	mkdir -p build
	cd build
	cmake -DCMAKE_TOOLCHAIN_FILE=../toolchains/host.gcc.toolchain.cmake -DCMAKE_INSTALL_PREFIX:PATH=${pkgdir}/usr -DNCNN_VULKAN=ON ..
	make
}

package() {
	cd "${srcdir}/ncnn/build"
	make install
	mkdir "${pkgdir}/usr/include/ncnn"
	mv ${pkgdir}/usr/include/*.h ${pkgdir}/usr/include/ncnn
}
