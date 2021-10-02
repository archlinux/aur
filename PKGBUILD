# Maintainer: mutantmonkey <aur@mutantmonkey.mx>

pkgname=intiface-desktop
pkgver=27.0.0
pkgrel=1
pkgdesc="Open-source, cross-platform application that acts as a hub for sex hardware access"
depends=('electron')
makedepends=('npm' 'yarn' 'git' 'trash-cli' 'typescript')
arch=('i686' 'x86_64')
url="https://intiface.com/desktop/"
license=('BSD')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/intiface/intiface-desktop/archive/v${pkgver}.tar.gz"
        'intiface-desktop.sh'
        'intiface-desktop.desktop')
sha256sums=('11865096e660719aa5d506b8016fbd856e91982fa2beb0f99be6944abe236d8f'
            '2f7d3350631fda4da8f03938eb06b0b6d3ed571c9975906b7863298f75e4c73f'
            'ece9fd45978dae583a9c572f3e64f8234350d5e53f9c1ae2da503c53b3ecff64')

build() {
  cd "${pkgname}-${pkgver}"

  #sed -i 's/trash /rm -rf /g' packages/core/package.json

  export npm_config_cache="$srcdir/npm_cache"

  cd packages/protocols
  yarn
  yarn build
  cd ../core
  yarn
  yarn build
  cd ../core-backend
  yarn
  yarn build
  cd ../intiface
  yarn
  yarn electron:build --publish never
}

package() {
  cd "${pkgname}-${pkgver}"

  install -dm755 "${pkgdir}/usr/lib/${pkgname}/resources"
  install -m644 \
    packages/intiface/dist_electron/linux-unpacked/resources/app.asar \
    "${pkgdir}/usr/lib/${pkgname}/resources/app.asar"

  install -dm755 "${pkgdir}/usr/bin"
  install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

  install -Dm644 "${srcdir}/${pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:ts=2:sw=2:et:
