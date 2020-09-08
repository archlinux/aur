# Maintainer: mutantmonkey <aur@mutantmonkey.mx>

pkgname=intiface-desktop
pkgver=17.0.0
pkgrel=1
pkgdesc="Open-source, cross-platform application that acts as a hub for sex hardware access"
depends=('electron')
makedepends=('npm' 'yarn' 'git' 'trash-cli' 'typescript')
arch=('i686' 'x86_64')
url="https://intiface.com/desktop/"
license=('BSD')
source=("https://github.com/intiface/intiface-desktop/archive/v${pkgver}.tar.gz"
        'intiface-desktop.sh'
        'intiface-desktop.desktop')
sha256sums=('d04484cb96eb285b13428804e27577bd930d7427628e6bdcb64ef3aee3c0287b'
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
  cd ../intiface
  yarn
  yarn electron:build
}

package() {
  cd "${pkgname}-${pkgver}"

  install -dm755 "${pkgdir}/usr/lib/${pkgname}"
  cp -r packages/intiface/dist_electron/linux-unpacked/resources \
    "${pkgdir}/usr/lib/${pkgname}"

  install -dm755 "${pkgdir}/usr/bin"
  install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

  install -Dm644 "${srcdir}/${pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:ts=2:sw=2:et:
