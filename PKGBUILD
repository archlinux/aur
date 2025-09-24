# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=3x-ui-bin
pkgver=2.8.4
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
sha256sums_aarch64=('2966cda020975612d9e0b4d7c7f5b5bbe4f5121934db4f2a016b75c4d982eb59')
sha256sums_armv7h=('dff94f5611a1d6cb7085a077425791ee9273db4806b9658b8a356366aea6aede')
sha256sums_i686=('bfbc8323348302175160cded635f6852078b85aeed1a4fb467d8788457a2cad2')
sha256sums_x86_64=('1dbc8a8e730c7c8379728990989b76b5170bf7ae438cf7a73e03fe49041b88cc')
b2sums_aarch64=('2371d270d8a074e16f2fe08b245b02f8071765f9e2772b140195f43b582a36b64aba2a112634da479f89087c6516fc85a0a9c2610cf377e310d07e3837f90ae4')
b2sums_armv7h=('ac99b956de135d52010b1e15c016717a33481307a8b11ccd2614270ad0cfa03ec7581f043a9fe35610569a05f6a9281a27c87c325f7456e9ad0b5702b4266132')
b2sums_i686=('92259fc957d4690c4aac6fe17123bbf2eb5da9171d2ca6b9ef03c063a88c846b90b154a3eb944157ec5bf6e25203a0c389d31f4592cfaf9d0570e21df2e91151')
b2sums_x86_64=('93dd16820f446de083cbba0d6dc2c4a521642d4b8cd1b47a1ec5ff55ff0203662366b5e96842f62ebbf0e784f2be12166d533e0bc3d84046499ef350fc0ffe95')

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
