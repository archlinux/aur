# Maintainer: SrKaysama <srkaysama@waifu.club>

pkgname=discord-always-canary
pkgver=99.0.0
pkgrel=24
pkgdesc="All-in-one voice and text chat for gamers that's free and secure."
arch=('x86_64')
url='https://discordapp.com/'
provides=('discord')
conflicts=('discord-canary')
license=('custom')
depends=('gtk2' 'gconf' 'libnotify' 'libxss' 'glibc' 'alsa-lib' 'nspr' 'nss' 'libc++')
optdepends=(
  'libpulse: For pulseaudio support'
  'noto-fonts-emoji: Google font for emoji support.'
  'ttf-symbola: Font for emoji support.'
)

install="DiscordCanary.install"
_latest="https://discordapp.com/api/download/canary?platform=linux&format=tar.gz"
_version="$(curl -sI $_latest | grep location | sed 's/^.*linux\///' | sed 's/.discord.*//')"
source=(DiscordCanary.desktop LICENSE)
source_x86_64=("https://dl-canary.discordapp.net/apps/linux/${_version}/discord-canary-${_version}.tar.gz")
md5sums=('SKIP' 'SKIP')
md5sums_x86_64=('SKIP')

#This is always latest build

pkgver() {
  echo "${_version}.$(date +%Y%m%d)"
}

package() {
  # Install the main files.
  install -d "${pkgdir}/opt/${conflicts}"
  cp -a "${srcdir}/DiscordCanary/." "${pkgdir}/opt/${conflicts}"

  # Exec bit
  chmod 755 "${pkgdir}/opt/${conflicts}/DiscordCanary"

  # Desktop Entry
  install -d "${pkgdir}/usr/share/applications"
  install "${srcdir}/DiscordCanary.desktop" "${pkgdir}/usr/share/applications"

  # Main binary
  install -d "${pkgdir}/usr/bin"
  #install "${srcdir}/Discord.sh" "${pkgdir}/usr/bin/discord"
  ln -s "/opt/${conflicts}/DiscordCanary" "${pkgdir}/usr/bin/${conflicts}"

  # Create symbolic link to the icon
  install -d "${pkgdir}/usr/share/pixmaps"
  ln -s "/opt/${conflicts}/discord.png" "${pkgdir}/usr/share/pixmaps/${conflicts}.png"

  # License
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${conflicts}/LICENSE"
}
