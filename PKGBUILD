# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

_pkgname=gpm
pkgname=lib32-$_pkgname
pkgver=1.20.7
pkgrel=1
pkgdesc="A mouse server for the console and xterm (32 bit)"
arch=('x86_64')
url="http://www.nico.schottelius.org/software/gpm/"
license=('GPL')
depends=('lib32-ncurses' "$_pkgname")
options=('!makeflags')
source=(http://www.nico.schottelius.org/software/gpm/archives/${_pkgname}-${pkgver}.tar.lzma)
sha1sums=('8d9f3655c80ce7667d31ede2a100b44986480369')

build() {
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cd "${srcdir}/${_pkgname}-${pkgver}"
  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc --sbindir=/usr/bin --libdir=/usr/lib32
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

# library fixes
  cd "${pkgdir}/usr/lib32/"
  ln -s libgpm.so.2.* libgpm.so
  chmod 755 "${pkgdir}"/usr/lib32/libgpm.so.*

  rm -rf "${pkgdir}"/usr/{bin,include,share} "$pkgdir"/etc
}
