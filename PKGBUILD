# Maintainer: KokaKiwi <kokakiwi+aur [at] kokakiwi [dot] net>
# Contributor: Nick Skelsey <nskelsey@gmail.com>

pkgname=zeek
pkgver=5.1.3
pkgrel=1
pkgdesc="A network analysis framework"
arch=('x86_64')
url="https://zeek.org"
license=('BSD')
depends=(zlib libpcap bash libmaxminddb python)
makedepends=(cmake swig bison flex openssl geoip gperftools shadow)
optdepends=(
  'python-semantic-version: zeekpkg'
)
source=("https://download.zeek.org/zeek-$pkgver.tar.gz"{,.asc}
        zeek.tmpfiles.conf)
sha256sums=('57b4fc5b3a909dd939383b31771ae7bb603f16a69372ed8c12ba4a750ac4d060'
            'SKIP'
            'af5b7e14caae88122d0e6dd29539ae77ed3388c70a12ea0ed73c9a3f6de16d91')
b2sums=('c2719afa140a98b18d2dd7ea63a9fa0ec233616b168d4ff1c220671bcba53bebc6ccf62158c40d98410a8eae4f457b71bf792808bb93a745467a2a1d3fc449cf'
        'SKIP'
        'df5e4479c89cc2b0764e26e35bdcbcd7d00b131d7f4cd35c336e734ae334a40a2142285a2c8ea9db8961a34bb4d2799ba89505ab3e3881a16792c7e804ef1d73')
validpgpkeys=(
  962FD2187ED5A1DD82FC478A33F15EAEF8CB8019 # The Zeek Team <info@zeek.org>
)

build() {
  cmake -B build -S "zeek-$pkgver" \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D ZEEK_PYTHON_PREFIX:PATH=/usr \
    -D ZEEK_ETC_INSTALL_DIR:PATH=/etc \
    -D ZEEK_STATE_DIR:PATH=/var/lib \
    -D ZEEK_SPOOL_DIR:PATH=/var/spool \
    -D ZEEK_LOG_DIR:PATH=/var/log/zeek \
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

  install -dm0755 "$pkgdir/var/lib/zkg"

  for exename in bro bro-config bro-cut; do
    ln -sf zeek-wrapper "$pkgdir/usr/bin/$exename"
  done

  install -Dm0644 zeek.tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/zeek.conf"

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" \
    "zeek-$pkgver"/COPYING{,.3rdparty}
}
