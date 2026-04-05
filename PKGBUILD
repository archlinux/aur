# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=stremio
pkgver=4.4.183
pkgrel=1
_serverjs_ver=4.4.172
pkgdesc='A one-stop hub for video content aggregation (Movies, TV shows, series, live television or web channels)'
arch=('x86_64')
url='https://www.stremio.com/'
license=('GPL-3.0-only')
depends=(
    'glibc'
    'hicolor-icon-theme'
    'libgcc'
    'libstdc++'
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
        "stremio-${_serverjs_ver}-server.js"::"https://dl.strem.io/four/v${_serverjs_ver}/server.js"
        "stremio-${_serverjs_ver}-stremio.asar"::"https://dl.strem.io/four/v${_serverjs_ver}/stremio.asar"
        '010-stremio-do-not-download-server-js.patch')
sha256sums=('c98f9aaa299b6a0b812809cd380073d55f302e9972e4f8420512ebd587f1378b'
            'SKIP'
            'SKIP'
            '08d5510a771c3d07a8b1f9c0e521324551d6055b001c5a56c7a79e3e3e0474ef'
            'a6cb74bd82323ecaa898323c0b710d4297ebad50dd4f2389d84b8426ef6d943a'
            'b5eff88b30d8c6030e36ca4949ebf6ff9515efbedc0b9bc748110cd1fbc0671a')

prepare() {
    git -C stremio-shell submodule init
    git -C stremio-shell config --local submodule.deps/libmpv.url "${srcdir}/libmpv"
    git -C stremio-shell config --local submodule.deps/singleapplication.url "${srcdir}/SingleApplication"
    git -C stremio-shell -c protocol.file.allow='always' submodule update
    
    # do not download server.js during 'make'
    ln -s "../stremio-${_serverjs_ver}-server.js" stremio-shell/server.js
    patch -d stremio-shell -Np1 -i "${srcdir}/010-stremio-do-not-download-server-js.patch"
}

build() {
    make -C stremio-shell -f release.makefile PREFIX="$pkgdir"
}

package() {
    make -C stremio-shell -f release.makefile PREFIX="$pkgdir" install
    
    # streaming server files
    install -D -m644 "stremio-${_serverjs_ver}-server.js"    "${pkgdir}/opt/stremio/server.js"
    install -D -m644 "stremio-${_serverjs_ver}-stremio.asar" "${pkgdir}/opt/stremio/stremio.asar"
    
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
