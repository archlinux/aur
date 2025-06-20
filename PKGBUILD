# Maintainer: Sterophonick
pkgname=heartlib-git
_pkgname='heartlib'
pkgver=2a40da6
pkgrel=3
pkgdesc='Comprehensive API for Nintendo GBA inspired by HAMLib and HELlib. Requires devkitARM'
url='https://github.com/Sterophonick/HeartLib'
arch=(x86_64 i686 aarch64)
makedepends=(base-devel)
source=(git+https://github.com/Sterophonick/HeartLib)
md5sums=('SKIP')
license=('gplv3')
options=(!strip)

prepare() {
  if [ ! -e "/opt/devkitpro/devkitARM/" ]; then
    echo "devkitARM not installed! HeartLib requires devkitARM to be installed on your system!"
    echo 'https://devkitpro.org/wiki/Getting_Started'
    exit 1
  fi
}

pkgver() {
  cd "$srcdir/HeartLib"
  git describe --tags --long --always | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/HeartLib"
  mkdir -p build
  make
}

package() {
  cd "$srcdir/HeartLib"

  mkdir -p $pkgdir/opt/devkitpro/examples

  install -Dm666 libheart.a $pkgdir/opt/devkitpro/libheart/libheart.a
  install -Dm666 LICENSE $pkgdir/opt/devkitpro/libheart
  install -Dm666 APLIB-LICENSE $pkgdir/opt/devkitpro/libheart
  install -Dm666 GBFS-LICENSE $pkgdir/opt/devkitpro/libheart
  install -Dm666 LIBGBA-LICENSE $pkgdir/opt/devkitpro/libheart
  install -Dm666 RUMBLE-LICENSE $pkgdir/opt/devkitpro/libheart

  cp -r include $pkgdir/opt/devkitpro/libheart/include
  cp -r samples $pkgdir/opt/devkitpro/examples/libheart-samples

  chmod -R 666 $pkgdir/opt/devkitpro/libheart/include
  chmod -R 666 $pkgdir/opt/devkitpro/examples/libheart-samples
  }
