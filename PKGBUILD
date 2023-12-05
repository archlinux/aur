# Maintainer: Zoddo <archlinux+aur@zoddo.fr>
# Contributor: Thaodan <AUR+me@thaodan.de>
# Contributor: huyizheng
# Contributor: johnnyapol <arch@johnnyapol.me>
# Based off the discord community repo PKGBUILD by Filipe Laíns (FFY00) <lains@archlinux.org>
_pkgname=discord
_electron=electron24
pkgname=${_pkgname}_arch_electron
pkgver=0.0.37
pkgrel=1
pkgdesc="Discord (popular voice + video app) using the system provided electron for increased security and performance"
arch=('any')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
url='https://discord.com'
license=('custom')
options=(!strip)
depends=("${_electron}" 'libxss')
makedepends=('asar')
optdepends=('libpulse: Pulseaudio support'
            'xdg-utils: Open files')
source=("https://dl.discordapp.net/apps/linux/$pkgver/$_pkgname-$pkgver.tar.gz"
        'discord-launcher.sh'
        'LICENSE.html::https://discord.com/terms'
        'OSS-LICENSES.html::https://discord.com/licenses')
sha512sums=('495969155a99364a22fef5d830adec5c03c25ac118d560b1e346fa9190866f9a038c07664124f8f835b77ba4e4d2a268a8eab86dea54274de4904ec374a2c005'
            'd398351b209cd89432d8e9cebe9122f152484236d8ca4dd91e5679d3853fe2f082625d35a9ac3f450f1f08250736bf3a23db9926311e8271730d884b57d12dbc'
            SKIP
            SKIP)

prepare() {
  sed -i "s|@PKGNAME@|${_pkgname}|;s|@ELECTRON@|${_electron}|" discord-launcher.sh
  sed -i "s|Exec=.*|Exec=/usr/bin/$_pkgname|" Discord/discord.desktop

  # HACKS FOR SYSTEM ELECTRON
  asar e Discord/resources/app.asar Discord/resources/app
  rm Discord/resources/app.asar
  sed -i "s|process.resourcesPath|'/usr/share/${_pkgname}/resources'|" Discord/resources/app/app_bootstrap/buildInfo.js
  sed -i "s|exeDir,|'/usr/share/pixmaps',|" Discord/resources/app/app_bootstrap/autoStart/linux.js
  asar p Discord/resources/app Discord/resources/app.asar
  rm -rf Discord/resources/app
}

package() {
  # Install the app
  install -d "${pkgdir}/usr/share/${_pkgname}/resources"

  # Copy Relevanat data
  cp -r Discord/resources/*  "${pkgdir}/usr/share/${_pkgname}/resources/"

  install -Dm 755 "${srcdir}/discord-launcher.sh" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm 644 Discord/discord.png "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
  install -Dm 644 Discord/discord.desktop "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  # Licenses
  install -Dm 644 LICENSE.html "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.html
  install -Dm 644 OSS-LICENSES.html "$pkgdir"/usr/share/licenses/$pkgname/OSS-LICENSES.html
}
