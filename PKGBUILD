# Maintainer:
# Contributor: Anna <morganamilo@gmail.com>

pkgname=superproductivity
pkgver=8.0.5
pkgrel=1
pkgdesc="ToDo List / Time Tracker / Personal Jira Task Manager"
arch=('x86_64')
url="https://super-productivity.com"
license=('MIT')
_electron=electron29
depends=('bash' "${_electron}" 'hicolor-icon-theme')
makedepends=('git' 'npm')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/johannesjo/super-productivity/archive/v${pkgver}.tar.gz"
        "${pkgname}.desktop"
        "${pkgname}.sh")
sha256sums=('cf7569ec502889432dbfa41af802103f539caa279e69e9d83a9950a61366e157'
            '54e5773ce27144d4f4a33b0b494fc37b52312c62eeda627882e4b6e328aaa9d9'
            'f9ca69e16223b3dcfa0d8ae9dbbff231255482d85f0d72ddcc5033dac890741e')

prepare() {
    sed -i "s/@ELECTRON@/${_electron}/" superproductivity.sh

    cd "super-productivity-${pkgver}"
    npm install --no-fund
}

build() {
    cd "super-productivity-${pkgver}"
    npm run build
    npx electron-builder --linux --x64 --dir \
        -c.electronDist="/usr/lib/${_electron}" \
        -c.electronVersion="$(cat /usr/lib/${_electron}/version)"
}

package() {
    cd "super-productivity-${pkgver}"

    # Install asar file
    install -Dm644 -t "${pkgdir}/usr/lib/${pkgname}" app-builds/linux-unpacked/resources/*

    # Install start script
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

    # Install shortcut
    install -Dm644 -t "${pkgdir}/usr/share/applications" "${srcdir}/${pkgname}.desktop"

    # Installing icons
    for i in 16 32 48 64 128 256 512 1024; do
        install -Dm644 "build/icons/${i}x${i}.png" "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/${pkgname}.png"
    done

    # Copying Licence
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
