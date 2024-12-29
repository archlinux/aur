# Maintainer: Kimiblock Moe
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Morgan <morganamilo@archlinux.org>
# Contributor: T.J. Townsend <blakkheim@archlinux.org>
# Contributor: Robin Candau <antiz@archlinux.org>

pkgname=discord-bwrap
_pkgname=Discord
pkgver=0.0.78
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
sha512sums=('a0f1ad6f8e28e6ef014f7e5659fd20fe11eece13f2d7e453baa8ae0d65c8b2758e26510964108fe28e23ccd8b3e6dc64b97d2fa7394637d0463d7d529fbe944e'
            '2c5ebdb9d505a2fec83a9b59e464dd829f288b12bf36e30b91ba1f24c57d75eb572d35b5ebd9b6aec4b13eb48a806f9b6b461acd11a0415813becc24d97100d5'
            '84d23a89b9a46fe75da786cff6ac6096267f93e5c40d5f07cbc018e96424fb22fe0a833ac052fbdc6f85ddfd2165cebd1efdc9e371be5616ba375e9ee52c56b2'
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
