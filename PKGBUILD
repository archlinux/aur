# Maintainer: Kimiblock Moe
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Morgan <morganamilo@archlinux.org>
# Contributor: T.J. Townsend <blakkheim@archlinux.org>
# Contributor: Robin Candau <antiz@archlinux.org>

pkgname=discord-bwrap
_pkgname=Discord
pkgver=0.0.100
pkgrel=1
epoch=1
pkgdesc="All-in-one voice and text chat for gamers. Sandboxed for privacy."
arch=('x86_64')
url='https://discord.com'
license=('custom')
conflicts=("discord")
provides+=("discord" "discord-sandbox" "discord-portable")
options=(!debug !strip)
optdepends=('libpulse: PulseAudio support'
            'libappindicator-gtk3: Systray indicator support'
            'xdg-utils: Open files')
source=("https://dl.discordapp.net/apps/linux/$pkgver/discord-$pkgver.tar.gz"
        "portable-config"
        "discord.sh"
        "discord.desktop")
sha512sums=('1e7840dcc132b21f2f6acd8e6715b81883d9c1093e719c7768bdd74526e9e5dd3e0125dce4efcbd53a95bd71b06723b91cbc2c58682ee1973759102e03b0621e'
            '8a94548591a27f3d710b3f74c34a641131dc439f981f0f1e9dbd7a8fc8dfe3e29204ff0d6b87cd565bfebbbdb7190b631b1177df34958047acbafe5b483ef9e9'
            'a881db4d5f76c8f2f869b0565e6e757b0c462341d2911b24aa8da67e21dbe739fc38ede18486d42a179644a8389355654408d7947ffd6ef0052a4360fb15d91f'
            '2bbac6cd293e231ae93b0f58eecd6a6217b8299d2dbbe2d06a329297fa353506f6e90070aef363445ebd863c0d302bebb7d4af48a4858c25c1ef9b3924feb53b')

function prepare() {
	echo '''{
  "SKIP_HOST_UPDATE": true
}''' >"${srcdir}/skip-update.json"
}

package() {
  depends=('libnotify' 'libxss' 'nspr' 'nss' 'gtk3' "portable")
  install -d "$pkgdir"/opt/discord
  install -Dm644 \
  	"discord.desktop" \
  	"${pkgdir}/usr/share/applications/com.discordapp.Discord.desktop"
  cp -a $_pkgname/. "$pkgdir"/opt/discord

  chmod 755 "$pkgdir"/opt/discord/$_pkgname

  rm "$pkgdir"/opt/discord/postinst.sh

  install -d "$pkgdir"/usr/bin

  install -d "$pkgdir"/usr/share/applications

  install -d "$pkgdir"/usr/share/icons/hicolor/256x256/apps
  ln -s /opt/discord/discord.png "$pkgdir"/usr/share/icons/hicolor/256x256/apps/discord.png

  install -Dm644 portable-config "${pkgdir}/usr/lib/portable/info/com.discord.app/config"
  install -Dm755 discord.sh "${pkgdir}/usr/bin/Discord"
  install -Dm644 "${srcdir}/skip-update.json" "${pkgdir}/usr/share/discord-bwrap/settings.json"
}
