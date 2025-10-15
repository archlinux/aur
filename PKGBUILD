# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=3x-ui-bin
pkgver=2.8.5
pkgrel=1
pkgdesc="Xray panel supporting multi-protocol multi-user expire day & traffic & IP limit"
arch=(aarch64 armv7h i686 x86_64)
url="https://github.com/MHSanaei/${pkgname%-bin}"
license=(GPL-3.0-only)
depends=(sh)
optdepends=(
  'acme.sh: Certificate Management'
  'fail2ban: IP Limit Management'
  'openldap: LDAP integration'
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
sha256sums_aarch64=('05e69733ed2f4b00b4e9e0b62b2dae00729049bc44f9d0e91942e30d16a4f7ff')
sha256sums_armv7h=('3e30307d5d2042a02e60bfb6145ef5a9431d879dfccdaf7c37ca844ca9930677')
sha256sums_i686=('379b2895e23aebaa3df5320962aeaebd68b52a787eeab9d38f53be54c6fd0a4f')
sha256sums_x86_64=('a4cd678daca8687a32bdd96b2434b9a74a647d1361effec271c13779a153324a')
b2sums_aarch64=('928ad10b2cb27582aecb0807172577bffc108b33a697ed31b39ebd252daacd04d494d5be6f4c8c4b4a1568f8e8fe27b55be63bfb5936358507ae6cf5c96b5927')
b2sums_armv7h=('8557041ab386619e749574421a69f04a0ce0e20f71d47af9857ce6cf120e3abe83d59091aace6feb24f363291717303869b9999542c020497282889376465bb8')
b2sums_i686=('c839e715c84c4dc670bd2e524aeef5938612418bd887d3040b0ac16c41c213fbf8ac0d230bd9f8e1b9ddffaa462d60d6a4435797ce073bfe5d507f43f2ea5d3d')
b2sums_x86_64=('2257166ab4b5a208b41222c00317436c07c21925e6203ba73901febe97118678f689d86ca3a1e9e2799f76cd8b81066e0dc9ad75c4663adb577257adec00c734')

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
