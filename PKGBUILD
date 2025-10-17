# Maintainer: Zoddo <archlinux+aur@zoddo.fr>
# Contributor: Thaodan <AUR+me@thaodan.de>
# Contributor: Manuel Hüsers <aur@huesers.de>
# Contributor: huyizheng
# Contributor: johnnyapol <arch@johnnyapol.me>

# Based off the discord community repo PKGBUILD by Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=discord
_electron=electron
pkgname=${_pkgname}_arch_electron
pkgver=0.0.112
pkgrel=4
epoch=1
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
            'xdg-utils: Open files'
            'python-pyelftools: Required for Krisp patcher'
            'python-capstone: Required for Krisp patcher')
source=("https://dl.discordapp.net/apps/linux/${pkgver}/${_pkgname}-${pkgver}.tar.gz"
        'discord-launcher.sh'
        'krisp-patcher.py') # original: https://github.com/sersorrel/sys/blob/main/hm/discord/krisp-patcher.py
sha512sums=('5b37b63c3fbc2ea55a1cfc9c4bfc26f73e896c1978f9dcecf0735d385e76f4ae7f7107947f8939efc0eaac7dca7a951eba13ad953329244a4935cd2b92b8065c'
            'e74f0c8285d628e5b272bad70c90be5d7f7f0c97057ef28b9caed5db25f09c4fe323876686d764ac7ea0375d7856ac3c99ec38de04f66951a1b185646fd6e138'
            '42cef68c1f7d574b4fbe859a4dc616e8994c7d16f62bcae3ff1f88e1edc58ac37b39c238d7defa9c97ceda417fcd6224cf0a0fd2608b8d18d0877e3c1befa59c')

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
