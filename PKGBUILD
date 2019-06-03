# Maintainer: mutantmonkey <aur@mutantmonkey.mx>

pkgname=intiface-desktop
pkgver=15.0.0
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
sha256sums=('9624fe579d93afa294d93a184a2b013771a7b52a09156d2e0c0f32e54a62e1e3'
            '4205a31af9b20ffaf3d124b6a08ea4e21d5c41be679f8412c203c20ee06e41ac'
            'ece9fd45978dae583a9c572f3e64f8234350d5e53f9c1ae2da503c53b3ecff64')

build() {
  cd "${pkgname}-${pkgver}"

  #sed -i 's/trash /rm -rf /g' packages/core/package.json

  export npm_config_cache="$srcdir/npm_cache"
  yarn install
  yarn build:all
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
