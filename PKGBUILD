# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=3x-ui-bin
pkgver=2.8.6
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
sha256sums_aarch64=('795bfd1f12c59f35a90ebf4b99ba087ec544c4db9562a5ba53ab68b3a70d1831')
sha256sums_armv7h=('28da844fa92858bf65cbaddcf4bf463d9b66435194f8468c9efa7f9f17906c59')
sha256sums_i686=('1938e72e243b056f3e5e5a7557276abfbfd60cb533322da6f60f5a552986a74d')
sha256sums_x86_64=('e6f952f0aca7ec8f8aebd6c15312cd8ca2d9f3d9fd6e7dfa1164c9bb5f261902')
b2sums_aarch64=('f94f863f9b1c25df71bdda90d2a146fdf9e06d80cd061bdcb6404a44a571c53287dfc4b93cfc24f8dcb9f6689e08b3b28616165f59634352536463e428632b7d')
b2sums_armv7h=('ff82d748f208154570d4880579c7a79206160171871532046530b7acd2f0de096fba6e96af545d91b5a4275a33d659d2b07604e3e13eda553b4766f0e4dc435b')
b2sums_i686=('fdc7f15b6e653ec20be4987f9c4bd2db442f18415c8bf0631b7c095d5050c5b2163b8580b0221915ac2cbbbb3f9707e043dd307d648f734d872a1fa47358ceeb')
b2sums_x86_64=('2e5b5a247d7ec2f665f3d4e5724037403caa4c2ebb2cb81216cb451b07146de6dbab48956d8f17ccfadefe074ba384d065122c024467e6bd0faafa80ff23a65e')

prepare() {
  cd ${pkgname:1:4}
  sed -i 's|:=/usr/local|:=/usr/lib|'                                                        ${pkgname:1:4}.sh
  sed -i 's|:=/etc|:=/usr/lib|'                                                              ${pkgname:1:4}.sh
  sed -i 's|&& legacy_version\( 0\)\?|\&\& echo "Please use AUR helper for this function"|g' ${pkgname:1:4}.sh
  sed -i 's|&& uninstall\( 0\)\?|\&\& echo "Please use AUR helper for this function"|g'      ${pkgname:1:4}.sh
  sed -i 's|&& update_menu|\&\& echo "Please use AUR helper for this function"|'             ${pkgname:1:4}.sh
  sed -i 's|&& update 0$|\&\& echo "Please use AUR helper for this function"|'               ${pkgname:1:4}.sh
  sed -i 's|&& update$|\&\& echo "Please use AUR helper for this function"|'                 ${pkgname:1:4}.sh

  sed -i 's|EnvironmentFile=-/etc/default/x-ui|EnvironmentFile=-/etc/x-ui/x-ui.env|'         ${pkgname:1:4}.service.debian
  sed -i 's|WorkingDirectory=/usr/local/x-ui/|WorkingDirectory=/usr/lib/x-ui/|'              ${pkgname:1:4}.service.debian
  sed -i 's|ExecStart=/usr/local/x-ui/x-ui|ExecStart=/usr/lib/x-ui/x-ui|'                    ${pkgname:1:4}.service.debian
}

package() {
  cd ${pkgname:1:4}
  install -vDm 755 ${pkgname:1:4}.sh                 "$pkgdir"/usr/bin/${pkgname:1:4}
  install -vDm 755 ${pkgname:1:4}                 -t "$pkgdir"/usr/lib/${pkgname:1:4}/
  install -vDm 755 bin/xray-linux-*               -t "$pkgdir"/usr/lib/${pkgname:1:4}/bin/
  install -vDm 644 bin/geo{ip,site}{,_IR,_RU}.dat -t "$pkgdir"/usr/lib/${pkgname:1:4}/bin/
  install -vDm 644 ${pkgname:1:4}.service.debian     "$pkgdir"/usr/lib/systemd/system/${pkgname:1:4}.service
}
