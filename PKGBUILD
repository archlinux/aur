# Maintainer: Nicola Squartini <tensor5@gmail.com>

pkgname=black-screen
pkgver=0.2.29
pkgrel=1
pkgdesc='A terminal emulator for the 21st century'
arch=('i686' 'x86_64')
url='https://github.com/shockone/black-screen'
license=('MIT')
depends=('electron')
makedepends=('npm')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/shockone/black-screen/archive/v${pkgver}.tar.gz"
        'black-screen.desktop'
        'black-screen.sh')
sha256sums=('d415cc51f52b275258189b6c1a6c96a8746e7a12b5222c871fad5c140f41f02f'
            'c5b6a18675d1bcf9cb5bffec9041c815e5402c246c663d534f1c1266c1e536f0'
            'f6a02cff74584d14f6574e2e5b4301b0ebeacc2793c998ec0be76b6d546c115e')

prepare() {
    cd ${pkgname}-${pkgver}

    sed -e '/postinstall/d' -i package.json
}

build() {
    cd ${pkgname}-${pkgver}

    _electron_version=$(electron --version)

    if [ "${CARCH}" == 'x86_64' ]; then
        _target=x64
    else
        _target=ia32
    fi

    # Electron's version.
    export npm_config_target=${_electron_version#v}
    # The architecture of Electron, can be ia32 or x64.
    export npm_config_arch=${_target}
    # Download headers for Electron.
    export npm_config_disturl=https://atom.io/download/atom-shell
    # Tell node-pre-gyp that we are building for Electron.
    export npm_config_runtime=electron
    # Tell node-pre-gyp to build module from source code.
    export npm_config_build_from_source=true
    # Install all dependencies, and store cache to ~/.electron-gyp.
    HOME=~/.electron-gyp npm install --production

    # We should use system installed typescript here, but it's not up-to-date
    npm install typescript@2.1.0-dev.20160728
    npm run compile
    npm uninstall typescript
}

package() {
    cd ${pkgname}-${pkgver}

    _appdir=/usr/lib/${pkgname}

    install -d "${pkgdir}"${_appdir}
    cp -r * "${pkgdir}"${_appdir}

    install -D -m755 "${srcdir}"/${pkgname}.sh "${pkgdir}"/usr/bin/${pkgname}
    install -D -m644 "${srcdir}"/${pkgname}.desktop \
            "${pkgdir}"/usr/share/applications/${pkgname}.desktop

    install -d "${pkgdir}"/usr/share/licenses/${pkgname}
    ln -s ../../../lib/${pkgname}/LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}

    # Clean up
    rm -r "${pkgdir}"${_appdir}/{housekeeping,src}
    find "${pkgdir}"${_appdir} \
        -name "package.json" \
            -exec sed -e "s|${srcdir}/${pkgname}-${pkgver}|${_appdir}|" \
                -i {} \; \
        -or -name ".*" -prune -exec rm -r '{}' \; \
        -or -name "*.mk" -exec rm '{}' \; \
        -or -name "binding.gyp" -exec rm '{}' \; \
        -or -path "*/pty.js/src" -prune -exec rm -r '{}' \; \
        -or -path "*/promise/src" -prune -exec rm -r '{}' \; \
        -or -name "*.yml" -exec rm '{}' \; \
        -or -name "binding.Makefile" -exec rm '{}' \; \
        -or -name "config.gypi" -exec rm '{}' \; \
        -or -name "deps" -prune -exec rm -r '{}' \; \
        -or -name "doc" -prune -exec rm -r '{}' \; \
        -or -name "Makefile" -exec rm '{}' \; \
        -or -name "obj.target" -prune -exec rm -r '{}' \; \
        -or -name "test" -prune -exec rm -r '{}' \; \
        -or -name "wscript" -prune -exec rm -r '{}' \;
    cd "${pkgdir}"${_appdir}/node_modules
    rm -r loose-envify/cli.js nan/tools rimraf/bin.js
}
