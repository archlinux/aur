# Maintainer: Kimiblock Moe
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Morgan <morganamilo@archlinux.org>
# Contributor: T.J. Townsend <blakkheim@archlinux.org>
# Contributor: Robin Candau <antiz@archlinux.org>

pkgname=discord-bwrap
_pkgname=Discord
pkgver=0.0.80
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
sha512sums=('c23cc93c91986e619113a8e772b67904ad72240897527e538174353ede805abe4c3fd9a1376cd1cef192bb0c6c49e29f80f735a8590319412d3297e2a4d220a9'
            'a467013a38f9d73707321976c72be1d528d2c0b238337f2d106d43e00c8f7a1579277cfd91874d85c2cbe86e80d2fdcfdfbbbeb27fbea013d2a9cedad5abe5a6'
            '8f3cfbf1c4cb3ee93c4675cef690c7834f5cf6e021ab935fbe2292ab52dee014a476095129e5bd2734c9c73e29db0b399f792cba6e612023e1db7dfd210dc769'
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
