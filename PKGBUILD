# Maintainer: EricZhang456 <ericzhang456@hotmail.com>

# Modified from the Cider PKGBUILD

pkgname=cider-canary
_pkgname=Cider
pkgver=1.1.0.1477.2efd9b7
pkgrel=1
pkgdesc="Project Cider. A new look into listening and enjoying music in style and performance. Built from the ground up with vue.js and electron. Compiled from the GitHub repositories upcoming branch."
arch=("armv7h" "i686" "x86_64")
url="https://github.com/CiderApp/${_pkgname%-canary}.git"
license=("GPL")
depends=('gtk3' 'nss')
makedepends=('git' 'npm' 'yarn' 'typescript')
optdepends=('libnotify: Playback notifications')
provides=('cider')
conflicts=('cider')
source=(
  "git+https://github.com/CiderApp/${_pkgname}#branch=develop"
  "Cider.desktop"
)
sha256sums=('SKIP'
            'daa9f225b565b30f6fda10c8fa7410b9784938d1ef6a69986891abac77ef0709')

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
    yarn build
    if [[ ${CARCH} == "armv7h" ]]; then
        yarn electron-builder --armv7l --linux dir
    elif [[ ${CARCH} == "i686" ]]; then
        yarn electron-builder --ia32 --linux dir
    elif [[ ${CARCH} == "x86_64" ]]; then
        yarn electron-builder --x64 --linux dir
    fi

    echo "Building : Install Build Dependencies | Build | [Done]"
}
 
package() {
    cd "${srcdir}/${_pkgname}"

    echo "Packaging : [Desktop Shortcut] | Icon | Build Files | Other Files | Done"
    install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    echo "Packaging : Desktop Shortcut | [Icon] | Build Files | Other Files | Done"
    install -Dm644 "${srcdir}/${_pkgname}/resources/icons/icon.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname%-canary}.png"


    echo "Packaging : Desktop Shortcut | Icon | [Build Files] | Other Files | Done"
    install -d "$pkgdir/opt/"
    install -d "$pkgdir/usr/bin/"
    cd ${srcdir}/${_pkgname}/dist/linux-unpacked
    mkdir "${pkgdir}/opt/${pkgname%-canary}"
    cp -r --preserve=mode * "${pkgdir}/opt/${pkgname%-canary}"
    ln -sf "/opt/${pkgname%-canary}/${pkgname%-canary}" "${pkgdir}/usr/bin/${pkgname%-canary}"


    echo "Packaging : Desktop Shortcut | Icon | Build Files | [Other Files] | Done"
    install -d "$pkgdir/usr/share/licenses" "$pkgdir/usr/share/doc"
    install -Dm644 "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/${_pkgname}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"


    echo "Packaging : Desktop Shortcut | Icon | Build Files | Other Files | [Done]"
}
