# $Id: PKGBUILD 99895 2013-10-31 02:20:19Z allan $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Darwin Bautista <djclue917@gmail.com>

pkgname=belle-sip
pkgver=1.6.3
pkgrel=1
pkgdesc="A Voice-over-IP phone"
arch=('x86_64')
url="https://github.com/BelledonneCommunications/belle-sip/"
license=('GPL')
depends=('libantlr3c' 'gcc-libs' 'mbedtls' 'bctoolbox')
makedepends=('java-runtime')
options=('!emptydirs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/BelledonneCommunications/belle-sip/archive/$pkgver.tar.gz"
	"antlr.jar::https://github.com/antlr/website-antlr3/blob/gh-pages/download/antlr-3.4-complete.jar?raw=true")
noextract=('antlr.jar')
sha256sums=('cbdf9f79786fe13f553964b84892e8d3a08b6eae18fc5bdea5fcb445d7f1ce17'
            '9d3e866b610460664522520f73b81777b5626fb0a282a5952b9800b751550bf7')

prepare() {
  cd $pkgname-$pkgver
  sed -i \
    -e "s#antlr_java_prefixes=.*#antlr_java_prefixes="$srcdir"#" \
    -e "s|-Werror||g" \
    configure.ac
  sed -i \
    -e 's|bctbx_list_delete_link|bctbx_list_erase_link|g' \
    -e 's|bctbx_list_remove_link|bctbx_list_unlink|g' \
    include/belle-sip/list.h
  sed -i 's|, super->base.peer_cname ? super->base.peer_cname : super->base.peer_name ||' src/transports/tls_channel.c
}

build() {
  cd $pkgname-$pkgver
  [ -x ./configure ] || ./autogen.sh
  ./configure --prefix=/usr  --libexecdir=/usr/lib/$pkgname \
    --disable-tests --disable-static --enable-tls
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
