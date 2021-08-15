# Maintainer: Bruno Ancona <bruno at powerball253 dot com>

pkgname=eternalmodmanager
pkgver=1.5.4
pkgrel=2
pkgdesc='Cross platform mod manager for DOOM Eternal.'
arch=('x86_64')
url='https://github.com/PowerBall253/EternalModManager'
license=('MIT')
depends=('electron')
makedepends=('npm')
source=("${url}/archive/v${pkgver}/EternalModManager-v${pkgver}.tar.gz"
        eternalmodmanager)
sha256sums=('91b551b2c4419049bf7c280df591afaae5a85321623f8711178e143cbefb30e6'
            'd500abdf9bb20e4221679abe0d85e687c371590f409b378ce30a909838db99e8')

build() {
    cd "EternalModManager-${pkgver}"

    # Replace electron with electron type declarations for typescript
    sed -i '/"electron":/c\    "@types/electron": "^1.6.10",' package.json

    # Install node packages and build app
    HOME="${srcdir}/.electron-gyp" npm install
    HOME="${srcdir}/.electron-gyp" npm run build -- --linux --x64 --dir -c.electronDist="/usr/lib/electron" -c.electronVersion="$(electron --version | tail -c +2)"
}

package() {
    # Install app's files
    install -Dm755 -t "${pkgdir}/usr/bin" "$pkgname"

    cd "EternalModManager-${pkgver}"
    install -Dm644 -t "${pkgdir}/usr/share/applications/" "resources/${pkgname}.desktop"
    install -Dm644 -t "${pkgdir}/usr/share/metainfo/" "resources/${pkgname}.appdata.xml"
    install -Dm644 -t "${pkgdir}/usr/share/icons/hicolor/256x256/apps/" "resources/${pkgname}.png"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
    install -Dm644 "dist/linux-unpacked/resources/app.asar" "${pkgdir}/usr/lib/${pkgname}.asar"
}
