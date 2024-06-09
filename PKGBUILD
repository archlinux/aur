# Maintainer: Zoddo <archlinux+aur@zoddo.fr>
# Contributor: Thaodan <AUR+me@thaodan.de>
# Contributor: Manuel Hüsers <aur@huesers.de>
# Contributor: huyizheng
# Contributor: johnnyapol <arch@johnnyapol.me>

# Based off the discord community repo PKGBUILD by Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=discord
_electron=electron29
pkgname=${_pkgname}_arch_electron
pkgver=0.0.55
pkgrel=3
pkgdesc="Discord using system provided ${_electron} for increased security and performance"
arch=('any')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
url='https://discord.com'
license=('custom')
options=('!strip')
install="$pkgname.install"
depends=("${_electron}" 'libxss' 'python')
makedepends=('asar' 'curl')
optdepends=('libpulse: Pulseaudio support'
            'libappindicator-gtk3: Systray indicator support'
            'xdg-utils: Open files'
            'python-pyelftools: Required for Krisp patcher'
            'python-capstone: Required for Krisp patcher')
source=("https://dl.discordapp.net/apps/linux/${pkgver}/${_pkgname}-${pkgver}.tar.gz"
        'discord-launcher.sh'
        'krisp-patcher.py') # original: https://github.com/sersorrel/sys/blob/main/hm/discord/krisp-patcher.py
sha512sums=('c12365109cb4db94033fda101073d2a3d6af7bdc9728e025494ee8d44ebf5f27623861879ec38bb7dd88d40de7cddede268e0f5e44bfeb586fc12713a3758c5b'
            '6b7043d2e66b52a5f76b8d01813a7f4fd572b38bbd24087d618af7f2cc416c41074071fa738af5e6f31dacd0186d71eb841fa0c598bfa3ad444c5bbc911402af'
            '3c1021592fa856f3561072c76b5ee0b5a34a53bc230336e6d36827efb4866c9d801ef7abb24650d3a7210c61dd57f35e2812ae89226fc157cc8d9ffce032155f')

prepare() {
  # prepare launcher script
  sed -i -e "s|@PKGNAME@|${_pkgname}|" \
    -e "s|@PKGVER@|${pkgver}|" \
    -e "s|@ELECTRON@|${_electron}|" \
    discord-launcher.sh

  # fix the .desktop file
  sed -i -e "s|Exec=.*|Exec=/usr/bin/${_pkgname}|" ${_pkgname^}/$_pkgname.desktop

  # create the license files
  curl -o "${srcdir}/LICENSE.html" https://discord.com/terms
  curl -o "${srcdir}/OSS-LICENSES.html" https://discord.com/licenses
}

build() {
  cd "${srcdir}/${_pkgname^}"

  # use system electron
  asar e resources/app.asar resources/app
  rm resources/app.asar
  sed -i -e "s|resourcesPath = _path.*;|resourcesPath = '/usr/share/${_pkgname}/resources';|" resources/app/common/paths.js
  sed -i -e "s|process.resourcesPath|'/usr/share/${_pkgname}/resources'|" resources/app/app_bootstrap/buildInfo.js
  sed -i -e "/^const appName/d" -e "/^const exePath/d" -e "/^const exeDir/d" -e "/^const iconPath/d" \
    -e "s|^Exec=\${exePath}$|Exec=/usr/bin/${_pkgname}|" \
    -e "s|^Name=\${appName}$|Name=${_pkgname^}|" \
    -e "s|^Icon=\${iconPath}$|Icon=/usr/share/pixmaps/${_pkgname}.png|" \
    resources/app/app_bootstrap/autoStart/linux.js
  asar p resources/app resources/app.asar
  rm -rf resources/app
}

package() {
  # create necessary directories
  install -d "${pkgdir}/usr/share/${_pkgname}"

  # copy relevant data
  cp -r ${_pkgname^}/resources "${pkgdir}/usr/share/${_pkgname}/"

  # intall icon and desktop file
  install -Dm 644 ${_pkgname^}/$_pkgname.png "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
  install -Dm 644 ${_pkgname^}/$_pkgname.desktop "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  # install the launch script
  install -Dm 755 discord-launcher.sh "${pkgdir}/usr/bin/${_pkgname}"

  # install krisp patcher
  install -Dm 644 krisp-patcher.py "${pkgdir}/usr/share/${_pkgname}/"

  # install licenses
  install -Dm 644 LICENSE.html "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.html"
  install -Dm 644 OSS-LICENSES.html "${pkgdir}/usr/share/licenses/${pkgname}/OSS-LICENSES.html"
}
