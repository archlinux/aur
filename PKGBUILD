# Maintainer: Mark Collins <tera_1225 hat hotmail.com>
# based on PKGBUILD of mautrix-whatsapp by: Lorenz Steinert <lorenz@steinerts.de> and  Matthew Murray <matt@compti.me>
pkgname=mautrix-discord-bin
provides=('mautrix-discord')
pkgver=0.7.2
pkgrel=1
pkgdesc="A Matrix-Discord puppeting bridge"
arch=('x86_64' 'armv7h' 'aarch64')
license=('AGPL-3.0-or-later')
depends=('libolm')
optdepends=('ffmpeg: If you want to send gifs from Matrix')
url="https://github.com/mautrix/discord"
source_x86_64=("$pkgname-x86_64-$pkgver"::"${url}/releases/download/v${pkgver}/${pkgname/-bin}-amd64")
source_armv7h=("$pkgname-armv7h-$pkgver"::"${url}/releases/download/v${pkgver}/${pkgname/-bin}-arm")
source_aarch64=("$pkgname-aarch64-$pkgver"::"${url}/releases/download/v${pkgver}/${pkgname/-bin}-arm64")
source=("${pkgname/-bin}-${pkgver}.zip"::"${url}/archive/refs/tags/v${pkgver}.zip"
        sysusers-mautrix-discord.conf
        "${pkgname/-bin}.tmpfiles"
        "${pkgname/-bin}.service"
        log-path.diff)
backup=("etc/${pkgname/-bin}/${pkgname/-bin}.yaml")
sha256sums=('e67b4c0ce6ebcd90c41bba422fe3c68386f76dfcc59af20c0f35012b085685fa'
            '2a5adadfd712976bf42ca0f3a0695ae946d6f3d563e01d6c76f67f6bd169b961'
            '8735c5d4e8453b6b1bb741cb32bb962eee11f5d85f1332413ac15580fae0de90'
            '6961b6dd27fe246a1dddca95b90d038a26becc471c905658c2195070958cb1c3'
            '09c48177ac25d55a5651fe1c5a517b60c8bf42194a33e254d74c79adb2c831be')
sha256sums_x86_64=('f57fa8a5c4e3d059fbb699e9d1a6e39e136bbf90564232f80caba141b26ed846')
sha256sums_armv7h=('63a208650eee02f6c0e7c2cfaed11089f094d778bbe5356d150dd97557ab9afa')
sha256sums_aarch64=('2e5bf8cf7b592fd72cb589bc8b46c2ca95987a25afd422bfad7493026404c4fc')

prepare() {
  cd "$srcdir/discord-$pkgver"
  patch -Np1 < "$srcdir/log-path.diff"
}

package() {
  install -Dm755 "$srcdir/${pkgname}-$CARCH-${pkgver}" "$pkgdir/usr/bin/${pkgname/-bin}"

  install -Dm644 "$srcdir/sysusers-${pkgname/-bin}.conf" "$pkgdir/usr/lib/sysusers.d/${pkgname/-bin}.conf"
  install -Dm644 "$srcdir/${pkgname/-bin}.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/${pkgname/-bin}.conf"
  install -Dm644 "$srcdir/${pkgname/-bin}.service" "$pkgdir/usr/lib/systemd/system/${pkgname/-bin}.service"

  install -Dm640 "$srcdir/discord-$pkgver/example-config.yaml" "$pkgdir/etc/${pkgname/-bin}/${pkgname/-bin}.yaml"
  install -Dm644 "$srcdir/discord-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/${pkgname/-bin}/LICENSE"
}


