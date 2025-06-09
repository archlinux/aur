# Maintainer: Anton Kudelin <kudelin at proton dot me>

_pkgname=opencalphad
pkgname=$_pkgname-git
pkgver=6.0.110.ge1f8cb7
pkgrel=1
pkgdesc="A thermodynamic calculation code"
arch=(x86_64)
license=(GPL-3.0-only)
url="http://www.opencalphad.com"
depends=(gcc-libs)
makedepends=(gcc-fortran git sed)
provides=("$_pkgname")
source=(git+https://github.com/sundmanbo/opencalphad.git)
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --tags | sed 's/^..//' | sed 's/-/./g'
}

prepare() {
  cd "$srcdir/$_pkgname"
  sed -i 's/#gcc -c -DLinux/gcc -c -DLinux/g' Makefile
}

build() {
  cd "$srcdir/$_pkgname"
  make -j1 FCOPT="-O2 -fopenmp"
}

package() {
  cd "$pkgdir"
  install -dm755 usr/{bin,share/$pkgname/doc/manual}

  cd "$srcdir/$_pkgname"
  install -m755 oc6P "$pkgdir/usr/bin"
  install -m755 doc/*.pdf "$pkgdir/usr/share/$pkgname/doc"
  install -m755 doc/manual/*.pdf "$pkgdir/usr/share/$pkgname/doc/manual"
}
