# Maintainer: soloturn@gmail.com
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: Travis Willard <travisw@wmpub.ca>
# Contributor: Denis (dtonator@gmail.com)

_basename=xmoto
pkgname="$_basename-git"
pkgver=0.6.1.r227.g95112f86
pkgrel=1
pkgdesc="A challenging 2D motocross platform game, where physics play an important role."
arch=('i686' 'x86_64')
url="http://xmoto.tuxfamily.org"
license=('GPL')
depends=('curl' 'glu' 'libjpeg' 'libpng' 'lua' 'libxml2' 'libxdg-basedir'
         'ode' 'sdl2_mixer' 'sdl2_net'  'sdl2_ttf' 'sqlite')
makedepends=('cmake' 'git' 'ninja')
conflicts=("$_basename")
provides=("$_basename")

source=("$pkgname::git+https://github.com/xmoto/$_basename.git")
sha1sums=('SKIP')

# not stripping for creating a gdb stacktrace
options=(!strip)

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../${pkgbase} -GNinja -DCMAKE_INSTALL_PREFIX=/usr
  ninja
  ninja xmoto_pack
}

package() {
  cd build
  DESTDIR="${pkgdir}" ninja install

  # install man page
  mandir=/usr/share/man/man6
  mkdir -p  ${pkgdir}/${mandir}
  gzip -c "${srcdir}/${pkgbase}/doc/xmoto.6" > "${pkgdir}/${mandir}/xmoto.6.gz"
}

