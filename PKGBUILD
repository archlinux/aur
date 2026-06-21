# Maintainer: Zoddo <archlinux+aur@zoddo.fr>
# Contributor: Thaodan <AUR+me@thaodan.de>
# Contributor: Manuel Hüsers <aur@huesers.de>
# Contributor: huyizheng
# Contributor: johnnyapol <arch@johnnyapol.me>

# Based off the discord community repo PKGBUILD by Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=discord
_electron=electron
pkgname=${_pkgname}_arch_electron
pkgver=1.0.143
pkgrel=1
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
makedepends=('asar')
optdepends=('libpulse: Pulseaudio support'
            'xdg-utils: Open files'
            'python-pyelftools: Required for Krisp patcher'
            'python-capstone: Required for Krisp patcher')
source=("https://dl.discordapp.net/apps/linux/${pkgver}/${_pkgname}-${pkgver}.tar.gz"
        'LICENSE.html::https://discord.com/terms'
        'OSS-LICENSES.html::https://discord.com/licenses'
        'discord-launcher.sh'
        'krisp-patcher.py') # original: https://github.com/sersorrel/sys/blob/main/hm/discord/krisp-patcher.py
sha512sums=('9fca5b47061e9b79d991ad27f181f7472efadc5b8c168932dad8e8bf7f389902ea3d3ded676ec0b17bf97a17db0f5e27d4be6a6a630b580d8ce96513034df0e2'
            '71db6a67ef3d42cd6a6b2e908e857b1eb38118a2aaeb3adfe44e5faba8796d0df134638ec1cc302a88256ab8e8185fd6371714ca2d95a667606d66b94ddff123'
            'cc6577b22cdc448e021c14a29ef01dc1f6470bb46770644d9017a9299f20d3ae5befe29290adec240ce2a4f65eede6cf10bd098aa67cd991063d2ee0e08e8928'
            '5e2b4bc955606c23d3f788d73e81fbd6e6278b618ad85c5a3edc722428bbb6460c5dc874ad9b6ab893f658e669e1a0aa1a0d0830ddbfc019d01596425903dd57'
            '42cef68c1f7d574b4fbe859a4dc616e8994c7d16f62bcae3ff1f88e1edc58ac37b39c238d7defa9c97ceda417fcd6224cf0a0fd2608b8d18d0877e3c1befa59c')

# Skip "LICENSE.html" and "OSS-LICENSES.html" files hashes as they are unstable
# Since "updpkgsums"/"pkgctl version upgrade" overwrite the checksum array with
# literal hashes, set them to SKIP with indexed assignments (pacman-contrib#119)
# https://gitlab.archlinux.org/pacman/pacman-contrib/-/issues/119
sha512sums[1]='SKIP'
sha512sums[2]='SKIP'

prepare() {
  # prepare launcher script
  sed -i -e "s|@PKGNAME@|${_pkgname}|" \
    -e "s|@PKGVER@|${pkgver}|" \
    -e "s|@ELECTRON@|${_electron}|" \
    discord-launcher.sh

  # fix the .desktop file
  sed -i -e "s|Exec=.*|Exec=/usr/bin/${_pkgname}|" ${_pkgname^}/$_pkgname.desktop
}

build() {
  cd "${srcdir}/${_pkgname^}"

  # use system electron
  asar e resources/app.asar resources/app
  rm resources/app.asar
  sed -i -e "s|resourcesPath = path.*;|resourcesPath = '/usr/share/${_pkgname}/resources';|" resources/app/common/paths.js
  sed -i -e "s|process.resourcesPath|'/usr/share/${_pkgname}/resources'|" resources/app/app_bootstrap/buildInfo.js
  sed -i -e "/^const appName/d" -e "/^const exePath/d" -e "/^const exeDir/d" -e "/^const iconPath/d" \
    -e "s|^Exec=\${exePath}$|Exec=/usr/bin/${_pkgname}|" \
    -e "s|^Name=\${appName}$|Name=${_pkgname^}|" \
    -e "s|^Icon=\${iconPath}$|Icon=${_pkgname}|" \
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
  install -Dm 644 ${_pkgname^}/$_pkgname.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png"
  install -Dm 644 ${_pkgname^}/$_pkgname.desktop "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  # install the launch script
  install -Dm 755 discord-launcher.sh "${pkgdir}/usr/bin/${_pkgname}"

  # install krisp patcher
  install -Dm 644 krisp-patcher.py "${pkgdir}/usr/share/${_pkgname}/"

  # install licenses
  install -Dm 644 LICENSE.html "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.html"
  install -Dm 644 OSS-LICENSES.html "${pkgdir}/usr/share/licenses/${pkgname}/OSS-LICENSES.html"
}
