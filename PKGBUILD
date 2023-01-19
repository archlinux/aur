# Maintainer: Emma Tebibyte <emma@tebibyte.media>
# Contributor: Robin Broda <robin@broda.me>
# Contributor: Pierre Neidhardt <ambrevar@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Gergely Imreh <imrehgATgmailDOTcom>
# Contributor: dschauer <dschauerATgmailDOTcom>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Jeremy Cowgar <jeremy@cowgar.com>

_pkgbase=tcc
pkgname=tcc-musl
pkgver=0.9.27
pkgrel=1
pkgdesc="Tiny C Compiler"
arch=('x86_64')
url="https://bellard.org/tcc/"
license=('LGPL')
depends=('musl')
conflicts=('tcc')
makedepends=('texi2html')
options=('docs' 'staticlibs')
source=("https://download.savannah.nongnu.org/releases/tinycc/${_pkgbase}-${pkgver}.tar.bz2")
sha256sums=('de23af78fca90ce32dff2dd45b3432b2334740bb9bb7b05bf60fdbfc396ceb9c')

build() {
  cd ${_pkgbase}-${pkgver}
  unset CFLAGS
  unset LDFLAGS
  ./configure --prefix=/usr --config-musl
  make
}

check() {
  cd ${_pkgbase}-${pkgver}
  make test
}

package() {
  cd ${_pkgbase}-${pkgver}

 make DESTDIR="$pkgdir" docdir="$pkgdir"/usr/share/doc/tcc install

 make clean
 make CFLAGS="-fPIC"
 gcc -shared -o libtcc.so *.o
 install -Dm755 libtcc.so -t "${pkgdir}/usr/lib/"
}
