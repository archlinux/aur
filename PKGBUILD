# Maintainer: DLLCoolJ <archcloudlabs[at]gmail[dot]com>
# Contributor: KokaKiwi <kokakiwi+aur [at] kokakiwi [dot] net>
# Contributor: Nick Skelsey <nskelsey@gmail.com>

pkgname=zeek
pkgver=7.0.3
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

sha256sums=('029e389f5405d8831657202a7be542be756a8c5811bfaab7376c1c6b10e1d9e3'
	    '047c414eb4139d5c41757a0b84b518c723149becb40a3067b7203a6b8e8de9a8'
	    'af5b7e14caae88122d0e6dd29539ae77ed3388c70a12ea0ed73c9a3f6de16d91')

b2sums=('b0c9795bd65beed65cbf1503babf9bdb57ebb8354a6c40e6075340c468679a017fe99a4b366534a5762db732b6bbf9334e72358f93ec443da76ec8453f430d6c'
  '0ac8d04643d9b949d0dc9f8efe6e8369ddc8b1d1af7121dffb7a2d5e4961f617fb953565cd0c5b5a541184ef4b47bf400e4084fae1e855eb0154d650531d7a1a'
  'df5e4479c89cc2b0764e26e35bdcbcd7d00b131d7f4cd35c336e734ae334a40a2142285a2c8ea9db8961a34bb4d2799ba89505ab3e3881a16792c7e804ef1d73'
)

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

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  rm -rf "$pkgdir/usr/var"

  install -dm0755 "$pkgdir/var/lib/zkg"

  for exename in bro bro-config bro-cut; do
    ln -sf zeek "$pkgdir/usr/bin/$exename"
  done

  install -Dm0644 zeek.tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/zeek.conf"

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" \
    "zeek-$pkgver"/COPYING{,-3rdparty}
}
