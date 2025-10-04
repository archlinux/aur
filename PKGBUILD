# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=stremio
pkgver=4.4.169
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
        'git+https://github.com/Ivshti/razerchroma.git'
        "stremio-${pkgver}-server.js"::"https://dl.strem.io/four/v${pkgver}/server.js"
        "stremio-${pkgver}-stremio.asar"::"https://dl.strem.io/four/v${pkgver}/stremio.asar"
        '010-stremio-do-not-download-server-js.patch')
sha256sums=('de7209be7fc86e998264d9c2bd4fa65d5c9a737cb1da9c91de4bf654ea1fb85d'
            'SKIP'
            'SKIP'
            'SKIP'
            'e502ae545fc74bf6c49dda910842aaf229b2a1e314924481ec06bf911d459753'
            'fb0e8d2c95f021e3504643cd63be6125a63c2d5910aa564e04e9324623a263ce'
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
    ln -s ../../../opt/stremio/smartcode-stremio.desktop "${pkgdir}/usr/share/applications/com.stremio.stremio.desktop"
    
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
