# Maintainer: Nicola Squartini <tensor5@gmail.com>

pkgname=daedalus
pkgver=0.12.0
_commit=d4fd4d98c127161401a8d86763f3a3810f14978c
pkgrel=1
pkgdesc='Cryptocurrency wallet'
arch=('any')
url='https://github.com/input-output-hk/daedalus'
license=('MIT')
depends=('cardano-sl' 'electron')
makedepends=('asar' 'git' 'npm')
source=("git+https://github.com/input-output-hk/daedalus.git#commit=${_commit}"
        "${pkgname}.desktop"
        "${pkgname}.js"
        'no-check-dev-engines.patch')
sha256sums=('SKIP'
            '965733a8cdbd1f983ce66413908da6da1ebfaa9e73e5a949620aa6347d2db294'
            '8e2b172d2ebcf172135d9fffb25b8c2ab0319e9abbbba0f0827381e9bd043cab'
            '7eae7b06eecb596fd1b3345d8e3cc4c1463ef3c2c8b052bb4f9c906d1f8055f9')

prepare() {
    cd ${pkgname}

    patch -Np1 -i ../no-check-dev-engines.patch
}

build() {
    cd ${pkgname}

    npm install
    NODE_ENV=production npm run build
}

package() {
    cd ${pkgname}

    appdir=/usr/lib/${pkgname}
    install -Dm644 -t "${pkgdir}${appdir}" package.json
    install -Dm644 -t "${pkgdir}${appdir}/dist/main" dist/main/*
    cp -r dist/renderer "${pkgdir}${appdir}/dist"

    asar pack "${pkgdir}${appdir}" "${pkgdir}/usr/lib/daedalus.asar"
    rm -r "${pkgdir}${appdir}"

    install -Dm755 "${srcdir}/${pkgname}.js" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 -t "${pkgdir}/usr/share/applications" "${srcdir}/${pkgname}.desktop"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE

    for size in 16 22 24 32 48 64 128 256 512; do
        install -Dm644 \
            installers/icons/mainnet/${size}x${size}.png \
            "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/${pkgname}.png"
    done
}
