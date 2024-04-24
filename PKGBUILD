# Maintainer: Frederik Schwan <freswa at archlinux dot org>
# Contributor: Nicola Squartini <tensor5@gmail.com>

pkgname=caprine
pkgver=2.60.1
pkgrel=1
pkgdesc='Elegant Facebook Messenger desktop app'
arch=('any')
url='https://github.com/sindresorhus/caprine'
license=('MIT')
depends=('electron27')
makedepends=('git' 'npm')
options=(!emptydirs)
source=("git+https://github.com/sindresorhus/caprine.git#tag=v${pkgver}"
        'caprine.desktop'
        'caprine.js')
sha256sums=('bd996b5c16123fa4bec9f1326aed71c17777576cd2b592af038c5d2ce760a851'
            'ddb693c06b0d4adf41c799fd4d97c2d9c106669034f69f7af53a63cc45911a97'
            'effb2c3d24b57433bc5d404b3fa40ac7f403f4b60252d983f2ec6de2098cba32')

build() {
    cd ${pkgname}

    npm install --ignore-scripts
    npx --yes patch-package
    npx tsc
    rm -r node_modules
    npm install --ignore-scripts --production
    npx --yes patch-package
}

package() {
    cd ${pkgname}

    appdir=/usr/lib/${pkgname}

    install -d "${pkgdir}"${appdir}
    cp -r * "${pkgdir}"${appdir}

    install -dm755 "${pkgdir}/usr/share/pixmaps"
    install -m644 build/icon.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

    install -Dm755 "${srcdir}"/${pkgname}.js "${pkgdir}"/usr/bin/${pkgname}
    install -Dm644 "${srcdir}"/${pkgname}.desktop \
            "${pkgdir}"/usr/share/applications/${pkgname}.desktop

    install -dm755 "${pkgdir}"/usr/share/licenses/${pkgname}
    ln -s $(realpath -m --relative-to=/usr/share/licenses/${pkgname} ${appdir}/license) \
        "${pkgdir}"/usr/share/licenses/${pkgname}

    # Clean up
    rm -r "${pkgdir}"${appdir}/{build,source,tsconfig.json}
    find "${pkgdir}"${appdir} \
        -name "package.json" \
            -exec sed -e "s|${srcdir}/${pkgname}|${appdir}|" \
                -i {} \; \
        -or -name ".*" -prune -exec rm -r '{}' \; \
        -or -name "bin" -prune -exec rm -r '{}' \; \
        -or -name "example" -prune -exec rm -r '{}' \; \
        -or -name "examples" -prune -exec rm -r '{}' \; \
        -or -name "man" -prune -exec rm -r '{}' \; \
        -or -name "scripts" -prune -exec rm -r '{}' \; \
        -or -name "test" -prune -exec rm -r '{}' \;
}
