# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=stremio
pkgver=4.4.106
pkgrel=1
pkgdesc='A one-stop hub for video content aggregation (Movies, TV shows, series, live television or web channels)'
arch=('x86_64')
url='https://www.stremio.com/'
license=('GPL3')
depends=('mpv' 'nodejs' 'openssl' 'qt5-webengine' 'qt5-base' 'qt5-declarative'
          'qt5-quickcontrols' 'qt5-quickcontrols2' 'qt5-translations' 'qt5-webchannel')
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
            '4b5a091b936ad324c58a57fe635c0dc3a93f851092535f4f92163cddcb143517'
            '2775741ca73537ece1f7d528c8778246eb738efc4a1942c86e9e8d475fd0ec2e'
            'b1febe31374eaceefc1f869d574a00f7f5414eafa8b5d0a92a5f511078ba3add')

prepare() {
    git -C stremio-shell submodule init
    git -C stremio-shell config --local submodule.deps/libmpv.url "${srcdir}/libmpv"
    git -C stremio-shell config --local submodule.deps/singleapplication.url "${srcdir}/SingleApplication"
    git -C stremio-shell config --local submodule.deps/chroma.url "${srcdir}/razerchroma"
    git -C stremio-shell submodule update
    
    # do not download server.js during 'make'
    ln -s "${srcdir}/stremio-${pkgver}-server.js" stremio-shell/server.js
    patch -d stremio-shell -Np1 -i "${srcdir}/stremio-do-not-download-server-js.patch"
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
