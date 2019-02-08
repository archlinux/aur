# $Id$
# Maintainer: soloturn@gmail.com
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: Travis Willard <travisw@wmpub.ca>
# Contributor: Denis (dtonator@gmail.com)

_basename=xmoto
pkgname="$_basename-git"
pkgver=0.5.11
pkgrel=7
pkgdesc="A challenging 2D motocross platform game, where physics play an important role."
arch=('i686' 'x86_64')
url="http://xmoto.tuxfamily.org"
license=('GPL')
depends=('libjpeg' 'libpng' 'lua52' 'sdl_mixer' 'ode' 'curl' 'sqlite' 'sdl_ttf'
         'sdl_net' 'glu' 'libxdg-basedir' 'libxml2')
makedepends=('cmake' 'ninja' 'git')
conflicts=("$_basename")
provides=("$_basename")

source=("$pkgname::git://github.com/xmoto/$_basename.git")
sha1sums=('SKIP')

prepare() {
  mkdir -p build
}

build() {
  cd build
  # Build using the old C++ ABI to fix issue with missing text; the issue
  # should be fixed in the next stable release (if that ever does happen)
  CPPFLAGS+=' -D_GLIBCXX_USE_CXX11_ABI=0'
  cmake ../${pkgbase} -GNinja -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_SYSTEM_NAME=Linux
  ninja
}

package() {
  cd build
  DESTDIR="${pkgdir}" mandir=/usr/share/man/man6 ninja install

  # install desktop file
  install -Dm0644 "${srcdir}/${pkgname}-${pkgver}/extra/xmoto.desktop" \
        "${pkgdir}/usr/share/applications/xmoto.desktop"

  # install icon for desktop file
  install -Dm0644 "${srcdir}/${pkgname}-${pkgver}/extra/xmoto.xpm" \
        "${pkgdir}/usr/share/pixmaps/xmoto.xpm"
}

