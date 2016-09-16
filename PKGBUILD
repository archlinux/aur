# Maintainer: Eric Berquist <eric DOT berquist AT gmail DOT com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Sébastien Luttringer
# Contributor: SpepS <dreamspepser at yahoo dot it>
# Contributor: Laszlo Papp <djszapi at archlinux us>
# Contributor: Donald Ephraim Curtis <dcurtis@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

_pkgname=lua-posix
pkgname="${_pkgname}-git"
pkgver=33.4.0.11.g3ab67b5
pkgrel=2
pkgdesc='POSIX library for Lua'
arch=('x86_64' 'i686')
url='https://github.com/luaposix/luaposix'
license=('MIT')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
depends=('lua')
makedepends=('git' 'help2man' 'ldoc')
options=('!makeflags')
source=("${_pkgname}::git://github.com/luaposix/luaposix.git")
md5sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --always | sed 's+^v++' | sed 's+-+.+g'
}

prepare() {
  cd "${_pkgname}"
  sed -i '19,20d' bootstrap.conf
}

build() {
  cd "${_pkgname}"

  luaver=$(/usr/bin/lua -v | cut -d " " -f 2 | cut -d "." -f 1,2)

  ./bootstrap

  ./configure \
      LUA=/usr/bin/lua \
      --prefix=/usr \
      --libdir=/usr/lib/lua/${luaver} \
      --datadir=/usr/share/lua/${luaver} \
      --docdir=/usr/share/doc/lua-posix

  make
}

package() {
  cd "${_pkgname}"

  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
