# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=stremio
pkgver=4.4.171
pkgrel=1
pkgdesc='A one-stop hub for video content aggregation (Movies, TV shows, series, live television or web channels)'
arch=('x86_64')
url='https://www.stremio.com/'
license=('GPL-3.0-only')
depends=(
    'gcc-libs'
    'glibc'
    'hicolor-icon-theme'
    'mpv'
    'nodejs'
    'openssl'
    'qt5-base'
    'qt5-declarative'
    'qt5-webengine'
    'qt5-quickcontrols'
    'qt5-quickcontrols2'
    'qt5-translations'
    'qt5-webchannel')
makedepends=(
    'cmake'
    'git'
    'librsvg')
source=("git+https://github.com/Stremio/stremio-shell.git#tag=v${pkgver}"
        'git+https://github.com/Ivshti/libmpv.git'
        'git+https://github.com/itay-grudev/SingleApplication.git'
        "stremio-${pkgver}-server.js"::"https://dl.strem.io/four/v${pkgver}/server.js"
        "stremio-${pkgver}-stremio.asar"::"https://dl.strem.io/four/v${pkgver}/stremio.asar"
        '010-stremio-do-not-download-server-js.patch')
sha256sums=('70acafb9e959cba52ef2f6335bac84b2ea3d65d929019c2d4d542edc11f4d490'
            'SKIP'
            'SKIP'
            'c2a24354fb8ead12d527b6af184b3ad0d1665a76b2c4a108ad81eb3b312165c9'
            '2142db99f12287f9b4a7b85c0f6a1e7a85f877ba24dd9ec0952342b55a72af03'
            'b5eff88b30d8c6030e36ca4949ebf6ff9515efbedc0b9bc748110cd1fbc0671a')

prepare() {
    git -C stremio-shell submodule init
    git -C stremio-shell config --local submodule.deps/libmpv.url "${srcdir}/libmpv"
    git -C stremio-shell config --local submodule.deps/singleapplication.url "${srcdir}/SingleApplication"
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
    install -d -m755 "${pkgdir}/usr/"{bin,share/applications}
    ln -sr "${pkgdir}/opt/stremio/stremio" "${pkgdir}/usr/bin/stremio"
    ln -sr "${pkgdir}/opt/stremio/smartcode-stremio.desktop" "${pkgdir}/usr/share/applications/com.stremio.stremio.desktop"
    
    # icons
    local _file
    local _res
    while read -r -d '' _file
    do
        _res="$(printf '%s' "$_file" | sed 's/\.png$//;s/^.*_//')"
        install -d -m755 "${pkgdir}/usr/share/icons/hicolor/${_res}x${_res}/apps"
        ln -sr "${pkgdir}/opt/stremio/icons/smartcode-stremio_${_res}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_res}x${_res}/apps/smartcode-stremio.png"
        ln -sr "${pkgdir}/opt/stremio/icons/smartcode-stremio-tray_${_res}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_res}x${_res}/apps/smartcode-stremio-tray.png"
    done < <(find "${pkgdir}/opt/stremio/icons" -maxdepth 1 -type f -name 'smartcode-stremio_*.png' -print0)
}
