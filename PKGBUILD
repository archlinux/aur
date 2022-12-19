# Maintainer: Manuel Reimer <manuel.reimer@gmx.de>
# Maintainer: Tomasz Maciej Nowak <com[dot]gmail[at]tmn505>

pkgname='minisatip'
pkgdesc='SAT>IP server, tested with DVB-S, DVB-S2, DVB-T, DVB-T2, DVB-C, DVB-C2, ATSC and ISDB-T cards'
pkgver=1.2.44
pkgrel=1
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url='https://minisatip.org'
license=('GPL2')
conflicts=('minisatip-git')
depends=('libdvbcsa' 'openssl' 'libmcli')
optdepends=('oscam: channels descrambling')
backup=('etc/conf.d/minisatip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/catalinii/minisatip/archive/v${pkgver}.tar.gz"
        'minisatip.service'
        'minisatip.sysuser'
        'minisatip.conf')
sha256sums=('e78bd05d0d8c0de19018fc02b1b87eef2860420b534ff46503f34284681fc01a'
            '36631c2467b3486cf5f4d2fd3f9374959ac0aa89b0e6443a3883aa62440d682a'
            '7f4e7fde7ded632f88b30b7cd0481c78309f8191b40369ae323cbb7240fdc199'
            'f7a28ad30d30c68ef54ba65cc562ce0d9a131f0ee2be20071cd93159f196946f')

prepare() {
  cd ${srcdir}/${pkgname}-${pkgver}
  sed -e 's, \"\~\" REVISION,,' -i src/minisatip.h
}

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --with-mcli=/usr/include/libmcli
  make MINOR=${pkgver##*.}
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  install -Dm644 ${srcdir}/minisatip.service ${pkgdir}/usr/lib/systemd/system/minisatip.service
  install -Dm644 ${srcdir}/minisatip.sysuser ${pkgdir}/usr/lib/sysusers.d/minisatip.conf
  install -Dm644 ${srcdir}/minisatip.conf ${pkgdir}/etc/conf.d/minisatip
  install -Dm755 minisatip ${pkgdir}/usr/bin/minisatip
  mkdir -p "${pkgdir}/usr/share/minisatip/html"
  cp -r html "${pkgdir}/usr/share/minisatip"
}
