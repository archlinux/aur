# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=3x-ui-bin
pkgver=2.6.6
pkgrel=3
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
sha256sums_aarch64=('4168c264568695d84343d7af28d1de7975b3901a7132ca105b6e7b69ad5f10a5')
sha256sums_armv7h=('9e307852b93821807905d053d557c9959d6a9cc11c033ade0a0d6b3a7797b4a6')
sha256sums_i686=('975b88f307223212f4454bcf3b9c082c7c51a3155607962c3e5a1f6f210199c7')
sha256sums_x86_64=('033612d7714d33e774bc7986da0be0b3fe402b3f887f220d181d53643fe685cd')
b2sums_aarch64=('c6c6330960a5d724c56e206d8816d8fa9788df2190212966195e9133355635f91118fce36837f933c52d951e71095ce4368b787e25155408137178b3396be281')
b2sums_armv7h=('6e09f429e4c9fea05b568f43d555f05401b749121b327a846a01cda7d186683799f0314a3cf0fea77d1249266e1a56120848a4a202409b925a54cf50b5c9bfac')
b2sums_i686=('ea6b87b0e4120c7437d53d5cb8af80397016e937ffc48628d88c6ecd4301cd7560f9afbb94b4aac105700ac7b0426ae08c295679b372632e249c252abd181a9d')
b2sums_x86_64=('1c38b9a56947f77f0bbad0eec9aedb1d63b7521fc95e477d88335d2b1d3bb7f630f3ac1f5ffb7ef26a68c6673c2f5fba81e1d1c1415c19b8d64f2da482cac01e')

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
