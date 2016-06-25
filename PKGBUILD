# Maintainer: brent saner <bts@square-r00t.net>
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')

pkgname=quake2world-git
pkgver=r2493.f1fb32c
pkgrel=3
pkgdesc="A free, stand-alone, multiplayer-only iteration of Quake2"
arch=('i686' 'x86_64')
url="http://quetoo.org"
license=('GPL')
source=(git+https://github.com/jdolan/quake2world.git)
sha512sums=('SKIP')
depends=('sdl2' 'curl' 'sdl2_image' 'sdl2_mixer')
makedepends=('sdl2' 'sdl2_mixer' 'sdl2_image' 'physfs')
optdepends=(
'quake2world-data-git: the game data files'
)
install=quake2world.install
_pkgname=quake2world

pkgver() {
  cd "${srcdir}/${_pkgname}"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd ${srcdir}/quake2world

  libtoolize
  autoreconf -i
  ./configure --prefix=/usr --without-mysql
  make
  make DESTDIR=${pkgdir} install
}
