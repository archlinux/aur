# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: Anna <morganamilo@gmail.com>

pkgname=superproductivity
_name=super-productivity
pkgver=10.1.1
pkgrel=1
pkgdesc="An advanced todo list app with timeboxing and time tracking capabilities"
arch=('any')
url="https://super-productivity.com"
license=('MIT')
_electron=electron32
depends=('bash' "${_electron}" 'hicolor-icon-theme')
makedepends=('git' 'npm')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/johannesjo/super-productivity/archive/v${pkgver}.tar.gz"
        "${pkgname}.desktop"
        "${pkgname}.sh")
sha256sums=('142d7e63cf8dc112fec8dc7c1ad3ba9342dd841984cc1d2a22ad50663eaf853e'
            'e3c71e1ba653ebb1662c8a10d55ed72dbec37eea911c1f18568d0c3e2d13f452'
            'f9ca69e16223b3dcfa0d8ae9dbbff231255482d85f0d72ddcc5033dac890741e')

prepare() {
    sed -i "s/@ELECTRON@/${_electron}/" "${pkgname}.sh"

    cd "${_name}-${pkgver}"
    npm install
}

build() {
    cd "${_name}-${pkgver}"
    npm run build
    npx electron-builder --linux --dir \
        -c.electronDist="/usr/lib/${_electron}" \
        -c.electronVersion="$(cat /usr/lib/${_electron}/version)"
}

package() {
    cd "${_name}-${pkgver}"

    # Install asar file
    install -Dm644 app-builds/linux-unpacked/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname}"

    # Install start script
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

    # Install shortcut
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"

    # Installing icons
    for i in 16 32 48 64 128 256 512 1024; do
        install -Dm644 "build/icons/${i}x${i}.png" "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/${pkgname}.png"
    done

    # Copying Licence
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
