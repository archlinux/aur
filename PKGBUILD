# Maintainer: soloturn@gmail.com
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: Travis Willard <travisw@wmpub.ca>
# Contributor: Denis (dtonator@gmail.com)

_basename=xmoto
pkgname="$_basename"
pkgver=0.6.3
pkgrel=1
pkgdesc="A challenging 2D motocross platform game, where physics play an important role."
arch=('i686' 'x86_64')
url="http://xmoto.tuxfamily.org"
license=('GPL')
depends=('curl' 'glu' 'libjpeg' 'libpng' 'libxdg-basedir' 'libxml2' 'lua'
	 'ode' 'sdl2_mixer' 'sdl2_net' 'sdl2_ttf' 'sqlite')
makedepends=('cmake' 'ninja' 'git')
conflicts=("$_basename")
provides=("$_basename")

source=("$pkgname-$pkgver.tar.gz::https://github.com/$_basename/$_basename/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('64cb29934660456ec82cebdaa0d3d273a862e10760e8ee80443928d317242484')

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

