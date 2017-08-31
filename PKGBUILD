# Maintainer: Nicola Squartini <tensor5@gmail.com>

pkgname=upterm
pkgver=0.4.0
pkgrel=1
pkgdesc='A terminal emulator for the 21st century'
arch=('i686' 'x86_64')
url='https://github.com/railsware/upterm'
license=('MIT')
depends=('electron')
makedepends=('apm' 'git' 'npm')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
        'upterm.desktop'
        'upterm.js')
sha256sums=('b1cb39ba3574a35a2e3d0e90850f6dc75ce529029029ddeddf6fc3e4e8406664'
            '2d55728dcd4f0b25195474d8676f8994c266f24e8e928ddbb9ff86959c3ac96f'
            '5522f5f78c0686d5e419661f4264e2d2f5f0856582f1494010e457c150f67910')

prepare() {
    cd ${pkgname}-${pkgver}

    sed -e '/postinstall/d' -i package.json
}

build() {
    cd ${pkgname}-${pkgver}

    npm install immutable node-pty rxjs
    types=('@types/chokidar' '@types/csv-parse' '@types/csv-stringify' '@types/enzyme' '@types/fs-extra' '@types/klaw' '@types/lodash' '@types/node' '@types/react')
    npm install "${types[@]}"
    npm install --ignore-scripts electron
    npm install typescript
    npm run tsc
    rm -r node_modules

    ATOM_HOME="${PWD}" apm install --production
    rmdir packages

    install -Dm644 -t compiled/src/views src/views/index.html
}

package() {
    cd ${pkgname}-${pkgver}

    appdir=/usr/lib/${pkgname}

    install -d "${pkgdir}"${appdir}
    cp -r * "${pkgdir}"${appdir}

    for size in 16 32 48 64 256; do
        install -Dm644 \
            build/icons/${size}x${size}.png \
            "${pkgdir}"/usr/share/icons/hicolor/${size}x${size}/apps/${pkgname}.png
        rm  "${pkgdir}"${appdir}/build/icons/${size}x${size}.png
    done
    rm "${pkgdir}"${appdir}/build/icon.{icns,ico,png}
    rmdir "${pkgdir}"${appdir}/build/icons
    rmdir "${pkgdir}"${appdir}/build

    install -Dm755 "${srcdir}"/${pkgname}.js "${pkgdir}"/usr/bin/${pkgname}
    install -Dm644 "${srcdir}"/${pkgname}.desktop \
            "${pkgdir}"/usr/share/applications/${pkgname}.desktop

    install -dm755 "${pkgdir}"/usr/share/licenses/${pkgname}
    ln -s $(realpath -m --relative-to=/usr/share/licenses/${pkgname} ${appdir}/LICENSE) \
        "${pkgdir}"/usr/share/licenses/${pkgname}

    # Clean up
    rm -r "${pkgdir}"${appdir}/src
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
