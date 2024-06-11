# Maintainer: Zoddo <archlinux+aur@zoddo.fr>
# Contributor: Thaodan <AUR+me@thaodan.de>
# Contributor: Manuel Hüsers <aur@huesers.de>
# Contributor: huyizheng
# Contributor: johnnyapol <arch@johnnyapol.me>

# Based off the discord community repo PKGBUILD by Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=discord
_electron=electron29
pkgname=${_pkgname}_arch_electron
pkgver=0.0.56
pkgrel=1
pkgdesc="Discord using system provided ${_electron} for increased security and performance"
arch=('any')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
url='https://discord.com'
license=('custom')
options=('!strip')
install="$pkgname.install"
depends=("${_electron}" 'libxss')
makedepends=('asar' 'curl')
optdepends=('libpulse: Pulseaudio support'
            'libappindicator-gtk3: Systray indicator support'
            'xdg-utils: Open files'
            'python-pyelftools: Required for Krisp patcher'
            'python-capstone: Required for Krisp patcher')
source=("https://dl.discordapp.net/apps/linux/${pkgver}/${_pkgname}-${pkgver}.tar.gz"
        'discord-launcher.sh'
        'krisp-patcher.py') # original: https://github.com/sersorrel/sys/blob/main/hm/discord/krisp-patcher.py
sha512sums=('799d6cf5fcdeff83aaad20662668b17ff0cf88edab1bf404ad366340d0783269fef8800382a111f8505b353031c80cd17ab804a56f51f3c8bb2e2a2c5e6b86ec'
            'e11a60419c6ee5944aefc1ac16a5b496518fae626627d37a5bf636975bd21b1d9b6118ec3f44e7f4283befe5fa14737ad28dc38d975967789247ac0e66c352f3'
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
