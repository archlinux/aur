# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=stremio
pkgver=4.4.165
pkgrel=1
pkgdesc='A one-stop hub for video content aggregation (Movies, TV shows, series, live television or web channels)'
arch=('x86_64')
url='https://www.stremio.com/'
license=('GPL3')
depends=('mpv' 'nodejs' 'openssl' 'qt5-base' 'qt5-declarative' 'qt5-webengine'
         'qt5-quickcontrols' 'qt5-quickcontrols2' 'qt5-translations' 'qt5-webchannel'
         'hicolor-icon-theme')
makedepends=('git' 'cmake' 'librsvg')
source=("git+https://github.com/Stremio/stremio-shell.git#tag=v${pkgver}"
        'git+https://github.com/Ivshti/libmpv.git'
        'git+https://github.com/itay-grudev/SingleApplication.git'
        'git+https://github.com/Ivshti/razerchroma.git'
        "stremio-${pkgver}-server.js"::"https://dl.strem.io/four/v${pkgver}/server.js"
        "stremio-${pkgver}-stremio.asar"::"https://dl.strem.io/four/v${pkgver}/stremio.asar"
        '010-stremio-do-not-download-server-js.patch')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'e763e0d0fad5d796ab1aa843deb5d80a5d49ea47282fefc11d1be089004efce0'
            '4c74af8bf77ddc2b278c623a5f2d019e416439e1b83666cc850b730bc02acd20'
            'b5eff88b30d8c6030e36ca4949ebf6ff9515efbedc0b9bc748110cd1fbc0671a')

prepare() {
    git -C stremio-shell submodule init
    git -C stremio-shell config --local submodule.deps/libmpv.url "${srcdir}/libmpv"
    git -C stremio-shell config --local submodule.deps/singleapplication.url "${srcdir}/SingleApplication"
    git -C stremio-shell config --local submodule.deps/chroma.url "${srcdir}/razerchroma"
    git -C stremio-shell -c protocol.file.allow='always' submodule update
    
    # do not download server.js during 'make'
    ln -s "../stremio-${pkgver}-server.js" stremio-shell/server.js
    patch -d stremio-shell -Np1 -i "${srcdir}/010-stremio-do-not-download-server-js.patch"
}

build() {
    make -C stremio-shell -f release.makefile PREFIX="$pkgdir"
}

package() {
    make -C stremio-shell -f release.makefile PREFIX="$pkgdir" install
    
    # streaming server files
    install -D -m644 "stremio-${pkgver}-server.js"    "${pkgdir}/opt/stremio/server.js"
    install -D -m644 "stremio-${pkgver}-stremio.asar" "${pkgdir}/opt/stremio/stremio.asar"
    
    # binary and desktop file
    mkdir -p "${pkgdir}/usr/"{bin,share/applications}
    ln -s ../../opt/stremio/stremio "${pkgdir}/usr/bin/stremio"
    ln -s ../../../opt/stremio/smartcode-stremio.desktop "${pkgdir}/usr/share/applications/smartcode-stremio.desktop"
    
    # icons
    local _file
    local _res
    while read -r -d '' _file
    do
        _res="$(printf '%s' "$_file" | sed 's/\.png$//;s/^.*_//')"
        mkdir -p "${pkgdir}/usr/share/icons/hicolor/${_res}x${_res}/apps"
        ln -s ../../../../../../opt/stremio/icons/smartcode-stremio_${_res}.png \
              "${pkgdir}/usr/share/icons/hicolor/${_res}x${_res}/apps/smartcode-stremio.png"
        ln -s ../../../../../../opt/stremio/icons/smartcode-stremio-tray_${_res}.png \
              "${pkgdir}/usr/share/icons/hicolor/${_res}x${_res}/apps/smartcode-stremio-tray.png"
    done < <(find "${pkgdir}/opt/stremio/icons" -maxdepth 1 -type f -name 'smartcode-stremio_*.png' -print0)
}
