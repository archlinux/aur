# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

_pkgname=gpm
pkgname=lib32-$_pkgname
pkgver=1.20.7
pkgrel=2
pkgdesc="A mouse server for the console and xterm (32 bit)"
arch=('x86_64')
url="https://www.nico.schottelius.org/software/gpm/"
license=('GPL')
depends=('lib32-ncurses' "$_pkgname")
options=('!makeflags')
source=(https://www.nico.schottelius.org/software/gpm/archives/${_pkgname}-${pkgver}.tar.lzma
        gpm-glibc-2.26.patch)
sha1sums=('8d9f3655c80ce7667d31ede2a100b44986480369'
          '57d98a5ed864ead76290d32a6899caaed0b55959')
sha256sums=('a955053b36556ffa7c628ce18fd6de7d625966573fa412fb08869533d8f7385c'
            '5430d5b43613af325eb50bd7338cca3098bb2d7d62ff01de657a77b5f211bfb7')

prepare() {
  cd $_pkgname-$pkgver
  patch -p1 -i ../gpm-glibc-2.26.patch # Fix build with glibc 2.26 (Debian)
}

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
