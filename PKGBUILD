# Maintainer: DLLCoolJ <archcloudlabs[at]gmail[dot]com>
# Contributor: KokaKiwi <kokakiwi+aur [at] kokakiwi [dot] net>
# Contributor: Nick Skelsey <nskelsey@gmail.com>

pkgname=zeek
pkgver=6.0.1
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
sha256sums=('cfc329a170439195d7070ec5387d95cdda7eb6b86ac85ec707b9ed0e9d576a29'
	    '3d2d8800d9c56a95f220df0c07faf2a2d8ce9cf432ef6b4347cff1bbfbccfe42'
	    'af5b7e14caae88122d0e6dd29539ae77ed3388c70a12ea0ed73c9a3f6de16d91')

b2sums=('4a3389747b50d7c1631a5130074b58654e7f83b90eab0e48b326d11177718fcda6373b1b97d03cf2db8e2044244ae793c0f43c13422ef4279173a6917f3aff5d'
	'1ffb94ab9f502c6afccfdffd0cbf76731ce773c191573651bc3bfa794d43bf4e5d14fe3876f62e38315c27df526455764ea6bc022732f3e5f095df59be96dad5'
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
