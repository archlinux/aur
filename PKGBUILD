# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: Frederik Schwan <freswa at archlinux dot org>
# Contributor: Nicola Squartini <tensor5@gmail.com>

pkgname=caprine
pkgver=2.60.3
pkgrel=1
pkgdesc='Elegant Facebook Messenger desktop app'
arch=('any')
url='https://github.com/sindresorhus/caprine'
license=('MIT')
_electron=electron29
depends=('bash' "${_electron}" 'hicolor-icon-theme')
makedepends=('npm')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "${pkgname}.sh")
sha256sums=('ae836f009aeb587270c33eb05777939c5bbccee7e792ebbe03a6e709491bb8a1'
            '70679c9959bae776d667ae1dbd4ffca9298d8784ad4a5959f3b35d2493f2c131')

prepare() {
    sed -i "s/@ELECTRON@/${_electron}/" "${pkgname}.sh"

    cd "${pkgname}-${pkgver}"
    npm install --no-fund
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
    install -d "${pkgdir}/usr/lib/${pkgname}"
    cp -r dist/linux-unpacked/resources/* "${pkgdir}/usr/lib/${pkgname}"
    for i in 16 32 48 64 128 256 512; do
        install -Dm644 "build/icons/${i}x${i}.png" "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/${pkgname}.png"
    done
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "packages/rpm/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 license -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
