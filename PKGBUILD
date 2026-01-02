# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: Frederik Schwan <freswa at archlinux dot org>
# Contributor: Nicola Squartini <tensor5@gmail.com>

pkgname=caprine
pkgver=2.61.0
pkgrel=1
pkgdesc='Elegant Facebook Messenger desktop app'
arch=('any')
url='https://github.com/sindresorhus/caprine'
license=('MIT')
_electron=electron39
depends=('bash' "${_electron}")
makedepends=('npm')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
        "${pkgname}.sh")
sha256sums=('4ac222309a86afde59866dc15f59065fec2f30372d9311acb8fe5a6660beaff8'
            '70679c9959bae776d667ae1dbd4ffca9298d8784ad4a5959f3b35d2493f2c131')

prepare() {
    cd "${pkgname}-${pkgver}"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    npm install

    sed -i "s/@ELECTRON@/${_electron}/" "${srcdir}/${pkgname}.sh"
}

build() {
    cd "${pkgname}-${pkgver}"
    npm run build
    npx electron-builder --linux --dir \
        -c.electronDist="/usr/lib/${_electron}" \
        -c.electronVersion="$(cat /usr/lib/${_electron}/version)"
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm644 dist/linux-unpacked/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname}"
    cp -r dist/linux-unpacked/resources/app.asar.unpacked "${pkgdir}/usr/lib/${pkgname}"
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 build/icon.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "packages/rpm/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 license -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
