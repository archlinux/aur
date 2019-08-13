# Maintainer: Daniel Bermond < gmail-com: danielbermond >

pkgname=stremio
pkgver=4.4.77
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
        'git+https://github.com/itay-grudev/SingleApplication.git'
        'git+https://github.com/Ivshti/razerchroma.git'
        "stremio-${pkgver}-server.js"::"https://dl.strem.io/four/v${pkgver}/server.js"
        "stremio-${pkgver}-stremio.asar"::"https://dl.strem.io/four/v${pkgver}/stremio.asar"
        'stremio-do-not-download-server-js.patch')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '8903e9660302bfbb413c7f6b2275f4cf31ce97fd51cfb9c39a0c3ee5171134ff'
            'fc776607fc1e23f5d0433fc6803ee2a5785cf1b6a6ac224c7c46cb0e4bf81490'
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
