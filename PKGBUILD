# Maintainer: David Runge <dave@sleepmap.de>
# Contributor: Troy Engel <troyengel+arch@gmail.com>

pkgname=kernelshark
pkgver=1.1
pkgrel=1
pkgdesc="GUI frontend for trace-cmd based Linux kernel Ftrace captures"
arch=('x86_64' 'aarch64')
url="https://git.kernel.org/pub/scm/utils/trace-cmd/trace-cmd.git"
license=('GPL2')
depends=('freeglut' 'gcc-libs' 'glibc' 'glu' 'json-c' 'trace-cmd=2.8.3' 'qt5-base')
makedepends=('cmake')
source=("https://git.kernel.org/pub/scm/utils/trace-cmd/trace-cmd.git/snapshot/${pkgname}-v${pkgver}.tar.gz")
sha512sums=('549cbf71205b6786f50eb976eb8825e71b733570ac03e1fa9bb82c69ae576bc77d2793ea3837c7265c0f498c28356f743e72955d4a7c52f98dd65fc622dae5ee')

prepare() {
  mv -v "${pkgname}-v${pkgver}" "${pkgname}-${pkgver}"
  mkdir -vp "${pkgname}-${pkgver}/kernel-shark/bld"
}

build() {
  cd "${pkgname}-${pkgver}"
  make
  (
    cd "kernel-shark/bld"
    cmake -D_INSTALL_PREFIX=/usr \
          -D_DOXYGEN_DOC=1 \
          ..
    make VERBOSE=1
  )
}

package() {
  cd "${pkgname}-${pkgver}"
  (
    cd "kernel-shark/bld"
    make DESTDIR="${pkgdir}/" install
  )
}
