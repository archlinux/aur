# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=stremio
pkgver=4.4.120
pkgrel=1
pkgdesc='A one-stop hub for video content aggregation (Movies, TV shows, series, live television or web channels)'
arch=('x86_64')
url='https://www.stremio.com/'
license=('GPL3')
depends=('mpv' 'nodejs' 'openssl' 'qt5-webengine' 'qt5-base' 'qt5-declarative'
          'qt5-quickcontrols' 'qt5-quickcontrols2' 'qt5-translations' 'qt5-webchannel')
makedepends=('git' 'librsvg')
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
            '241f5633528e9f19c84c7ca41266771c309e286d6d9393a99e0fbce2203a3caa'
            'd035141496ad41352490464c3fff6492d13fee146edb88afeefc15d07662e89e'
            '7653fc2d0ddf20fa212f15648f5ceb1c0b7b5dd6902c31b20f9724cb1665ec74')

prepare() {
    git -C stremio-shell submodule init
    git -C stremio-shell config --local submodule.deps/libmpv.url "${srcdir}/libmpv"
    git -C stremio-shell config --local submodule.deps/singleapplication.url "${srcdir}/SingleApplication"
    git -C stremio-shell config --local submodule.deps/chroma.url "${srcdir}/razerchroma"
    git -C stremio-shell submodule update
    
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
