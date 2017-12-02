# Maintainer: Nicola Squartini <tensor5@gmail.com>

pkgname=daedalus
pkgver=0.8.0
_commit=1490060fbcbaebba59fae5e10f9d96043c1c1309
pkgrel=1
pkgdesc='Cryptocurrency wallet'
arch=('any')
url='https://github.com/input-output-hk/daedalus'
license=('MIT')
depends=('electron')
makedepends=('asar' 'git' 'daedalus-bridge' 'npm' 'python2')
source=("git+https://github.com/input-output-hk/daedalus.git#commit=${_commit}"
        "${pkgname}.desktop"
        "${pkgname}.js")
sha256sums=('SKIP'
            '965733a8cdbd1f983ce66413908da6da1ebfaa9e73e5a949620aa6347d2db294'
            '8e2b172d2ebcf172135d9fffb25b8c2ab0319e9abbbba0f0827381e9bd043cab')

prepare() {
    cd ${pkgname}

    sed -e '/electron-inspector/d; /postinstall/d' -i package.json
}

build() {
    cd ${pkgname}

    PYTHON=python2 npm install
    npm link daedalus-client-api
    npm run build
}

package() {
    cd ${pkgname}

    appdir=/usr/lib/${pkgname}
    install -Dm644 -t "${pkgdir}${appdir}" package.json
    install -Dm644 -t "${pkgdir}${appdir}/app" app/index.html
    install -Dm644 -t "${pkgdir}${appdir}/dist" dist/*
    install -dm755 "${pkgdir}"${appdir}/node_modules/source-map{,-support}
    cp -r node_modules/source-map/{LICENSE,lib,package.json,source-map.js} \
        "${pkgdir}${appdir}/node_modules/source-map"
    cp -r node_modules/source-map-support/{LICENSE.md,package.json,source-map-support.js} \
        "${pkgdir}${appdir}/node_modules/source-map-support"
    asar pack "${pkgdir}${appdir}" "${pkgdir}/usr/lib/daedalus.asar"
    rm -r "${pkgdir}${appdir}"

    install -Dm755 "${srcdir}/${pkgname}.js" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 -t "${pkgdir}/usr/share/applications" "${srcdir}/${pkgname}.desktop"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE

    for size in 16 22 24 32 128 256 512; do
        install -Dm644 \
            installers/icons/${size}x${size}.png \
            "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/${pkgname}.png"
    done
}
