# Maintainer: Bruno Pagani <archange@archlinux.org>

pkgname=cozy-desktop
pkgver=3.35.0
pkgrel=1
pkgdesc="File synchronisation for Cozy Cloud on Desktop"
arch=(any)
url="https://cozy-labs.github.io/cozy-desktop/"
license=(AGPL3)
_electron=electron12
depends=(${_electron})
makedepends=(nodejs-lts-fermium yarn git node-gyp python)
source=(https://github.com/cozy-labs/${pkgname}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz
        https://github.com/cozy-labs/${pkgname}/releases/download/v${pkgver}/Cozy-Drive-${pkgver}-x86_64.AppImage
        watcher-1.3.5.tar.gz::https://github.com/atom/watcher/archive/refs/tags/v1.3.5.tar.gz
        ${pkgname}.desktop
        ${pkgname}.sh)
sha256sums=('b7641b1275b3b5111f9ba92011b3ba58ad2921d00656fdf28ffdcfc4cb1fcd4a'
            '821b9fa83fc7f937acb9a0f59f0343694ef47aadb10d6954628875764d7447ad'
            'a674bf8f633a7d0a146d90db384e8761a9c430fc65a4e9028d9b19ad07a0f6d2'
            '563edd5a43c7f06080e03bec5f4e46154227f7e163500950ea39ecad466b198a'
            'a8783d3f6ce2da344ffe403f8e1a4f9da8de3b59e8bfda10e15a4ff5643244cf')

prepare() {
    # https://github.com/cozy-labs/cozy-desktop/issues/2206
    sed -i 's/from_path, EntryKind kind);/from_path, EntryKind kind) noexcept;/' watcher-1.3.5/src/worker/linux/cookie_jar.h
    # Specify electron version in launcher
    sed -i "s|@ELECTRON@|${_electron}|" ${pkgname}.sh
    cd ${pkgname}-${pkgver}
    yarn add file:"${srcdir}"/watcher-1.3.5
    yarn install --no-fund
}

build() {
    cd ${pkgname}-${pkgver}
    yarn build --offline
}

package() {
    cd ${pkgname}-${pkgver}
    # https://github.com/cozy-labs/cozy-desktop/issues/2206
    export npm_config_force_process_config=true
    yarn dist --dir -c.electronDist=/usr/lib/${_electron} -c.electronVersion=$(tail -c +1 /usr/lib/${_electron}/version)

    install -d "${pkgdir}"/usr/lib/${pkgname}
    cp -r dist/linux-unpacked/resources/* "${pkgdir}"/usr/lib/${pkgname}/

    rm "${pkgdir}"/usr/lib/cozy-desktop/app.asar.unpacked/gui/scripts/macos-add-favorite.py
    rmdir "${pkgdir}"/usr/lib/cozy-desktop/app.asar.unpacked/{gui/{scripts/,},}
    rm -r "${pkgdir}"/usr/lib/cozy-desktop/regedit

    cd "${srcdir}"
    chmod +x Cozy-Drive-${pkgver}-x86_64.AppImage
    ./Cozy-Drive-${pkgver}-x86_64.AppImage --appimage-extract
    cp -r squashfs-root/usr/share "${pkgdir}"/usr/
    chmod a+rX -R "${pkgdir}"/usr/share

    install -Dm755 ${pkgname}.sh "${pkgdir}"/usr/bin/${pkgname}
    install -Dm644 ${pkgname}.desktop "${pkgdir}"/usr/share/applications/${pkgname}.desktop
}
