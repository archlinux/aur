# Maintainer: Daniel Bermond < gmail-com: danielbermond >

pkgname=stremio
pkgver=4.4.52
pkgrel=1
pkgdesc='A one-stop hub for video content aggregation (Movies, TV shows, series, live television or web channels)'
arch=('x86_64')
url='https://www.stremio.com/'
license=('GPL3')
depends=('mpv' 'qt5-webengine' 'qt5-declarative' 'qt5-webchannel' 'qt5-quickcontrols'
         'qt5-quickcontrols2' 'qt5-translations' 'nodejs')
makedepends=('git' 'librsvg')
source=("git+https://github.com/Stremio/stremio-shell.git#tag=${pkgver}"
        'git+https://github.com/Ivshti/libmpv.git'
        'git+http://github.com/itay-grudev/SingleApplication.git'
        'git+https://github.com/Ivshti/razerchroma.git'
        "stremio-${pkgver}-server.js"::"https://dl.strem.io/four/v${pkgver}/server.js"
        "stremio-${pkgver}-stremio.asar"::"https://dl.strem.io/four/v${pkgver}/stremio.asar"
        'stremio-do-not-download-server-js.patch')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'a62f0cffd2cccb36aa9523d450403d6cd1950cc7e0b8f5c0ea03f34b08e66558'
            '9993faa94ab062c8eb22e9e7c6a113fdb6b024fd00eac5144ae3b1b8ce505b35'
            'b1febe31374eaceefc1f869d574a00f7f5414eafa8b5d0a92a5f511078ba3add')

prepare() {
    cd stremio-shell
    
    git submodule init
    git config --local submodule.deps/libmpv.url "${srcdir}/libmpv"
    git config --local submodule.deps/singleapplication.url "${srcdir}/SingleApplication"
    git config --local submodule.deps/chroma.url "${srcdir}/razerchroma"
    git submodule update
    
    # do not download server.js during 'make'
    ln -s "${srcdir}/stremio-${pkgver}-server.js" server.js
    patch -Np1 -i "${srcdir}/stremio-do-not-download-server-js.patch"
}

build() {
    cd stremio-shell
    
    make -f release.makefile PREFIX="$pkgdir"
}

package() {
    cd stremio-shell
    
    make -f release.makefile PREFIX="$pkgdir" install
    
    # streaming server files
    install -D -m644 "${srcdir}/stremio-${pkgver}-server.js"    "${pkgdir}/opt/stremio/server.js"
    install -D -m644 "${srcdir}/stremio-${pkgver}-stremio.asar" "${pkgdir}/opt/stremio/stremio.asar"
    
    # binary and desktop file
    mkdir -p "${pkgdir}/usr/"{bin,share/applications}
    ln -s ../../opt/stremio/stremio "${pkgdir}/usr/bin/stremio"
    ln -s ../../../opt/stremio/smartcode-stremio.desktop "${pkgdir}/usr/share/applications/smartcode-stremio.desktop"
    
    # icons
    local _res
    for _res in 16 22 24 32 64 128
    do
        mkdir -p "${pkgdir}/usr/share/icons/hicolor/${_res}x${_res}/apps"
        ln -s ../../../../../../opt/stremio/icons/smartcode-stremio_${_res}.png \
              "${pkgdir}/usr/share/icons/hicolor/${_res}x${_res}/apps/smartcode-stremio.png"
        ln -s ../../../../../../opt/stremio/icons/smartcode-stremio-tray_${_res}.png \
              "${pkgdir}/usr/share/icons/hicolor/${_res}x${_res}/apps/smartcode-stremio-tray.png"
    done
}
