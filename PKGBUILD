# Maintainer: Omansh Krishn <omansh@duck.com>

pkgname=materialious-git
_pkgname=materialious
pkgver=1.6.17.r0.gf36e130
pkgrel=1
pkgdesc="Modern material design for Invidious"
arch=('x86_64')
url="https://github.com/Materialious/Materialious"
license=('AGPL3')
makedepends=( 'jq' 'moreutils' 'npm' )
depends=('at-spi2-core' 'gtk3' 'libnotify' 'libsecret' 'libxss' 'libxtst' 'nss' 'util-linux-libs' 'xdg-utils' )
optdepends=( 'libappindicator-gtk3' )
provides=( 'materialious' )
conflicts=( 'materialious-bin')
options=(!debug)

source=( "${_pkgname}::git+${url}.git"
         "${_pkgname}.desktop")

sha256sums=('SKIP'
            '71b55617ce477fe3c47dfaef6b30a47f17c38442b2f80ebb2f167123e05d44c0')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {

  cd "${srcdir}/${_pkgname}/${_pkgname}"
  npm install
  npx cap telemetry off
  npx cap sync @capacitor-community/electron
  cd electron
  python patch_capacitor_plugin.py
  npm install

}

build() {

  cd "${srcdir}/${_pkgname}/${_pkgname}/electron"
  jq '.linux.target = ["dir"]' electron-builder.config.json | sponge electron-builder.config.json
  npm run electron:make

}
package() {

  install -dm755 "${pkgdir}/opt"
  cp --preserve=mode -r "${srcdir}/${_pkgname}/${_pkgname}/electron/dist/linux-unpacked" "${pkgdir}/opt/Materialious"

  install -dm755 "${pkgdir}/usr/share/icons/hicolor/512x512/apps"
  install -m644 "${srcdir}/${_pkgname}/${_pkgname}/electron/assets/appIcon.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"

  install -dm755 "${pkgdir}/usr/share/applications"
  install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

}
