# Maintainer: Mark Collins <tera_1225 hat hotmail.com>
# based on PKGBUILD of mautrix-whatsapp by: Lorenz Steinert <lorenz@steinerts.de> and  Matthew Murray <matt@compti.me>
pkgname=mautrix-whatsapp-bin
provides=('mautrix-whatsapp')
conflicts=('mautrix-whatsapp')
pkgver=0.10.9
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
sha256sums=('6a70e0e921d5f22a02552f49765ba7db05db00cf16a9a72e79462627c9327e83'
            '409e8fb3e35de1bd1ceebefa0ac275ad62ec66680117648058bcc177ddd2f9a1'
            '1d7d01d5a09256382a3f8c246048078d7d4934c3f8ac418fcf2d94648e162ab6'
            'f096badf6846f2ea46a4754917f4afb268b1129aaf897ae6f2dd59ed20fa680a'
            '6313f15046bc58887532c0cc019a912582b87501a188fefd80b82023e67754f3')
sha256sums_x86_64=('d63e377092763d463e9f716fc1c4edb23136dc9aa0b8861628b46d786ba852f1')
sha256sums_armv7h=('597f9de165ceb2a37c07202fcfaa2c1e93c99e356afaff507dc0d278792898d1')
sha256sums_aarch64=('28120fce38b76617772a249194b3dd020fd5773c7dfebc5e0c443cacf8161d4c')
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
  install -dm750 "$pkgdir/etc/${pkgname/-bin}"
  install -Dm644 "$srcdir/whatsapp-$pkgver/example-config.yaml" "$pkgdir/etc/${pkgname/-bin}/mautrix-whatsapp.yaml"
  install -Dm644 "$srcdir/whatsapp-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/${pkgname/-bin}/LICENSE"
}
