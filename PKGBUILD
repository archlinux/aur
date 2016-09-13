pkgname=voms
pkgver=2.0.14
_gitrev="75c7c201136c5588eb79a2060d8f50f040203e28"
pkgrel=1
pkgdesc="Virtual Organisation Membership Service (C/C++ clients and APIs)"
arch=(i686 x86_64)
url="http://italiangrid.github.io/voms/"
depends=(expat gsoap openssl)
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
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --sbindir=/usr/bin \
    ;
  make
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir" install
  rm -rf "$pkgdir/etc/rc.d"
  rm -rf "$pkgdir/etc/sysconfig"
}

# vim: ft=sh:ts=2:sw=2:et
