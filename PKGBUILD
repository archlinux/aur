# Maintainer: Bruno Ancona <bruno at powerball253 dot com>

pkgname=eternalmodmanager
pkgver=1.4.7
pkgrel=1
pkgdesc='Cross platform mod manager for DOOM Eternal.'
arch=('x86_64')
url='https://github.com/PowerBall253/EternalModManager'
license=('MIT')
depends=('electron13-bin')
makedepends=('npm')
source=("${url}/archive/v${pkgver}/EternalModManager-v${pkgver}.tar.gz"
        eternalmodmanager
        eternalmodmanager.desktop)
sha256sums=('91bb7e1f023d5c76234f1e7f9ab446bfe64325fa7f144ed5ee5b709f4eaa5fe8'
            'd500abdf9bb20e4221679abe0d85e687c371590f409b378ce30a909838db99e8'
            '0e8c5bfbde1269d598f0a1582bc0dab38745bfae41f7de43a0d1b59b55861532')

build() {
    cd "EternalModManager-${pkgver}"

    # Remove the electron line from package.json
    sed -i '/"electron": /d' package.json

    # Install node packages and build app
    HOME="${srcdir}/.electron-gyp" npm install
    HOME="${srcdir}/.electron-gyp" npm install --save-dev @types/electron
    npm run build -- --linux --x64 --dir -c.electronDist="/usr/lib/electron13" -c.electronVersion="$(electron13 --version | tail -c +2)"
}

package() {
    # Install app's files
    install -Dm644 -t "${pkgdir}/usr/share/applications" "${pkgname}.desktop"
    install -Dm755 -t "${pkgdir}/usr/bin" "$pkgname"

    cd "EternalModManager-${pkgver}"
    install -Dm644 "resources/icon.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
    install -Dm644 "dist/linux-unpacked/resources/app.asar" "${pkgdir}/usr/lib/${pkgname}.asar"
}
