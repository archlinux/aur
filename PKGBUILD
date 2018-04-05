# Maintainer: Nicola Squartini <tensor5@gmail.com>

pkgname=daedalus
pkgver=0.9.1
_commit=cd19ef984bce3ff27fd08e792d09c1ecd262716e
pkgrel=1
pkgdesc='Cryptocurrency wallet'
arch=('any')
url='https://github.com/input-output-hk/daedalus'
license=('MIT')
depends=('cardano-sl' 'electron')
makedepends=('asar' 'git' 'npm' 'python2')
source=("git+https://github.com/input-output-hk/daedalus.git#commit=${_commit}"
        "${pkgname}.desktop"
        "${pkgname}.js"
        'no-check-dev-engines.patch'
        'use-system-electron.patch')
sha256sums=('SKIP'
            '965733a8cdbd1f983ce66413908da6da1ebfaa9e73e5a949620aa6347d2db294'
            '8e2b172d2ebcf172135d9fffb25b8c2ab0319e9abbbba0f0827381e9bd043cab'
            '43195e9a8073dc9bbf6285d918b4e496d715a5cc5eb0991abb17871724e5358b'
            'b91eda12b173fab3c2e0523a2c10556a63852f32c0fd6a4df3db5cb04d03b8ce')

prepare() {
    cd ${pkgname}

    patch -Np1 -i ../no-check-dev-engines.patch
    patch -Np1 -i ../use-system-electron.patch
}

build() {
    cd ${pkgname}

    PYTHON=python2 npm install
    npm run build
}

package() {
    cd ${pkgname}

    appdir=/usr/lib/${pkgname}
    install -Dm644 -t "${pkgdir}${appdir}" package.json
    install -Dm644 -t "${pkgdir}${appdir}/app" app/index.html
    install -Dm644 -t "${pkgdir}${appdir}/dist" dist/*

    cd ${pkgdir}${appdir}
    npm install electron-store source-map-support
    rm package-lock.json
    cd "${srcdir}/${pkgname}"

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
