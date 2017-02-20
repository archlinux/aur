# Maintainer: Nicola Squartini <tensor5@gmail.com>

pkgname=black-screen
pkgver=0.2.125
pkgrel=1
pkgdesc='A terminal emulator for the 21st century'
arch=('i686' 'x86_64')
url='https://github.com/shockone/black-screen'
license=('MIT')
depends=('electron')
makedepends=('apm' 'npm' 'typescript')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
        'black-screen.desktop'
        'black-screen.js')
sha256sums=('4a65876b901ec4306e9e6a846c8778ccd08d4f12d0c0c8b7fdd66eb7a758d096'
            'd23e2d0254139efb0dfdd14814cee758bf7345834c5cc92dfd740c0fae0b586e'
            'd13c04e3a0c9855fd00faaf4a7ec1cef39a276744ff49a3c9b6cbbf0f83513fb')

prepare() {
    cd ${pkgname}-${pkgver}

    sed -e '/postinstall/d' -i package.json
}

build() {
    cd ${pkgname}-${pkgver}

    ATOM_HOME="${PWD}" apm install --production
    rmdir packages

    npm run compile
}

package() {
    cd ${pkgname}-${pkgver}

    appdir=/usr/lib/${pkgname}

    install -d "${pkgdir}"${appdir}
    cp -r * "${pkgdir}"${appdir}

    install -dm755  "${pkgdir}"/usr/share/icons/hicolor/256x256/apps
    mv "${pkgdir}"${appdir}/build/icon.png \
        "${pkgdir}"/usr/share/icons/hicolor/256x256/apps/${pkgname}.png
    rm "${pkgdir}"${appdir}/build/icon.{icns,ico}
    rmdir "${pkgdir}"${appdir}/build

    install -Dm755 "${srcdir}"/${pkgname}.js "${pkgdir}"/usr/bin/${pkgname}
    install -Dm644 "${srcdir}"/${pkgname}.desktop \
            "${pkgdir}"/usr/share/applications/${pkgname}.desktop

    install -dm755 "${pkgdir}"/usr/share/licenses/${pkgname}
    ln -s $(realpath -m --relative-to=/usr/share/licenses/${pkgname} ${appdir}/LICENSE) \
        "${pkgdir}"/usr/share/licenses/${pkgname}

    # Clean up
    rm -r "${pkgdir}"${appdir}/{housekeeping,src}
    find "${pkgdir}"${appdir} \
        -name "package.json" \
            -exec sed -e "s|${srcdir}/${pkgname}-${pkgver}|${appdir}|" \
                -i {} \; \
        -or -name ".*" -prune -exec rm -r '{}' \; \
        -or -name "*.mk" -exec rm '{}' \; \
        -or -path "*/promise/src" -prune -exec rm -r '{}' \; \
        -or -path "*/pty.js/src" -prune -exec rm -r '{}' \; \
        -or -name "*.yml" -exec rm '{}' \; \
        -or -name "benchmark" -prune -exec rm -r '{}' \; \
        -or -name "bin" -prune -exec rm -r '{}' \; \
        -or -name "bin.js" -exec rm '{}' \; \
        -or -name "binding.gyp" -exec rm '{}' \; \
        -or -name "binding.Makefile" -exec rm '{}' \; \
        -or -name "bower.json" -exec rm '{}' \; \
        -or -name "cli.js" -exec rm '{}' \; \
        -or -name "config.gypi" -exec rm '{}' \; \
        -or -name "deps" -prune -exec rm -r '{}' \; \
        -or -name "doc" -prune -exec rm -r '{}' \; \
        -or -name "docs" -prune -exec rm -r '{}' \; \
        -or -name "example" -prune -exec rm -r '{}' \; \
        -or -name "Makefile" -exec rm '{}' \; \
        -or -name "obj.target" -prune -exec rm -r '{}' \; \
        -or -name "test" -prune -exec rm -r '{}' \; \
        -or -name "tests" -prune -exec rm -r '{}' \; \
        -or -name "tools" -prune -exec rm -r '{}' \; \
        -or -name "wscript" -prune -exec rm -r '{}' \;
}
