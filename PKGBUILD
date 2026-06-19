# Maintainer: Manuel Reimer <manuel.reimer@gmx.de>
# Maintainer: Tomasz Maciej Nowak <com[dot]gmail[at]tmn505>

pkgname='minisatip'
pkgdesc='SAT>IP server, tested with DVB-S, DVB-S2, DVB-T, DVB-T2, DVB-C, DVB-C2, ATSC and ISDB-T cards'
pkgver=2.0.86
pkgrel=1
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url='https://minisatip.org'
license=('GPL2')
conflicts=('minisatip-git')
depends=('libdvbcsa' 'openssl' 'xz' 'libnetceiver')
makedepends=('cmake')
optdepends=('oscam: channels descrambling')
backup=('etc/conf.d/minisatip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/catalinii/minisatip/archive/v${pkgver}.tar.gz"
        'minisatip.service'
        'minisatip.sysuser'
        'minisatip.conf')
sha256sums=('37161f478d7df1ee3399d8503409daca5e33664291c6cafed7f566ce346799fe'
            '57f0ea656c4a2bcf6199e2c4c4048ddcdbdb84d1d73849ee0657c4301b6bc255'
            '7f4e7fde7ded632f88b30b7cd0481c78309f8191b40369ae323cbb7240fdc199'
            'f7a28ad30d30c68ef54ba65cc562ce0d9a131f0ee2be20071cd93159f196946f')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  cmake -B build \
        -D CMAKE_INSTALL_PREFIX=/usr \
        -D CMAKE_BUILD_TYPE=RelWithDebInfo
  make -C build
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make -C build DESTDIR="$pkgdir" install

  install -Dm644 ${srcdir}/minisatip.service ${pkgdir}/usr/lib/systemd/system/minisatip.service
  install -Dm644 ${srcdir}/minisatip.sysuser ${pkgdir}/usr/lib/sysusers.d/minisatip.conf
  install -Dm644 ${srcdir}/minisatip.conf ${pkgdir}/etc/conf.d/minisatip
  mkdir -p "${pkgdir}/usr/share/minisatip/html"
  cp -r html "${pkgdir}/usr/share/minisatip"
}
