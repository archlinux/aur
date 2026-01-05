# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=3x-ui-bin
pkgver=2.8.7
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
sha256sums_aarch64=('da01a88cba2d27e5d4657c9e8ea2c24ace26f7e384c3e36b2b576cb5cec22064')
sha256sums_armv7h=('0fcd0d88908a112e9627fc224d2a521408b7bc9688ce77ebd8feabfd75d9fbce')
sha256sums_i686=('24ff0835b134289573f9d007d6461d5650f38400775e2a64808c7d4a8edb0bdc')
sha256sums_x86_64=('1042951b309705b610f7f763f6bdff9ac16244aa12f53547c159653b291c4dc0')
b2sums_aarch64=('f9f3aa07a46f303cd3d58070cd075a6b943b6e26055e4a18e6bb6e41049e05d688305a660909de312fcdafa436dd1f1dae35133b6217fd9b7963f22f4d5da0fb')
b2sums_armv7h=('0cc7dc98e4ab20180fcc8cfd4ca36e6374709cb437e07424dfdb957c6b16d37a0b2a6e509d1023556f958c9065ee53d3ac9084aeeabcbbf4b29beca94c8e65f2')
b2sums_i686=('4daa9b782b0bc7c22e0308cb23c3a9a68f15f37cb21ed8a24ba431fad33236ad580295d9af0b91506d199af93a1e6c376ad668b3726d587a8b2d5a543c9942a5')
b2sums_x86_64=('b51b6b5db431a5db68e84941701b6cb48ff9868f0f7a6b71f3d8cc30c94d7acf7ad362e2334201eaf18664ddfb73d0d680caa507b1a109be4df1e1adc0881875')

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
