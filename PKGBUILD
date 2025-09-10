# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=3x-ui-bin
pkgver=2.7.0
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
sha256sums_aarch64=('da0cef4b29dfa350676b80ab60a577274f4b819fb166f86732ef68f45a8b022e')
sha256sums_armv7h=('66a35dac11c4da13aacc7236924849953536ccb5bccdb7c820b23e16a133e765')
sha256sums_i686=('4c815ffc73ce174df87fb395df11ea4c14c20314ab6aa335cacbc0bb3199302e')
sha256sums_x86_64=('1ffca1fb94a6917ad05d831704c865353e46a60fa8e26f32bca7d84424e8c319')
b2sums_aarch64=('2c5623b2118a16f8afc87b065e82ba8f788b2342d28b80eb79fb6e170adb2de158e939402152362dfc69fc9ac4a5d5bd05ad4261495185bbfeeb1d896a99f4b0')
b2sums_armv7h=('f48309d3fdf7ed04002adc5145b4652ff7111f529c8928990f5051baf8840719075e8fcea7c4ebcfdb49eff62b458563f45c2588ae3659fbd0f809a7b79a14a0')
b2sums_i686=('ff50fac248c1f46484ad9c9e64ceaafd1d77de8636d7a1fe234e2e02bcb1b4ccefa9c0321d4bdc3484dc1fbd480a1981d4f5249e7af0f2d792967fbea9c82902')
b2sums_x86_64=('999acc436dbd8420e4201bccf03d0e091300fa229f6f4031110ae389e3747d9b5ea6af597b6629e8c272deaa225a0d797927a6e97feb3b69ea63605395ecdcfb')

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
