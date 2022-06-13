# Maintainer: Carsten Haitzler <raster@rasterman.com>
# Contributor: Doug Newgard <scimmia at archlinux dot info>

_pkgname=rage
pkgname=$_pkgname-git
pkgver=0.4.0.r258.5d31883
pkgrel=1
pkgdesc="Video Player based on EFL - Development version"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://www.enlightenment.org/about-rage"
license=('BSD')
depends=('efl')
makedepends=('git' 'meson' 'ninja' 'pkgconf' 'gcc' 'binutils' 'fakeroot')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=('debug')
source=("git+https://git.enlightenment.org/enlightenment/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname

  local v_ver=$(grep version meson.build | head -1 | sed s/version//g | tr ":'," "   " | awk '{print $1}')

  printf "$v_ver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd $_pkgname

  export CFLAGS="$CFLAGS -fvisibility=hidden"

  rm -rf build
  meson --prefix=/usr \
    . build

  ninja -C build
}

package() {
  cd $_pkgname

  DESTDIR="$pkgdir" ninja -C build install

# install text files
  install -Dm644 -t "$pkgdir/usr/share/doc/$_pkgname/" README.md

# install license files
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" AUTHORS COPYING
}
