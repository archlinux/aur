# Maintainer: Nicola Squartini <tensor5@gmail.com>

pkgname=black-screen
pkgver=0.2.8
pkgrel=2
pkgdesc='A terminal emulator for the 21st century.'
arch=('i686' 'x86_64')
url='https://github.com/shockone/black-screen'
license=('MIT')
depends=('electron')
makedepends=('npm')
source=("https://github.com/shockone/black-screen/archive/v${pkgver}.tar.gz"
        'black-screen.sh')
sha256sums=('2705ca0464f0f20c837b0f2431ab9ba93bf67becb9d400dd7460a73024e2c81c'
            'f6a02cff74584d14f6574e2e5b4301b0ebeacc2793c998ec0be76b6d546c115e')

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
    HOME=~/.electron-gyp npm install

    npm run compile
    npm prune --production
}

package() {
    cd ${pkgname}-${pkgver}

    install -d "${pkgdir}"/usr/lib/${pkgname}
    cp -r * "${pkgdir}"/usr/lib/${pkgname}

    install -D -m 755 "${srcdir}"/${pkgname}.sh "${pkgdir}"/usr/bin/${pkgname}

    install -d "${pkgdir}"/usr/share/licenses/${pkgname}
    ln -s ../../../lib/${pkgname}/LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}
}
