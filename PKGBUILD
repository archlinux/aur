# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=3x-ui-bin
pkgver=3.11.0
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
sha256sums_aarch64=('f50b4c30fd919d018f2f4c3d8db53a4ca027503d581328727770afb116a79d90')
sha256sums_armv7h=('ff0d68d633814a062ad123fbcceec9bbd921a2d816afd286831ecf144938c546')
sha256sums_i686=('0d18c6acb1cd2527502876a7b28a52bb18c39d4b66c9081b5fc3f2f07ff16ba4')
sha256sums_x86_64=('0ddfa4702f595442e2962acd81addc768fdacaa4ff2672c971a0463dae744916')
b2sums_aarch64=('99ea4b3855415ef799bd77d61186a6700f2e52b8f6e50023423e4a519bf7010fb80b1a538619100d517a4b35b1779caafe3630af6e4018a6621cbbc84708f2b7')
b2sums_armv7h=('a3d5d695bc162b0a9074acc638e96721186afaf533281f50f9f30af9408416e8fa14551eb519ce4d55964b990c3057bd92bb6eabc0ca50a1bff44f1aa4583936')
b2sums_i686=('08b5812fcb0900bf4c5a34dfa8f77833ab793adc30bf5b7e3fe051a8eba751f0f9fb2c788ccc4b4cd3fa971bd609f97d523d91aa18e4f782df95d3e92f8eed1b')
b2sums_x86_64=('68a89d68ddeebf0f35853525ffe8d3f85517a0444ab9098a6af99c445ada66b74983cdffa7a9d8a9719b8c2e0184141abe3d3d5dd75b6e675de667f7db382928')

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
