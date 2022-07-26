# Maintainer: Allen Hoffmeyer <allen dot hoffmeyer at gmail dot com>
#               (adapted from work by Louis R. Marascio <lrm at fitnr dot com>)
# Contributor: trader <trader9 at gawab dot com>
# Contributor: masutu <masutu dot arch at googlemail dot com>
# Contributor: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=quantlib
_pkgname=QuantLib
pkgver=1.27
pkgrel=1
pkgdesc="A free/open-source library for quantitative finance."
arch=('x86_64')
url="http://quantlib.org"
license=('BSD')
options=(!libtool)
depends=('boost-libs')
makedepends=('make' 'boost')
source=("Quantlib-$pkgver.tar.gz::https://github.com/lballabio/QuantLib/releases/download/QuantLib-v$pkgver/QuantLib-$pkgver.tar.gz")
sha256sums=('5c2cab0f9bbcdcd3ca1b45d7930b3ab7e120857587b6f61c463b2a012a8bc6a7')

prepare() {
  cd "$_pkgname-$pkgver"/
  autoupdate acinclude.m4 configure.ac
  autoreconf -if
} 

build() {
  cd "$_pkgname-$pkgver"
  ./configure --prefix=/usr \
    --enable-intraday \
    --enable-openmp \
    --disable-static \
    --enable-std-classes \
    CXXFLAGS="$CXXFLAGS -Wp,-U_GLIBCXX_ASSERTIONS"
  make
}

package() {
  cd "$_pkgname-$pkgver"/
  make DESTDIR="$pkgdir/" install
  install -D -m644 LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE.TXT"
}

check() {
  cd "$_pkgname-$pkgver"
  make check
}

# vim:set ts=2 sw=2 et:
