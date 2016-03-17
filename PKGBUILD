pkgname=voms
pkgver=2.0.13
pkgrel=1
arch=(i686 x86_64)
url="http://italiangrid.github.io/voms/"
depends=(expat gsoap openssl)
_gitrev="67eab8a269d99480f81af182ef09b2864d7147eb"
source=("git+https://github.com/italiangrid/voms#commit=$_gitrev")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --tags | sed 's/^v//; s/-/.r/; s/-/./g'
}

prepare() {
  cd "$pkgname"
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd "$pkgname"
  export GSOAP_SSL_PP_CFLAGS="$(pkg-config --cflags gsoapssl++ zlib)"
  export GSOAP_SSL_PP_LIBS="$(pkg-config --libs gsoapssl++ zlib)"
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir" install
}

# vim: ft=sh:ts=2:sw=2:et
