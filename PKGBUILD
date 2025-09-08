# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=3x-ui-bin
pkgver=2.6.8
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
sha256sums_aarch64=('65eedb291543c24401ac08318ca1568ebbceb83477a13c9afd7c3ad4deb4ee1a')
sha256sums_armv7h=('604826a8905af1adcdd32017b98634a517cf0a6d57628fb7ea196a322433739a')
sha256sums_i686=('9928ad51329332446bcddc22e335690ebde3976e9e42ba3a86ea84675fc1abd8')
sha256sums_x86_64=('12b5772c3b5587fba0e511294c39ab4e3be5c0b2721c4cfffaf128cfc69840e5')
b2sums_aarch64=('a6d7912c06f63ab4331ac0dbdc1e659b20c8adb9d5ac0c223757ec234b4c8d46665e4c7681e9e13e5a6a160907d20cf3dbf3f8dc69ed25dd2602fcb361cebdca')
b2sums_armv7h=('63298f231b9fdb86ff09b217755ec6aedd07ad304e067cdcc94fb9e31e3c29c56c8d2c9703b256613960984ed0beac7a3cccb0a8b3ddf5fda9068583dfa47003')
b2sums_i686=('45b39be3634baa5d6bd9b316bf2ab9e1ee6827712e46ec2be50d919e129da845e811e6642d0c749ddc7de61dec545e54e73648120ffe2cb98a44376f5bfaab85')
b2sums_x86_64=('985b72b00816533636b1ceac94512f1b47d31de2a293ef097d807c5ebbede6746666706c6db96ec47027480bce3cc714c3d418424e8ea250bb24de715e796320')

prepare() {
  sed -i 's|/etc/systemd/system/|/usr/lib/systemd/system/|g'                    ${pkgname:1:4}/${pkgname:1:4}.sh
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
