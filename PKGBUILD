# Maintainer: Mark Collins <tera_1225 hat hotmail.com>
# based on PKGBUILD of mautrix-whatsapp by: Lorenz Steinert <lorenz@steinerts.de> and  Matthew Murray <matt@compti.me>
pkgname=mautrix-discord-bin
provides=('mautrix-discord')
pkgver=0.6.3
pkgrel=1
pkgdesc="A Matrix-Discord puppeting bridge"
arch=('x86_64' 'armv7h' 'aarch64')
license=('AGPL')
depends=('libolm')
optdepends=('ffmpeg: If you want to send gifs from Matrix')
url="https://github.com/mautrix/discord"
source_x86_64=("$pkgname-x86_64-$pkgver"::"${url}/releases/download/v${pkgver}/mautrix-discord-amd64")
source_armv7h=("$pkgname-armv7h-$pkgver"::"${url}/releases/download/v${pkgver}/mautrix-discord-arm")
source_aarch64=("$pkgname-aarch64-$pkgver"::"${url}/releases/download/v${pkgver}/mautrix-discord-arm64")
source=(
	"${pkgname/-bin}-${pkgver}"::"${url}/archive/refs/tags/v${pkgver}.zip" 
        sysusers-mautrix-discord.conf
        mautrix-discord.tmpfiles
        mautrix-discord.service
        log-path.diff)
backup=("etc/${pkgname/-bin}/mautrix-discord.yaml")
sha256sums=('9ef86539713d1d22f22295ffd0e6f7348767c4bd825ec115af70b7bd22c3a335'
            '2a5adadfd712976bf42ca0f3a0695ae946d6f3d563e01d6c76f67f6bd169b961'
            '8735c5d4e8453b6b1bb741cb32bb962eee11f5d85f1332413ac15580fae0de90'
            '6961b6dd27fe246a1dddca95b90d038a26becc471c905658c2195070958cb1c3'
            '56e221937d57e932a3ae7c540aa3090c34437d8d47d93f364737289b0706030b')
sha256sums_x86_64=('6853a8c138a4843ef9c13a73f9ecdcd4a03d689a44c6c41f38d05fcba0e937a5')
sha256sums_armv7h=('c0b8bc5449903947ec1a5e92ee11320f51bf5d163f1907408a8cacde730c4ce1')
sha256sums_aarch64=('3fadc8e31086b266f647294077b0109c44079cc596a618e79abf9d5b48a62e98')

prepare() {
  cd "$srcdir/discord-$pkgver"
  patch -Np1 < "$srcdir/log-path.diff"
}

package() {
  install -Dm755 "$srcdir/${pkgname}-$CARCH-${pkgver}" "$pkgdir/usr/bin/${pkgname/-bin}"

  install -Dm644 "$srcdir/sysusers-mautrix-discord.conf" "$pkgdir/usr/lib/sysusers.d/mautrix-discord.conf"
  install -Dm644 "$srcdir/mautrix-discord.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/mautrix-discord.conf"
  install -Dm644 "$srcdir/mautrix-discord.service" "$pkgdir/usr/lib/systemd/system/mautrix-discord.service"

  install -Dm640 "$srcdir/discord-$pkgver/example-config.yaml" "$pkgdir/etc/${pkgname/-bin}/mautrix-discord.yaml"
  install -Dm644 "$srcdir/discord-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/${pkgname/-bin}/LICENSE"
}


