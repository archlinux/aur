# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Iraklis Karagkiozoglou <iraklisk at outlook dot com>

pkgname=irony-mode
pkgver=1.6.1
pkgrel=1
pkgdesc="A C/C++ minor mode for Emacs powered by libclang"
arch=('x86_64')
url="https://github.com/Sarcasm/irony-mode"
license=('GPL3')
depends=('emacs' 'llvm' 'clang')
makedepends=('cmake')
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/Sarcasm/irony-mode/archive/v${pkgver}.tar.gz")
sha256sums=('efcaad5e92024bb25103d143b1e154f75e32a0f1cab3b7ee621242d439c2eecb')

build() {
  mkdir -p ${srcdir}/build && cd ${srcdir}/build
  cmake ../${pkgname}-${pkgver}/server \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make all
}

check() {
  cd ${srcdir}/build
  make test || true
}

package() {
  mkdir -p "${pkgdir}/usr/share/emacs/site-lisp/"
  mkdir -p "${pkgdir}/usr/bin"

  install -Dm755 "${srcdir}/build/bin/irony-server" "${pkgdir}/usr/bin/irony-server"
  cp -rp "${srcdir}/${pkgname}-${pkgver}"/*.el \
    "${pkgdir}/usr/share/emacs/site-lisp/"
}
