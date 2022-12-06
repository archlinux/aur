# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

_pkgname=gpm
pkgname=lib32-$_pkgname
pkgver=1.20.7.r38.ge82d1a6
pkgrel=1
_commit='e82d1a653ca94aa4ed12441424da6ce780b1e530'
pkgdesc="A mouse server for the console and xterm (32 bit)"
arch=('x86_64')
url="https://www.nico.schottelius.org/software/gpm/"
license=('GPL')
depends=('lib32-ncurses' "$_pkgname")
makedepends=('git')
options=('!makeflags')
source=("git+https://github.com/telmich/gpm.git#commit=${_commit}")
sha1sums=('SKIP')
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname

  GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"
  printf '%s.r%s.g%s' \
    "${GITTAG}" \
    "$(git rev-list --count ${GITTAG}..)" \
    "$(git rev-parse --short HEAD)"
}

build() {
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cd ${_pkgname}
  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc --sbindir=/usr/bin --libdir=/usr/lib32
  make
}

package() {
  cd ${_pkgname}
  make DESTDIR="${pkgdir}" install

# library fixes
  cd "${pkgdir}/usr/lib32/"
  ln -s libgpm.so.2.* libgpm.so
  chmod 755 "${pkgdir}"/usr/lib32/libgpm.so.*

  rm -rf "${pkgdir}"/usr/{bin,include,share} "$pkgdir"/etc
}
