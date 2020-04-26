# $Id$
# Maintainer: soloturn@gmail.com
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: Travis Willard <travisw@wmpub.ca>
# Contributor: Denis (dtonator@gmail.com)

_basename=xmoto
pkgname="$_basename-git"
pkgver=r552.f7a23e4f
pkgrel=1
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

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  # not sure why a sed is necessary, the projects travis.yml file does not need
  # it, see https://github.com/xmoto/xmoto/blob/master/.travis.yml
  sed -i 's-COMMAND xmoto-COMMAND ../src/xmoto-' ../${pkgbase}/bin/CMakeLists.txt
  cmake ../${pkgbase} -GNinja -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_SYSTEM_NAME=Linux
  ninja
  ninja xmoto_pack
}

package() {
  cd build
  DESTDIR="${pkgdir}" ninja install

  # install man page
  mandir=/usr/share/man/man6
  mkdir -p  ${pkgdir}/${mandir}
  gzip -c "${srcdir}/${pkgbase}/xmoto.6" > "${pkgdir}/${mandir}/xmoto.6.gz"
}

