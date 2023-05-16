# Maintainer: Mark Collins <tera_1225 hat hotmail.com>
# based on PKGBUILD of mautrix-whatsapp by: Lorenz Steinert <lorenz@steinerts.de> and  Matthew Murray <matt@compti.me>
pkgname=mautrix-whatsapp-bin
provides=('mautrix-whatsapp')
conflicts=('mautrix-whatsapp')
pkgver=0.8.5
pkgrel=1
pkgdesc="A Matrix-Whatsapp puppeting bridge (binary release)"
arch=('x86_64' 'armv7h' 'aarch64')
license=('AGPL')
makedepends=()
depends=()
optdepends=('ffmpeg: If you want to send gifs from Matrix')
url="https://github.com/mautrix/whatsapp"
source_x86_64=("${url}/releases/download/v${pkgver}/mautrix-whatsapp-amd64")
source_armv7h=("${url}/releases/download/v${pkgver}/mautrix-whatsapp-arm")
source_aarch64=("${url}/releases/download/v${pkgver}/mautrix-whatsapp-arm64")
source=("${url}/archive/refs/tags/v${pkgver}.zip"
        sysusers-mautrix-whatsapp.conf
        mautrix-whatsapp.tmpfiles
        mautrix-whatsapp.service
        log-path.diff)
sha256sums=('276fa6b83cc687970ade0160d72a720bfbd6b5954cd123aed124822978a23eca'
            '409e8fb3e35de1bd1ceebefa0ac275ad62ec66680117648058bcc177ddd2f9a1'
            '1d7d01d5a09256382a3f8c246048078d7d4934c3f8ac418fcf2d94648e162ab6'
            '6e967838a00518c4ad2109ca395b2f14fc03ed6474af977445979ce7a53872b8'
            'dbee2761eda8bdea97e980e8e2ba92130cc80c17f29f7da8566a18182a6a3334')
sha256sums_x86_64=('2989419b6c8ce870189359a44a1642a22e6cc87d6344123622fa2d59d073a339')
sha256sums_armv7h=('6f664454fccabe023c6d7eb8ad85ed80ba7c5691605e16977cfc67ffed1a252a')
sha256sums_aarch64=('e9c34620f5748bac34f4d15d9e9088ecf8676288edc9460bf6245688eafd6367')
backup=("etc/${pkgname/-bin}/mautrix-whatsapp.yaml")

prepare() {
  cd "$srcdir/whatsapp-$pkgver"
  patch -Np1 < "$srcdir/log-path.diff"
}

package() {
  if [[ "$CARCH" == "x86_64" ]]; then
    _architecture="amd64"
  elif [[ "$CARCH" == "armv7h" ]]; then
    _architecture="arm"
  else 
    _architecture="arm64"
  fi
  install -Dm755 "$srcdir/${pkgname/-bin}-$_architecture" "$pkgdir/usr/bin/${pkgname/-bin}"

  install -Dm644 "$srcdir/sysusers-mautrix-whatsapp.conf" "$pkgdir/usr/lib/sysusers.d/mautrix-whatsapp.conf"
  install -Dm644 "$srcdir/mautrix-whatsapp.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/mautrix-whatsapp.conf"
  install -Dm644 "$srcdir/mautrix-whatsapp.service" "$pkgdir/usr/lib/systemd/system/mautrix-whatsapp.service"

  install -Dm640 "$srcdir/whatsapp-$pkgver/example-config.yaml" "$pkgdir/etc/${pkgname/-bin}/mautrix-whatsapp.yaml"
  install -Dm644 "$srcdir/whatsapp-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/${pkgname/-bin}/LICENSE"
}
