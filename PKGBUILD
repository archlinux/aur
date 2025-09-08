# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=3x-ui-bin
pkgver=2.6.7
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
sha256sums_aarch64=('d5a7b32fec3a287fbcd2009247733b8b72e8314bb519339820556827491792a2')
sha256sums_armv7h=('9693bc6f802876d33e0142771078269842a446d64070dfe7f37b7d656155f284')
sha256sums_i686=('d061fe4397a68f3a8badcf09ddbb535dd73b72203f52328a597a9d487c55ab86')
sha256sums_x86_64=('c18fba07ae3fa471008cecf1260fccaa876e5a2569ac4508a8596c6de60fde46')
b2sums_aarch64=('39d62820537217eaaeaf2fd8edf3b599dec31ff7f6789b51481e5893797c3360b6b1de72b18c5390e8056b3bae02ef72ab5cfff93159fdb086f9520a09e916d1')
b2sums_armv7h=('3198fbeb394553060974b4ef1ae3a4f8a6fd2be3f4a31a0e4de174ae837852a8b46e45b1df80f6479e525931f1a76daab67993654e46a09bf0c48850b0c4d450')
b2sums_i686=('7ac06c600d6988730418e5305e205b5967173476d3a2fd4d27cee923471ce4577382c3f30a8bab9c4333a396bb53129a479001dbca731f12bc6dec556dc8fc78')
b2sums_x86_64=('2483b9fe06337c9f5304ea4cbbaf6c51d618af899684805b1a39d834ef98241fb1e538aca1c793b314df3e2c51e5abab97fea4b47df47d8b382c79f8ad3742ae')

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
