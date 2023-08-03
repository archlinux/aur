# Maintainer: Mark Collins <tera_1225 hat hotmail.com>
# based on PKGBUILD of mautrix-whatsapp by: Lorenz Steinert <lorenz@steinerts.de> and  Matthew Murray <matt@compti.me>
pkgname=mautrix-discord-bin
provides=('mautrix-discord')
pkgver=0.6.0
pkgrel=2
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
sha256sums=('e023c8417c0cd28c9c4ae8666d4c55c8176c49bceffd92887defb61ea80d14d4'
            '2a5adadfd712976bf42ca0f3a0695ae946d6f3d563e01d6c76f67f6bd169b961'
            '8735c5d4e8453b6b1bb741cb32bb962eee11f5d85f1332413ac15580fae0de90'
            '6961b6dd27fe246a1dddca95b90d038a26becc471c905658c2195070958cb1c3'
            '56e221937d57e932a3ae7c540aa3090c34437d8d47d93f364737289b0706030b')
sha256sums_x86_64=('c1124a77229e1e39dd0b0aab7a9f1df357929484a119b92f8eece058611a7c2e')
sha256sums_armv7h=('b6a08371d8c7896a9bf72eeb77c9d81255c75fb13a09200b328822f131bf9284')
sha256sums_aarch64=('8b3d244f58b5a5bd6ba62aa23bfb2b04c340db8b4fb24e16ca25d6c52db5c22a')

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


