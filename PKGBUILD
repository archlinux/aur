# Contributor: dreieck
# Contributor: Nathan Jones <nathanj439@gmail.com>

pkgname=ifstat
pkgver=1.1.1
pkgrel=3
pkgdesc="A tool to report network interfaces bandwith just like vmstat/iostat do for other system counters"
arch=('i686' 'x86_64')
url="https://github.com/matttbe/ifstat"
license=('GPL-2.0-or-later')
install=ifstat.install
depends=(
  'glibc'
)
optdepends=(
  'net-snmp: Gather statistics from remote equipments'
)
provides=(
  "libifstat=${pkgver}"
)
conflicts=(
  'libifstat'
)
source=("ifstat-${pkgver}.tar.gz::https://github.com/matttbe/ifstat/archive/refs/tags/v${pkgver}.tar.gz"
        "rename_ifstat_ifstat2.patch")
md5sums=(
  '5f5461e7b1ad08195b2a85d0995665ff'
  '4d299f8c7896b0c5046867070137ad09'
)

prepare() {
  cd "$pkgname-$pkgver"
  patch -p1 -i "$srcdir/rename_ifstat_ifstat2.patch"
}

build() {
  cd "$pkgname-$pkgver"
  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --disable-static \
    --enable-shared \
    --enable-optim \
    --enable-library \
    --with-proc \
    --with-kstat \
    --with-ifmib \
    --with-ifdata \
    --with-route \
    --with-kvm \
    --with-dlpi \
    --with-snmp \
    --with-libcrypto
  make libifstat-config
  make
}

package() {
  cd "$pkgname-$pkgver"
  install -Dvm755 -t "${pkgdir}/usr/bin"            ifstat2 libifstat-config
  install -Dvm644 -t "${pkgdir}/usr/lib"            libifstat.a
  install -Dvm644 -t "${pkgdir}/usr/share/man/man1" ifstat2.1 libifstat-config.1

  install -Dvm644 -t "${pkgdir}/usr/share/doc/ifstat"          HISTORY INSTALL README TODO VERSION
  install -Dvm655 -t "${pkgdir}/usr/share/licenses/${pkgname}" COPYING
}
