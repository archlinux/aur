# Maintainer: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>

pkgname=hashdb
pkgver=3.1.0
_pkgver=3.1.0
pkgrel=2
pkgdesc='Tool for finding previously identified blocks of data in media such as disk images'
arch=('i686' 'x86_64')
url='https://github.com/NPS-DEEP/hashdb/wiki'
license=('GPL')
depends=(openssl bzip2 libewf)
makedepends=(
automake-1.15
)
source=(http://digitalcorpora.org/downloads/hashdb/hashdb-$_pkgver.tar.gz
configure.patch
)
sha256sums=('b524018f52248058c11a1efffcca6ab61c60a100102d3dd78cb4081ee793b60c'
            '56fc95bc5e2b318fdc4f92cd4e09c13d0ecdf99b044119aa43a1992df3487ebc')

prepare(){
  cd "$srcdir"/$pkgname-$_pkgver
  patch -p1 -i "$srcdir"/configure.patch
#   sed -i s/SSL_library_init/OPENSSL_init_ssl/ configure.ac configure
}
build(){
  cd "$srcdir"/$pkgname-$_pkgver
  options=(
    --prefix=/usr
    --enable-dependency-tracking
    --enable-mcheck
    --enable-address-sanitizer
  )
#   PKG_CONFIG_PATH+='/usr/lib/pkgconfig' \
#   LDFLAGS+=" -L/usr/lib/openssl-1.0 -lssl -lcrypto" \
#   CFLAGS+=" -I/usr/include/openssl-1.0" \
    ./configure ${options[*]}
  make
}
package(){
  cd "$srcdir"/$pkgname-$_pkgver
  make DESTDIR="$pkgdir/" install
}
