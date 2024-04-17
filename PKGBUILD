# Maintainer: Mark Collins <tera_1225 hat hotmail.com>
# based on PKGBUILD of mautrix-whatsapp by: Lorenz Steinert <lorenz@steinerts.de> and  Matthew Murray <matt@compti.me>
pkgname=mautrix-whatsapp-bin
provides=('mautrix-whatsapp')
conflicts=('mautrix-whatsapp')
pkgver=0.10.7
pkgrel=1
pkgdesc="A Matrix-Whatsapp puppeting bridge (binary release)"
arch=('x86_64' 'armv7h' 'aarch64')
license=('AGPL-3.0-or-later')
optdepends=('ffmpeg: If you want to send gifs from Matrix')
url="https://github.com/mautrix/whatsapp"
source_x86_64=("$pkgname-x86_64-$pkgver::${url}/releases/download/v${pkgver}/mautrix-whatsapp-amd64")
source_armv7h=("$pkgname-armv7h-$pkgver::${url}/releases/download/v${pkgver}/mautrix-whatsapp-arm")
source_aarch64=("$pkgname-aarch64-$pkgver::${url}/releases/download/v${pkgver}/mautrix-whatsapp-arm64")
source=("${pkgname/-bin}-${pkgver}::${url}/archive/refs/tags/v${pkgver}.zip"
        sysusers-mautrix-whatsapp.conf
        mautrix-whatsapp.tmpfiles
        mautrix-whatsapp.service
        log-path.diff)
sha256sums=('90fa8d7ab3e638c874649e1ba2747565b3095154fdbea97d5233e8446df04a1b'
            '409e8fb3e35de1bd1ceebefa0ac275ad62ec66680117648058bcc177ddd2f9a1'
            '1d7d01d5a09256382a3f8c246048078d7d4934c3f8ac418fcf2d94648e162ab6'
            'f096badf6846f2ea46a4754917f4afb268b1129aaf897ae6f2dd59ed20fa680a'
            '6313f15046bc58887532c0cc019a912582b87501a188fefd80b82023e67754f3')
sha256sums_x86_64=('8a83cbe9be2528b22c0492a4c49f414f754e86ed76d5595b116d2ebd90eac718')
sha256sums_armv7h=('2df120dd9ec77e4c839e27904155acde5102daf1f27aaae0d8e36476ab1047eb')
sha256sums_aarch64=('f702360c5e5b10d4cde72e3b57d9ea921f003968a92f39d09881889c026b5ae8')
backup=("etc/${pkgname/-bin}/mautrix-whatsapp.yaml")

prepare() {
  cd "$srcdir/whatsapp-$pkgver"
  patch -Np1 < "$srcdir/log-path.diff"
}

package() {
  install -Dm755 "$srcdir/$pkgname-$CARCH-$pkgver" "$pkgdir/usr/bin/${pkgname/-bin}"
  install -Dm644 "$srcdir/sysusers-mautrix-whatsapp.conf" "$pkgdir/usr/lib/sysusers.d/mautrix-whatsapp.conf"
  install -Dm644 "$srcdir/mautrix-whatsapp.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/mautrix-whatsapp.conf"
  install -Dm644 "$srcdir/mautrix-whatsapp.service" "$pkgdir/usr/lib/systemd/system/mautrix-whatsapp.service"
  install -dm755 "$pkgdir/etc/${pkgname/-bin}"
  install -Dm644 "$srcdir/whatsapp-$pkgver/example-config.yaml" "$pkgdir/etc/${pkgname/-bin}/mautrix-whatsapp.yaml"
  install -Dm644 "$srcdir/whatsapp-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/${pkgname/-bin}/LICENSE"
}
