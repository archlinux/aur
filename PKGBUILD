# Maintainer: Kimiblock Moe
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Morgan <morganamilo@archlinux.org>
# Contributor: T.J. Townsend <blakkheim@archlinux.org>
# Contributor: Robin Candau <antiz@archlinux.org>

pkgname=discord-bwrap
_pkgname=Discord
pkgver=0.0.80
pkgrel=2
pkgdesc="All-in-one voice and text chat for gamers. Sandboxed for privacy."
arch=('x86_64')
url='https://discord.com'
license=('custom')
conflicts=("discord")
options=(!debug !strip)
optdepends=('libpulse: PulseAudio support'
            'libappindicator-gtk3: Systray indicator support'
            'xdg-utils: Open files')
source=("https://dl.discordapp.net/apps/linux/$pkgver/discord-$pkgver.tar.gz"
        "LICENSE-$pkgver.html::https://discordapp.com/terms"
        "OSS-LICENSES-$pkgver.html::https://discordapp.com/licenses"
        "portable-config"
        "discord.sh"
        "discord.desktop")
sha512sums=('c23cc93c91986e619113a8e772b67904ad72240897527e538174353ede805abe4c3fd9a1376cd1cef192bb0c6c49e29f80f735a8590319412d3297e2a4d220a9'
            '8f60fb6a300033cbc83063059c8d4408ccd7ce1baa2aea26e397163b2ca3a2f0b9d9e453d1d33784920f782d1f7c6d1bcbd158ee208446816bcbe59c29c67ef6'
            '098d4aba3bf3093abd33cffe83c0b10b0f312e3e35b1782593acb9b044537d096b69adacdc5483cc8813e1bfd4c07a6f09f7e84af9c423674e8a14e6c4cbbd36'
            '00f900190275e40ecb53509b54068b6045ea1b186cd620abb8c1597bfb08930a4490d436f2060b14717e88a99c2ae05c4399dc3a1bc9efe2f9bc122d620ec3c9'
            '1d4b34acdb0b4a7ffc4149fcf99d69d321eac876c5b4ea673cfc1264f07363fec0e31815a821137859230ac053e97537d9a7c2a2b2d5b990bc131ff7859fc2e3'
            'b40d0998938f117bd60ff438a770ba39f7943eb06d399d1926e58d1f6aa07827e5ecd382393fae501b36d9e0d72082e9c3c1e5990b41caf537051995f78899c1')

prepare() {
  cd $_pkgname
  sed -i "s|Exec=.*|Exec=/usr/bin/discord|" discord.desktop
}

package() {
  depends=('libnotify' 'libxss' 'nspr' 'nss' 'gtk3' "portable")
  install -d "$pkgdir"/opt/discord
  install -Dm644 \
  	"discord.desktop" \
  	"${pkgdir}/usr/share/applications/discord.desktop"
  cp -a $_pkgname/. "$pkgdir"/opt/discord

  chmod 755 "$pkgdir"/opt/discord/$_pkgname

  rm "$pkgdir"/opt/discord/postinst.sh

  install -d "$pkgdir"/usr/bin
  #ln -s /opt/discord/$_pkgname "$pkgdir"/usr/bin/discord

  install -d "$pkgdir"/usr/share/applications
  ln -s /opt/discord/discord.desktop "$pkgdir"/usr/share/applications/discord.desktop

  install -d "$pkgdir"/usr/share/icons/hicolor/256x256/apps
  ln -s /opt/discord/discord.png "$pkgdir"/usr/share/icons/hicolor/256x256/apps/discord.png

  install -Dm644 LICENSE-$pkgver.html "$pkgdir"/usr/share/licenses/discord/LICENSE.html
  install -Dm644 OSS-LICENSES-$pkgver.html "$pkgdir"/usr/share/licenses/discord/OSS-LICENSES.html
  install -Dm644 portable-config "${pkgdir}/usr/lib/portable/info/com.discord.app/config"
  install -Dm755 discord.sh "${pkgdir}/usr/bin/discord"
}
