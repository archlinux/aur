# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=3x-ui-bin
pkgver=2.8.3
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
sha256sums_aarch64=('af50567393a4eb2965f05d73a00d180190549c85ae020d8768b1e30ecc9a6421')
sha256sums_armv7h=('c1ab2627b124d495bb8601798506a15ab298a0daef71556d20afa707f92883e2')
sha256sums_i686=('87288cb7294ab2c472afa6bbd2f9fc4a1b9ac8e11e07954c26e3c1f6e6eb327c')
sha256sums_x86_64=('4dbf6968483ac658b735d7c0c272df50c5289e65497148a10031105af7d81416')
b2sums_aarch64=('1b45355638a9a8078277e89409eedd9c9386da6f6e6fac50e78d16f9e75825634817f17261f240ac46236759f504cfc359f8de58be3e3f65b5f028cba625146f')
b2sums_armv7h=('93920cc904eb92853c8e3cdbaebaf141e06755a8312b97e1c6dda9ed626cc2ae63317fa797b16084b6bcd682218fda735229d25b6ce1766e57832cc5c0e2bc83')
b2sums_i686=('f70434a4d7d06a32dcf1100c4eb2f463eb3a1ded53317ed44f936aaa993f48a5e05901a947a78d043b778addc04ccc5cc73549fecf0535bd68a03dbdc0eae3a3')
b2sums_x86_64=('c1e92b8d73e89cb507564e499c80b3f4841ff4de9fbbc89a979bf97fdd330a745a39679878de1684f69c4ddfbdf2efccea065540f409d0c57211e9a3ee6831a7')

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
