# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=3x-ui-bin
pkgver=3.10.2
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
  'postgresql: recommended for high client counts or multi-node setups'
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
sha256sums_aarch64=('a867c65ce52ad49f6504dd4c9c395337dc92ba57ae478da4f1b7ddb624014ed5')
sha256sums_armv7h=('26a3b94597b55d7465be55e5ce72f96967444998096cb5dacdb53f36a96482f7')
sha256sums_i686=('86279800adbc8cde68ff801ec6e486b974334d17c9b25347fee5aac2ec696464')
sha256sums_x86_64=('bfda7921984e7a72555c38d4e861c7a8b67b3686b658608937de99682f1452d0')
b2sums_aarch64=('9456700c422b9e00bd76c9c18443f8295c6706bbaa33dfc816a7d81210401f152c0ddb98f9165ee83889d9b800ba08ea1fa261ba05ab9bc4f42ff0d303f86301')
b2sums_armv7h=('e274cfd96b3d319129843e32f89d15e0fb48d2c10fa45b9c351c98f685939b531d0f89be2f56d12de5419bd0e51c47a07a8b5469775c2406890a47adc5939f30')
b2sums_i686=('18742837814cbf0112086fcd661cd8a9edd55626fbdfb5ac8ac9e73151f2c89a2fcd6c183e2ee7eb149ef2099169212191d98d124f3d5abd35914b41827a55ba')
b2sums_x86_64=('e86fe739a07d9166405ecadc8e130270e6e7e2e8ac0d55b6bd1431199d8e65c5b3a702c69152fee15afdb883fc1ff02451122a01d0f0b0bd666ad39a6f36a09a')

prepare() {
  cd ${pkgname:1:4}
  sed -i 's|:=/usr/local|:=/usr/lib|;s|:=/etc|:=/usr/lib|'                                   ${pkgname:1:4}.sh
  sed -i 's|&& legacy_version\( 0\)\?|\&\& echo "Please use AUR helper for this function"|g' ${pkgname:1:4}.sh
  sed -i 's|&& uninstall\( 0\)\?|\&\& echo "Please use AUR helper for this function"|g'      ${pkgname:1:4}.sh
  sed -i 's|&& update_menu|\&\& echo "Please use AUR helper for this function"|'             ${pkgname:1:4}.sh
  sed -i 's|&& update 0$|\&\& echo "Please use AUR helper for this function"|'               ${pkgname:1:4}.sh
  sed -i 's|&& update$|\&\& echo "Please use AUR helper for this function"|'                 ${pkgname:1:4}.sh
  sed -i 's|=/usr/local|=/usr/lib|'                                                          ${pkgname:1:4}.service.arch
  sed -i '/^ReadWritePaths=/s|$| -/usr/lib/x-ui|'                                            ${pkgname:1:4}.service.arch
}

package() {
  cd ${pkgname:1:4}
  install -vDm 755 ${pkgname:1:4}.sh                 "$pkgdir"/usr/bin/${pkgname:1:4}
  install -vDm 755 ${pkgname:1:4}                 -t "$pkgdir"/usr/lib/${pkgname:1:4}/
  install -vDm 755 bin/xray-linux-*               -t "$pkgdir"/usr/lib/${pkgname:1:4}/bin/
  install -vDm 755 bin/mtg-linux-*                -t "$pkgdir"/usr/lib/${pkgname:1:4}/bin/
  install -vDm 644 bin/geo{ip,site}{,_IR,_RU}.dat -t "$pkgdir"/usr/lib/${pkgname:1:4}/bin/
  install -vDm 644 ${pkgname:1:4}.service.arch       "$pkgdir"/usr/lib/systemd/system/${pkgname:1:4}.service
}
