# Maintainer: Mark Collins <tera_1225 hat hotmail.com>
# based on PKGBUILD of mautrix-whatsapp by: Lorenz Steinert <lorenz@steinerts.de> and  Matthew Murray <matt@compti.me>
pkgname=mautrix-whatsapp-bin
provides=('mautrix-whatsapp')
conflicts=('mautrix-whatsapp')
pkgver=0.2604.0
pkgrel=1
pkgdesc="A Matrix-Whatsapp puppeting bridge (binary release)"
arch=('x86_64' 'armv7h' 'aarch64')
license=('AGPL-3.0-or-later')
optdepends=('ffmpeg: If you want to send gifs from Matrix')
url="https://github.com/mautrix/whatsapp"
source_x86_64=("$pkgname-x86_64-$pkgver::${url}/releases/download/v${pkgver}/mautrix-whatsapp-amd64")
source_armv7h=("$pkgname-armv7h-$pkgver::${url}/releases/download/v${pkgver}/mautrix-whatsapp-arm")
source_aarch64=("$pkgname-aarch64-$pkgver::${url}/releases/download/v${pkgver}/mautrix-whatsapp-arm64")
source=("${pkgname/-bin}-${pkgver}.zip::${url}/archive/refs/tags/v${pkgver}.zip"
        sysusers-mautrix-whatsapp.conf
        mautrix-whatsapp.tmpfiles
        mautrix-whatsapp.service
        log-path.diff)
sha256sums=('0903c51ab766079263993b5fe92212ad2c6a79a7fc8e1fd74b0e8dbde53f6c26'
            '409e8fb3e35de1bd1ceebefa0ac275ad62ec66680117648058bcc177ddd2f9a1'
            '82adf61bafaab22db6ddb32f6abd903e28c3f250043d4c6bc8a81a3fb70ae6b8'
            'e1c52d5e68656ce03858ea6aeb36fee06221f874511eaa67ee4d3f17d964a881'
            '6313f15046bc58887532c0cc019a912582b87501a188fefd80b82023e67754f3')
sha256sums_x86_64=('3898b3bd7824c0fd5412c99d2e42beeca90d4103f0e63ae62bdfdea7f48a4406')
sha256sums_armv7h=('fe58c29dd2bd110683826ae96dd75cd5cf235d1341768437450d67261ce3f931')
sha256sums_aarch64=('2662fc36350eaee446606215b309f6e6b2f52c6536bda5fbff3e93f36437161d')
backup=("etc/${pkgname/-bin}/mautrix-whatsapp.yaml")


package() {
  install -Dm755 "$srcdir/$pkgname-$CARCH-$pkgver" "$pkgdir/usr/bin/${pkgname/-bin}"
  install -Dm644 "$srcdir/sysusers-mautrix-whatsapp.conf" "$pkgdir/usr/lib/sysusers.d/mautrix-whatsapp.conf"
  install -Dm644 "$srcdir/mautrix-whatsapp.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/mautrix-whatsapp.conf"
  install -Dm644 "$srcdir/mautrix-whatsapp.service" "$pkgdir/usr/lib/systemd/system/mautrix-whatsapp.service"
  install -dm750 "$pkgdir/etc/${pkgname/-bin}"
  install -Dm644 "$srcdir/whatsapp-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/${pkgname/-bin}/LICENSE"
  
  echo "Generating config"
  chmod +x "$srcdir/$pkgname-$CARCH-$pkgver"
  "$srcdir/$pkgname-$CARCH-$pkgver" -e -c "${pkgdir}/etc/${pkgname/-bin}/${pkgname/-bin}.yaml"
  chmod 644 "${pkgdir}/etc/${pkgname/-bin}/${pkgname/-bin}.yaml"
}
