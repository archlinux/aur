# Maintainer: Nicola Squartini <tensor5@gmail.com>

pkgname=mancy
pkgver=3.1.0
pkgrel=1
pkgdesc='A GUI REPL for Javascript & more…'
arch=('i686' 'x86_64')
url='https://github.com/princejwesley/Mancy'
license=('MIT')
depends=('electron' 'nodejs')
makedepends=('git' 'gulp' 'npm')
options=(!emptydirs)
source=("https://github.com/princejwesley/Mancy/archive/v${pkgver}.tar.gz"
        'mancy.desktop'
        'mancy.sh')
sha256sums=('94c2a9596b801222716fe82eb7942bf73fb9768b5b08848550719885d69c44af'
            '42d2698429a80e95efb3bd95c9071b242af6657e530cf374a319fab53d653931'
            'ff225cc9d548c338b61621e4b877a3694f92c4c1fc04cfde4f0a652cb9715958')

prepare() {
    cd Mancy-${pkgver}

    sed -e 's/electron-rebuild && //;/electron-prebuilt/d' -i package.json

    _electron_version=$(electron --version)
    sed -e "s/const electronVersion = .*/const electronVersion = '${_electron_version#v}';/" \
        -i gulpfile.babel.js
}

build() {
    cd Mancy-${pkgver}

    _electron_version=$(electron --version)

    if [ "${CARCH}" == 'x86_64' ]; then
        _target=x64
    else
        _target=ia32
    fi

#    export SKIP_SASS_BINARY_DOWNLOAD_FOR_CI=1

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
    HOME=~/.electron-gyp npm install

    npm run build
    npm prune --production
}

package() {
    cd Mancy-${pkgver}

    _appdir=/usr/lib/${pkgname}

    install -d "${pkgdir}"${_appdir}
    cp -r build/* "${pkgdir}"${_appdir}

    install -D -m 755 "${srcdir}"/${pkgname}.sh "${pkgdir}"/usr/bin/${pkgname}
    install -D -m644 "${srcdir}"/${pkgname}.desktop \
            "${pkgdir}"/usr/share/applications/${pkgname}.desktop

    install -d "${pkgdir}"/usr/share/licenses/${pkgname}
    ln -s ../../../lib/${pkgname}/LICENSE \
        "${pkgdir}"/usr/share/licenses/${pkgname}

    # Clean up
    find "${pkgdir}"${_appdir} \
        -name "package.json" \
            -exec sed -e "s|${srcdir}/Mancy-${pkgver}|${_appdir}|" \
                -i {} \; \
        -or -name "*.mk" -exec rm '{}' \; \
        -or -name "binding.gyp" -exec rm '{}' \; \
        -or -path "*/font-manager/src" -prune -exec rm -r '{}' \; \
        -or -name "binding.Makefile" -exec rm '{}' \; \
        -or -name "config.gypi" -exec rm '{}' \; \
        -or -name "deps" -prune -exec rm -r '{}' \; \
        -or -name "Makefile" -exec rm '{}' \; \
        -or -name "obj.target" -prune -exec rm -r '{}' \; \
        -or -name "test" -prune -exec rm -r '{}' \;
}
