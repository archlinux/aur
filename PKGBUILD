# Maintainer: Mark Collins <tera_1225 hat hotmail.com>
# based on PKGBUILD of mautrix-whatsapp by: Lorenz Steinert <lorenz@steinerts.de> and  Matthew Murray <matt@compti.me>
pkgname=mautrix-discord-bin
provides=('mautrix-discord')
pkgver=0.4.0
pkgrel=4
pkgdesc="A Matrix-Discord puppeting bridge"
arch=('x86_64' 'armv7h' 'aarch64')
license=('AGPL')
makedepends=(go libolm)
depends=('libolm')
optdepends=('ffmpeg: If you want to send gifs from Matrix')
url="https://github.com/mautrix/discord"
source_x86_64=("${url}/releases/download/v${pkgver}/mautrix-discord-amd64")
source_armv7h=("${url}/releases/download/v${pkgver}/mautrix-discord-arm")
source_aarch64=("${url}/releases/download/v${pkgver}/mautrix-discord-arm64")
source=(
	"${url}/archive/refs/tags/v${pkgver}.zip" 
        sysusers-mautrix-discord.conf
        mautrix-discord.tmpfiles
        mautrix-discord.service
        log-path.diff)
backup=("etc/${pkgname/-bin}/mautrix-discord.yaml")
sha256sums=('0b2b93461b2da597c2e425dd9a6b4350f902a203202d035c3e05d82803daa6af'
            '2a5adadfd712976bf42ca0f3a0695ae946d6f3d563e01d6c76f67f6bd169b961'
            '8735c5d4e8453b6b1bb741cb32bb962eee11f5d85f1332413ac15580fae0de90'
            '6961b6dd27fe246a1dddca95b90d038a26becc471c905658c2195070958cb1c3'
            '56e221937d57e932a3ae7c540aa3090c34437d8d47d93f364737289b0706030b')
sha256sums_x86_64=('1734f2efe9c4c0f40f3a0d39d59895db316cff71d8b55ab2fbb4e71218e3caff')
sha256sums_armv7h=('6f9e42bb6212dbb2d0cebc129ce5c3a5621502c3071cbb5633b15bd1df9727ee')
sha256sums_aarch64=('25dc5ffd718b957a774d7a8ef8f0dbadb03cc9d1b449850af59210c3610335fe')

prepare() {
  cd "$srcdir/discord-$pkgver"
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
  install -Dm755 "$srcdir/${pkgname/-bin}-${_architecture}" "$pkgdir/usr/bin/${pkgname/-bin}"

  install -Dm644 "$srcdir/sysusers-mautrix-discord.conf" "$pkgdir/usr/lib/sysusers.d/mautrix-discord.conf"
  install -Dm644 "$srcdir/mautrix-discord.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/mautrix-discord.conf"
  install -Dm644 "$srcdir/mautrix-discord.service" "$pkgdir/usr/lib/systemd/system/mautrix-discord.service"

  install -Dm640 "$srcdir/discord-$pkgver/example-config.yaml" "$pkgdir/etc/${pkgname/-bin}/mautrix-discord.yaml"
  install -Dm644 "$srcdir/discord-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/${pkgname/-bin}/LICENSE"
}


