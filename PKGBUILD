# Maintainer: Charlie Wolf <charlie@wolf.is>

_pkgname=resolvconf-override
pkgname=${_pkgname}-git
pkgver=r15.06a91f9
pkgrel=2
pkgdesc="Override resolv.conf using LD_PRELOAD"
url="https://gitlab.freedesktop.org/hadess/${_pkgname}"
arch=("i686" "x86_64")
source=("git+https://gitlab.freedesktop.org/hadess/${_pkgname}.git" "gcc15.patch")
sha256sums=('SKIP' 'SKIP')
depends=("glibc")
makedepends=("meson" "ninja")

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $srcdir/${_pkgname}/
  patch -p1 < $srcdir/gcc15.patch
}

build() {
  cd $srcdir/${_pkgname}/
  mkdir -p build && cd build
  meson ..
  ninja
}

package() {
  cd $srcdir/${_pkgname}/build
  mkdir -p $pkgdir/usr/lib
  cp libresolvconf-override.so $pkgdir/usr/lib
}

