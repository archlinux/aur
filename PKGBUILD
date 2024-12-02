# Maintainer: Kimiblock Moe
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Morgan <morganamilo@archlinux.org>
# Contributor: T.J. Townsend <blakkheim@archlinux.org>
# Contributor: Robin Candau <antiz@archlinux.org>

pkgname=discord-bwrap
_pkgname=Discord
pkgver=0.0.76
pkgrel=1
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
        "discord.sh")
sha512sums=('3a5bdd4ce366f142c40e6acc4ab9faf1f61480c8aaa984abb3c37755e586ee2143c083af561595ff18f6587d3bceffe9d27c9b1069134abd612f63e7db636ee6'
            'c55944e128d7ab8e34f82751f1e1748d5bdb104498e51a2566d3ca7ee2ed8464fae71c4b5868a70036f54ff3139f5bd59bd8f1faef35e9153ba6b084db02dc11'
            'd72229a40ed4481e72581232946dc8c5012bd19cf690452f7601f29856f700904fdf0de0ee37698fb28ee3e04ebef22778c9b56fd4d8df022faf83245b44796a'
            '85671e0fb0ad830046591560fd6d3f2df0f6218a0d3e60e957aca10082c648fd872ebcac18bcb14ff796f666bcc01c38fb3ef82e9a8f48d1ccaeb54d4333cac6'
            '9e6859f8847e7079d49bc94e47d32f1b4ffc9f93d82694abc1f0b4049f14c758c50474a647218fc1bf2a8233e6e65e6f5a64a4374140966ac8ed2332bcd0083e')

prepare() {
  cd $_pkgname
  sed -i "s|Exec=.*|Exec=/usr/bin/discord|" discord.desktop
}

package() {
  depends=('libnotify' 'libxss' 'nspr' 'nss' 'gtk3' "portable")
  install -d "$pkgdir"/opt/discord
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
