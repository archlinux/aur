# Maintainer: KokaKiwi <kokakiwi+aur [at] kokakiwi [dot] net>
# Contributor: Nick Skelsey <nskelsey@gmail.com>

pkgname=zeek
pkgver=4.2.0
pkgrel=2
pkgdesc="A network analysis framework"
arch=('x86_64')
url="https://zeek.org"
license=('BSD')
depends=(zlib libpcap bash libmaxminddb python)
makedepends=(cmake swig bison flex openssl geoip gperftools shadow)
source=("https://download.zeek.org/zeek-$pkgver.tar.gz"{,.asc}
        zeek.tmpfiles.conf
        0001-Make-ZKG-state-dir-configurable.patch)
sha256sums=('8d9a028ca9fec7ad4a9e48a763e296052384cf402ea4cd371577bff183c27451'
            'SKIP'
            'af5b7e14caae88122d0e6dd29539ae77ed3388c70a12ea0ed73c9a3f6de16d91'
            'e9950f5772ce7df9ac63cd2b11367f2ae032f2eebcef64ba5b979335a19a12f5')
validpgpkeys=(
  962FD2187ED5A1DD82FC478A33F15EAEF8CB8019 # The Zeek Team <info@zeek.org>
)

prepare() {
  cd "zeek-$pkgver"

  patch -Np1 -i "$srcdir/0001-Make-ZKG-state-dir-configurable.patch"
}

build() {
  cmake -B build -S "zeek-$pkgver" \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D ZEEK_PYTHON_PREFIX:PATH=/usr \
    -D ZEEK_ETC_INSTALL_DIR:PATH=/etc \
    -D ZEEK_ZKG_STATE_DIR:PATH=/var/lib/zkg \
    -D BINARY_PACKAGING_MODE=ON \
    -D BUILD_SHARED_LIBS=ON \
    -D BUILD_STATIC_BINPAC=ON \
    -D BROKER_DISABLE_TESTS=ON \
    -D BROKER_DISABLE_DOC_EXAMPLES=ON \
    -D INSTALL_AUX_TOOLS=ON \
    -D INSTALL_ZEEK_ARCHIVER=ON \
    -D INSTALL_ZKG=ON

  make -C build
}

package() {
  make -C build install DESTDIR="$pkgdir"

  rm -rf "$pkgdir/usr/var"

  for exename in bro bro-config bro-cut; do
    ln -sf zeek-wrapper "$pkgdir/usr/bin/$exename"
  done

  install -Dm0644 zeek.tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/zeek.conf"

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" \
    "zeek-$pkgver"/COPYING{,.3rdparty}
}
