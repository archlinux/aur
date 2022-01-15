# Maintainer: Core_UK <mail.coreuk@gmail.com>
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org>

pkgname=apple-music-electron-git
_pkgname=Apple-Music-Electron
pkgver=3.0.0
pkgrel=1
pkgdesc="An open-source, GPU-accelerated Electron application that emulates the Apple Music website in a customizable interface. NOTE: This package has been archived by the development team for the newer native Cider Project."
arch=("armv7h" "i686" "x86_64")
url="https://github.com/CiderApp/${_pkgname}.git"
license=("MIT")
depends=('gtk3' 'libxss' 'nss')
makedepends=('yarn' 'git' 'npm' 'nodejs-lts-gallium')
optdepends=('libnotify: Playback notifications'
            'otf-san-francisco: Use of SF Font for certain themes')
provides=(apple-music-electron)
conflicts=(apple-music-electron)
source=(
  "git+https://github.com/CiderApp/${_pkgname}.git"
  "Apple-Music-Electron.desktop"
)
sha256sums=('SKIP'
            '88ad7411fc3bbebc0c117170e82e2d2033ae2e736f447e10849c5e111caa3135')

pkgver() {
	cd "$srcdir/$_pkgname"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${_pkgname}"
    echo "Building ${_pkgname} on v${pkgver} : [Install Build Dependencies] | Build | Done"
    yarn install --non-interactive --pure-lockfile --cache-folder "${srcdir}/yarn-cache"

    echo "Building : Install Build Dependencies | [Build] | Done"
    if [[ ${CARCH} == "armv7h" ]]; then
        yarn electron-builder build --armv7l --linux dir
    elif [[ ${CARCH} == "i686" ]]; then
        yarn electron-builder build --ia32 --linux dir
    elif [[ ${CARCH} == "x86_64" ]]; then
        yarn electron-builder build --x64 --linux dir
    fi

    echo "Building : Install Build Dependencies | Build | [Done]"
}
 
package() {
    cd "${srcdir}/${_pkgname}"

    echo "Packaging : [Desktop Shortcut] | Icon | Build Files | Other Files | Done"
    install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    echo "Packaging : Desktop Shortcut | [Icon] | Build Files | Other Files | Done"
    install -Dm644 "${srcdir}/${_pkgname}/resources/icons/icon.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname%-git}.png"


    echo "Packaging : Desktop Shortcut | Icon | [Build Files] | Other Files | Done"
    install -d "$pkgdir/opt/"
    install -d "$pkgdir/usr/bin/"
    cd ${srcdir}/${_pkgname}/dist/linux-unpacked
    mkdir "${pkgdir}/opt/${pkgname%-git}"
    cp -r --preserve=mode * "${pkgdir}/opt/${pkgname%-git}"
    ln -sf "/opt/${pkgname%-git}/${pkgname%-git}" "${pkgdir}/usr/bin/${pkgname%-git}"


    echo "Packaging : Desktop Shortcut | Icon | Build Files | [Other Files] | Done"
    install -d "$pkgdir/usr/share/licenses" "$pkgdir/usr/share/doc"
    install -Dm644 "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/${_pkgname}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"


    echo "Packaging : Desktop Shortcut | Icon | Build Files | Other Files | [Done]"
}

