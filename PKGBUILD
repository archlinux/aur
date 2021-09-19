# Maintainer Core_UK <mail.coreuk@gmail.com>

pkgname=apple-music-electron-git
_pkgname=Apple-Music-Electron
pkgver=2.5.1
pkgrel=1
pkgdesc="Electron wrapper for Apple Music based on Electron 14.0.0"
arch=("aarch64" "armv7h" "i686" "x86_64")
url="https://github.com/Apple-Music-Electron/${_pkgname}.git"
license=("MIT")
depends=('libxss')
makedepends=('yarn' 'git' 'npm')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(
  "${_pkgname}::git+https://github.com/Apple-Music-Electron/${_pkgname}.git"
  "Apple-Music-Electron.desktop"
)
sha256sums=('SKIP'
            '88ad7411fc3bbebc0c117170e82e2d2033ae2e736f447e10849c5e111caa3135')

pkgver() {
	cd "$srcdir/$_pkgname"
  var=$(grep '"version":.*' package.json | cut -d '"' -f 4 | head -1)
  echo ${var/-/.}.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
    cd "${srcdir}/${_pkgname}"
    echo "Building ${_pkgname} on v${pkgver} : [Install Build Dependencies] | Build | Done"
    yarn install --non-interactive --pure-lockfile --cache-folder "${srcdir}/yarn-cache"

    echo "Building : Install Build Dependencies | [Build] | Done"
    if [[ ${CARCH} == "aarch64" ]]; then
        yarn electron-builder build --arm64 --linux dir
    elif [[ ${CARCH} == "armv7h" ]]; then
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
    install -Dm644 "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    install -Dm644 "${srcdir}/${_pkgname}/README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"


    echo "Packaging : Desktop Shortcut | Icon | Build Files | Other Files | [Done]"
}

