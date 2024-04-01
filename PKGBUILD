# Maintainer:
# Contributor: Anna <morganamilo@gmail.com>

pkgname=superproductivity
pkgver=8.0.1
pkgrel=1
pkgdesc="ToDo List / Time Tracker / Personal Jira Task Manager"
arch=('x86_64')
url="https://super-productivity.com"
license=('MIT')
depends=('bash' 'electron' 'hicolor-icon-theme')
makedepends=('git' 'npm')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/johannesjo/super-productivity/archive/v${pkgver}.tar.gz"
        "${pkgname}.desktop"
        "${pkgname}.sh")
sha256sums=('a97c79883b75342cafb22bb3a440c6e9fd8956a3d8275c599c2f7b765e4d176c'
            '54e5773ce27144d4f4a33b0b494fc37b52312c62eeda627882e4b6e328aaa9d9'
            '9fe6112e3e2150e3c858a7a6f0ec7dbff072d4f4540a6aadcedfd9882d3a94de')

prepare() {
    cd "super-productivity-${pkgver}"
    npm install --no-fund
}

build() {
    cd "super-productivity-${pkgver}"
    npm run build
    npx electron-builder --linux --x64 --dir \
        -c.electronDist=/usr/lib/electron \
        -c.electronVersion="$(tail -c +1 /usr/lib/electron/version)"
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
