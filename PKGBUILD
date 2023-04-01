# Maintainer: Eduardo Escobar <eduardoeae@gmail.com>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: ViNS <gladiator@fastwebnet.it>
# Contributor: Daenyth
pkgname=nethogs-git
_pkgname=nethogs
pkgver=0.8.7.r21.g2497311
pkgrel=1
pkgdesc="A net top tool which displays traffic used per process instead of per IP or interface. GIT version"
arch=("x86_64")
url="https://github.com/raboof/nethogs"
license=("GPL")
depends=("libpcap" "ncurses" "gcc-libs")
makedepends=("git")
provides=("nethogs=${pkgver}")
conflicts=("nethogs")
install="nethogs.install"
source=("nethogs::git+https://github.com/raboof/nethogs#branch=main")
md5sums=("SKIP")

pkgver() {
  cd "$_pkgname"
  git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"
  sed -i "s|/sbin|/bin|" src/MakeApp.mk
  sed -i "s|/local||"  Makefile
}

build() {
  cd "$_pkgname"
  unset CFLAGS
  unset CXXFLAGS
  make prefix="/usr"
  make prefix="/usr" libnethogs
}

package() {
  cd "$_pkgname"
  make prefix="/usr" DESTDIR="$pkgdir" install
  make prefix="/usr" DESTDIR="$pkgdir" install_lib

  install -Dm755 src/libnethogs.h "$pkgdir/usr/include/libnethogs.h"
  _pkgver="$(git describe --long --abbrev=7 | sed 's/^v//')"
  ln -s "/usr/lib/libnethogs.so.$_pkgver" "$pkgdir/usr/lib/libnethogs.so"
}
