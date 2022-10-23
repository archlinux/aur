# Maintainer: AndyRTR <andyrtr@archlinux.org>
# Contributor: Gerhard Brauer <gerbra@archlinux.de>
# Contributor: Richard Murri <admin@richardmurri.com>

pkgname=x2goclient
pkgver=4.1.2.2
pkgrel=5
arch=('x86_64' 'aarch64')
license=('GPL2')
url="https://wiki.x2go.org/doku.php"
pkgdesc="a graphical client (Qt5) for the X2Go system"
makedepends=('qt5-tools' 'man2html' 'xdg-utils' 'xorg-xauth')
depends=('qt5-x11extras' 'qt5-svg'
         'libldap' 'libcups' 'nxproxy' 'libssh' 'libxpm' 'hicolor-icon-theme')
# FS#48088
optdepends=('xorg-xauth: may be required by X2goservers running a different linux distribution giving MIT-COOKIE errors')
source=(https://code.x2go.org/releases/source/${pkgname}/${pkgname}-${pkgver}.tar.gz{,.asc}
        reproducible-man-gzip.patch 0001-Fix-redefinition-compile-error.patch)
sha256sums=('c9953267c40fa67119ad96a73bacb1f266196da2059f0cdcd1b8d5199421d12a'
            'SKIP'
            '8b309f0cc99d89737f47e57b79afdc9cccdd36ca3d0772040b1c3fdc0399a4d2'
            'be636e911074b474d66016f7a5f0da5fb1693d59291d585cec73f81f54fd9981')
validpgpkeys=('9BFBAEE86C0AA5FFBF2207829AF46B3025771B31'  # Mike Gabriel <mike.gabriel@das-netzwerkteam.de>
              '1AD23D1B8F087A35AB74BDE9F4A7678C9C6B0B2B') #  "X2go Git Administrator <git-admin@x2go.org>"

export CFLAGS+=' -fcommon'
export CXXFLAGS+=' -fcommon'

prepare() {
  cd ${pkgname}-${pkgver}
  sed -i "s:-o root -g root ::" Makefile
  sed -i -e 's/qt4/qt5/' Makefile

  # remove timestamp to solve reproducible build
  patch -Np1 -i ../reproducible-man-gzip.patch
  patch -Np1 -i ../0001-Fix-redefinition-compile-error.patch
}

build() {
  cd ${pkgname}-${pkgver}
  make PREFIX=/usr
  make PREFIX=/usr build_man
}

package() {
  
  cd ${pkgbase}-${pkgver}
  make PREFIX=/usr DESTDIR="$pkgdir" install_client install_man
}
