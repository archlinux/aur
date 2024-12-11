# Maintainer: Kimiblock Moe
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Morgan <morganamilo@archlinux.org>
# Contributor: T.J. Townsend <blakkheim@archlinux.org>
# Contributor: Robin Candau <antiz@archlinux.org>

pkgname=discord-bwrap
_pkgname=Discord
pkgver=0.0.77
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
sha512sums=('c7f5a2ffa5e748911ae672e5eb0cc8d805547e9da5474826838f4bb45328937b7d7fa56ba036598fea88bb2b60a1133c591eff731573ded2f574e2664bc69817'
            '44372fd6e999120929fe8be46fe69e15c77d3a0495b3f809b70df309606d033c49e3461b8986ba34852bc61d3a662e34e9e554110082442a5bbd0755242d7248'
            'f367ec4cdddb0b52ab81b19eac85cc896d9eef5c167bf239891fe4e8453d46045942dea1547341a0ae1d65bb43a8ecc1b5dd43636ba5699b9ebab9bed71c5141'
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
