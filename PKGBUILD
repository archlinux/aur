# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Allen Hoffmeyer <allen dot hoffmeyer at gmail dot com>
# (adapted from work by Louis R. Marascio <lrm at fitnr dot com>)
# Contributor: trader <trader9 at gawab dot com>
# Contributor: masutu <masutu dot arch at googlemail dot com>
# Contributor: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=quantlib-git
_pkg="${pkgname%-git}"
pkgver=1.29.r189.g617c043f8
pkgrel=1
pkgdesc="A free/open-source library for quantitative finance."
arch=('x86_64')
url='https://github.com/lballabio/quantlib'
license=('BSD')
depends=('gcc-libs')
makedepends=('boost' 'git')
provides=("$_pkg" 'libQuantLib.so')
conflicts=("$_pkg")
source=("$_pkg::git+$url")
sha256sums=('SKIP')

pkgver() {
  git -C "$_pkg" describe --long --tags | sed 's/^QuantLib-v//;s/-/.r/;s/-/./'
}

prepare() {
  cd "$_pkg"
  autoupdate acinclude.m4 configure.ac
  autoreconf -if
}

build() {
  cd "$_pkg"
  ./configure --prefix=/usr \
    --enable-intraday \
    --enable-openmp \
    --disable-static \
    --enable-std-classes \
    --enable-null-as-functions \
    --enable-parallel-unit-test-runner
  make
}

check() {
  make -C "$_pkg" check
}

package() {
  cd "$_pkg"
  make DESTDIR="$pkgdir/" install
  install -Dvm644 LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:

