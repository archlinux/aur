# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=3x-ui-bin
pkgver=2.8.2
pkgrel=1
pkgdesc="Xray panel supporting multi-protocol multi-user expire day & traffic & IP limit"
arch=(aarch64 armv7h i686 x86_64)
url="https://github.com/MHSanaei/${pkgname%-bin}"
license=(GPL-3.0-only)
depends=(sh)
optdepends=(
  'acme.sh: Certificate Management'
  'fail2ban: IP Limit Management'
  'openssh: SSH Port Forwarding Management'
  'speedtest-cli: Speedtest by Ookla'
  'ufw: Firewall Management'
)
provides=(${pkgname%-bin})
conflicts=(${pkgname%-bin})
options=(!debug)
source_aarch64=($url/releases/download/v$pkgver/${pkgname:1:4}-linux-arm64.tar.gz)
source_armv7h=( $url/releases/download/v$pkgver/${pkgname:1:4}-linux-armv7.tar.gz)
source_i686=(   $url/releases/download/v$pkgver/${pkgname:1:4}-linux-386.tar.gz)
source_x86_64=( $url/releases/download/v$pkgver/${pkgname:1:4}-linux-amd64.tar.gz)
sha256sums_aarch64=('157fbcae2c775233643b4775a4afd8708a0f623b5aaa83e5de0ba1751ed5692f')
sha256sums_armv7h=('490529c8759962ea58032f3152e32b13c8a2030abbd6d4abdd981c9f04aef6ea')
sha256sums_i686=('f86a244eade7d9e49cc1156a461efd788b12d82424b47037f4b3b2c24bffd2e2')
sha256sums_x86_64=('8a010d881dd8fb57cacab7c080a57fb7e4a4c6c94c266a903b0cb84ee4a86bf5')
b2sums_aarch64=('be804f9e0169b6c1e8c6f0da05dba419e27ab785d4340f44943cfdaef5e7cc1ef48de595336e9960f2724cb3c16728117f9726b6ae9f22a5ab39ab97a6c63ccb')
b2sums_armv7h=('a84c1d403119ca485075049c6d5993ca740c7029c71ed56d0afef197c9c780b061871bf27c117efbc693351f8ca64f882b6e786090f640642fd4eafc93f2817a')
b2sums_i686=('b5f7d5b31b1f2b85f0b2e500fea1af313f7d656488297ce6f0b08417b6cbabd412db919eeb09a5bd52e9323678c04630ff4410506c2122f16def130f3d155940')
b2sums_x86_64=('3a550f0933c2deedd5f392114b994765908abd7ccccae8676c714a0ff8e4905299abede979e4b850fa355b887aa8d707d97058c679189b0098b84497f1a6e151')

prepare() {
  sed -i 's|/etc/systemd/system/|/usr/lib/systemd/system/|g'                    ${pkgname:1:4}/${pkgname:1:4}.sh
  sed -i 's|/usr/local/x-ui/bin|/usr/lib/x-ui/bin|g'                            ${pkgname:1:4}/${pkgname:1:4}.sh
  sed -i -E 's|wget -O ([^ ]+) ?-?N? (https?://[^ ]+)|curl -L -o \1 \2|g'       ${pkgname:1:4}/${pkgname:1:4}.sh
  sed -i -E 's|wget -N (https?://[^ ]+/([^/ ]+))|curl -L -o \2 \1|g'            ${pkgname:1:4}/${pkgname:1:4}.sh
  sed -i 's|/usr/local/|/usr/lib/|g'                                            ${pkgname:1:4}/${pkgname:1:4}.sh
  sed -i 's|WorkingDirectory=/usr/local/x-ui/|WorkingDirectory=/usr/lib/x-ui/|' ${pkgname:1:4}/${pkgname:1:4}.service
  sed -i 's|ExecStart=/usr/local/x-ui/x-ui|ExecStart=/usr/lib/x-ui/x-ui|'       ${pkgname:1:4}/${pkgname:1:4}.service
}

package() {
  cd ${pkgname:1:4}
  install -vDm 755 ${pkgname:1:4}.sh                 "$pkgdir"/usr/bin/${pkgname:1:4}
  install -vDm 755 ${pkgname:1:4}                 -t "$pkgdir"/usr/lib/${pkgname:1:4}/
  install -vDm 755 bin/xray-linux-*               -t "$pkgdir"/usr/lib/${pkgname:1:4}/bin/
  install -vDm 644 bin/geo{ip,site}{,_IR,_RU}.dat -t "$pkgdir"/usr/lib/${pkgname:1:4}/bin/
  install -vDm 644 ${pkgname:1:4}.service         -t "$pkgdir"/usr/lib/systemd/system/
}
