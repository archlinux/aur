# Maintainer: Mark Collins <tera_1225 hat hotmail.com>
# based on PKGBUILD of mautrix-whatsapp by: Lorenz Steinert <lorenz@steinerts.de> and  Matthew Murray <matt@compti.me>
pkgname=mautrix-whatsapp-bin
provides=('mautrix-whatsapp')
conflicts=('mautrix-whatsapp')
pkgver=0.10.3
pkgrel=2
pkgdesc="A Matrix-Whatsapp puppeting bridge (binary release)"
arch=('x86_64' 'armv7h' 'aarch64')
license=('AGPL')
makedepends=()
depends=()
optdepends=('ffmpeg: If you want to send gifs from Matrix')
url="https://github.com/mautrix/whatsapp"
source_x86_64=("$pkgname-x86_64-$pkgver::${url}/releases/download/v${pkgver}/mautrix-whatsapp-amd64")
source_armv7h=("$pkgname-armv7h-$pkgver::${url}/releases/download/v${pkgver}/mautrix-whatsapp-arm")
source_aarch64=("$pkgname-aarch64-$pkgver::${url}/releases/download/v${pkgver}/mautrix-whatsapp-arm64")
source=("${url}/archive/refs/tags/v${pkgver}.zip"
        sysusers-mautrix-whatsapp.conf
        mautrix-whatsapp.tmpfiles
        mautrix-whatsapp.service
        log-path.diff)
sha256sums=('34bea1a3375727855ef2bf9f6bca4d37227e950076096c5f135900e377374b0e'
            '409e8fb3e35de1bd1ceebefa0ac275ad62ec66680117648058bcc177ddd2f9a1'
            '1d7d01d5a09256382a3f8c246048078d7d4934c3f8ac418fcf2d94648e162ab6'
            'f096badf6846f2ea46a4754917f4afb268b1129aaf897ae6f2dd59ed20fa680a'
            '6313f15046bc58887532c0cc019a912582b87501a188fefd80b82023e67754f3')
sha256sums_x86_64=('d5c78d9b75ef9846863cca3383dacb4efb76a5a58d8b6336cbb871e51a4d0073')
sha256sums_armv7h=('ed0eae8fbd6efb4bf013f1593b6d1fa0f762e88aa4d0f8db5382f29d091eb5d0')
sha256sums_aarch64=('20e5bef339b431341bc74cc57c7665b47e1e76cf8ff084742e9176dee4aa227a')
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

  install -Dm640 "$srcdir/whatsapp-$pkgver/example-config.yaml" "$pkgdir/etc/${pkgname/-bin}/mautrix-whatsapp.yaml"
  install -Dm644 "$srcdir/whatsapp-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/${pkgname/-bin}/LICENSE"
}
