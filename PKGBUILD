# Maintainer Core_UK <mail.coreuk@gmail.com>

pkgname=apple-music-electron
_pkgname=Apple-Music-Electron
pkgver=3.0.0
pkgrel=2
pkgdesc="An open-source, GPU-accelerated Electron application that emulates the Apple Music website in a customizable interface. Builds from most recently release on GitHub."
arch=("armv7h" "i686" "x86_64")
url="https://github.com/Apple-Music-Electron/${_pkgname}.git"
_url="https://github.com/Apple-Music-Electron/${_pkgname}"
license=("MIT")
depends=('libxss')
makedepends=('yarn' 'git' 'npm')
optdepends=('libnotify: Playback notifications'
            'otf-san-francisco: Use of SF Font for certain themes')
provides=(pkgname)
conflicts=("${pkgname}-git")
source=(
  "${_pkgname}-${pkgver}.tar.gz::$_url/archive/v${pkgver}.tar.gz"
  "Apple-Music-Electron.desktop"
)
sha256sums=('5a379e9f29a69ac3509003fce5e43332d7409d7abbeec3553d1d30784303a778'
            '88ad7411fc3bbebc0c117170e82e2d2033ae2e736f447e10849c5e111caa3135')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
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
    cd "${srcdir}/${_pkgname}-${pkgver}"

    echo "Packaging : [Desktop Shortcut] | Icon | Build Files | Other Files | Done"
    install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"


    echo "Packaging : Desktop Shortcut | [Icon] | Build Files | Other Files | Done"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/resources/icons/icon.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"


    echo "Packaging : Desktop Shortcut | Icon | [Build Files] | Other Files | Done"
    install -d "$pkgdir/opt/"
    install -d "$pkgdir/usr/bin/"
    cd ${srcdir}/${_pkgname}-${pkgver}/dist/linux-unpacked
    mkdir "${pkgdir}/opt/${pkgname}"
    cp -r --preserve=mode * "${pkgdir}/opt/${pkgname}"
    ln -sf "/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"


    echo "Packaging : Desktop Shortcut | Icon | Build Files | [Other Files] | Done"
    install -d "$pkgdir/usr/share/licenses" "$pkgdir/usr/share/doc"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"


    echo "Packaging : Desktop Shortcut | Icon | Build Files | Other Files | [Done]"
}

