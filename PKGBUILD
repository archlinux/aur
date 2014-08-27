# Maintainer: Oleg Shparber <trollixx+aur@gmail.com>
# Contributor: Angelo Theodorou <encelo@users.sourceforge.net>

_pkgname=stratagus
pkgname=$_pkgname-bzr
pkgver=r8917
pkgrel=1
pkgdesc="A free cross-platform real-time strategy gaming engine"
arch=('i686' 'x86_64')
url="https://launchpad.net/stratagus"
license=('GPL')
depends=('gcc-libs' 'libgl' 'sdl' 'libpng' 'libmng' 'libvorbis' 'libtheora' 'libmikmod' 'lua51' 'sqlite')
makedepends=('cmake' 'tolua++')
conflicts=$_pkgname
provides=$_pkgname
source=("${pkgname%-*}::bzr+http://bazaar.launchpad.net/~stratagus/stratagus/trunk/")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-*}
  printf "r%s" "$(bzr revno)"
}

build() {
  cd $srcdir
  mkdir -p build
  cd build

  cmake ../${pkgname%-*} \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_INSTALL_PREFIX=/usr \
  -DGAMEDIR=/usr/bin \
  -DSBINDIR=/usr/bin \
  -DLUA_INCLUDE_DIR=/usr/include/lua5.1

  make
}

package() {
  cd "${srcdir}"/build
  make DESTDIR="${pkgdir}" install

  mkdir -p ${pkgdir}/usr/include
  cp ${srcdir}/${pkgname%-*}/gameheaders/stratagus-game-launcher.h ${pkgdir}/usr/include
}
