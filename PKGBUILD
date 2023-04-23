# Maintainer: Mark Collins <tera_1225 hat hotmail.com>
# based on PKGBUILD of mautrix-whatsapp by: Lorenz Steinert <lorenz@steinerts.de> and  Matthew Murray <matt@compti.me>
pkgname=mautrix-discord-bin
provides=('mautrix-discord')
pkgver=0.3.0
pkgrel=1
pkgdesc="A Matrix-Discord puppeting bridge"
arch=('any')
license=('AGPL')
makedepends=(go libolm)
depends=('libolm')
optdepends=('ffmpeg: If you want to send gifs from Matrix')
url="https://github.com/mautrix/discord"
source=("${url}/releases/download/v${pkgver}/mautrix-discord-amd64"
	"${url}/archive/refs/tags/v${pkgver}.zip" 
        sysusers-mautrix-discord.conf
        mautrix-discord.tmpfiles
        mautrix-discord.service
        log-path.diff)
backup=("etc/${pkgname/-bin}/mautrix-discord.yaml")
sha256sums=('1bf142f609946270375cb7c7d04a3b493f2268f8a78d5c6a7e1b185fa76cda98'
            '20f3e6feee5137129b6b05b80584425cb58a8d1c6ac4cf5a65811a6a7dba280c'
            '2a5adadfd712976bf42ca0f3a0695ae946d6f3d563e01d6c76f67f6bd169b961'
            '0de5507fceb4cc2851fe781126ba71dab8136ad7bfd791e8266a28b27be6f949'
            '6961b6dd27fe246a1dddca95b90d038a26becc471c905658c2195070958cb1c3'
            '7f12da9b053ef227ee6b868d75a872ddc2af82287f8ca0ff9f3ed44b205f0d66')

prepare() {
  cd "$srcdir/discord-$pkgver"
  patch -Np1 < "$srcdir/log-path.diff"
}

package() {
  install -Dm755 "$srcdir/${pkgname/-bin}-amd64" "$pkgdir/usr/bin/${pkgname/-bin}"

  install -Dm644 "$srcdir/sysusers-mautrix-discord.conf" "$pkgdir/usr/lib/sysusers.d/mautrix-discord.conf"
  install -Dm644 "$srcdir/mautrix-discord.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/mautrix-discord.conf"
  install -Dm644 "$srcdir/mautrix-discord.service" "$pkgdir/usr/lib/systemd/system/mautrix-discord.service"

  install -Dm640 "$srcdir/discord-$pkgver/example-config.yaml" "$pkgdir/etc/${pkgname/-bin}/mautrix-discord.yaml"
  install -Dm644 "$srcdir/discord-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/${pkgname/-bin}/LICENSE"
}
