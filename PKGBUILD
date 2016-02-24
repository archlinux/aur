# Contributor: Roman Titov <titovroman@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=racket-minimal
_pkgname=racket
pkgver=6.4
pkgrel=2
pkgdesc="Minimal Racket installation, without DrRacket"
url='http://racket-lang.org/'
license=('GPL3' 'LGPL3' 'custom')
arch=('i686' 'x86_64')
depends=('libffi')
makedepends=('xforms')
options=('!strip' '!emptydirs' '!makeflags')
provides=('racket')
conflicts=('racket')
source=("http://mirror.racket-lang.org/installers/$pkgver/${pkgname}-${pkgver}-src.tgz" gcc.patch)
sha256sums=('98aab2567fa9076e65531d56eb9e69279ff7d5cdbfd8d069ae30dc3109781f96'
            '0ac0ce1668de9ba2b3cc8ad816aa5b4cec351f9da763daf97c7f8311d6c129e4')

prepare() {
  cd "${srcdir}"/${_pkgname}-${pkgver}/collects/compiler/private
  patch  xform.rkt "$srcdir"/gcc.patch
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}/src"
  [ "$CARCH" == "x86_64" ] && export CFLAGS+=" -fPIC"
  ./configure --prefix=/usr --sysconfdir=/etc --enable-shared
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}/src"
  make DESTDIR="${pkgdir}" install
  install -D -m644 COPYING-libscheme.txt \
	  "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
