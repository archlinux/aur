# Maintainer: soloturn@gmail.com
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: Travis Willard <travisw@wmpub.ca>
# Contributor: Denis (dtonator@gmail.com)

_basename=xmoto
pkgname="$_basename"
pkgver=0.6.1
pkgrel=1
pkgdesc="A challenging 2D motocross platform game, where physics play an important role."
arch=('i686' 'x86_64')
url="http://xmoto.tuxfamily.org"
license=('GPL')
depends=('libjpeg' 'libpng' 'lua' 'sdl_mixer' 'ode' 'curl' 'sqlite' 'sdl_ttf'
         'sdl_net' 'glu' 'libxdg-basedir' 'libxml2')
makedepends=('cmake' 'ninja' 'git')
conflicts=("$_basename")
provides=("$_basename")

source=("$pkgname-$pkgver.tar.gz::https://github.com/$_basename/$_basename/archive/$pkgver.tar.gz")
sha256sums=('209c8c38b1742d0620d40f90365c7a56f67c86da826c80a76d37fa46ee9c9b66')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../${pkgbase}-$pkgver -GNinja -DCMAKE_INSTALL_PREFIX=/usr
  ninja
  ninja xmoto_pack
}

package() {
  cd build
  DESTDIR="${pkgdir}" ninja install

  # install man page
  mandir=/usr/share/man/man6
  mkdir -p  ${pkgdir}/${mandir}
  gzip -c "${srcdir}/${pkgbase}-$pkgver/doc/xmoto.6" > "${pkgdir}/${mandir}/xmoto.6.gz"
}

