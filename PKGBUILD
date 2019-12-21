# Maintainer: Simon Tas <simon.tas.st@gmail.com>
pkgname="deezloader-remix-git"
_pkgname="DeezloaderRemix"
pkgver=4.2.1.r258.gbfb9838
pkgrel=2
pkgdesc="Deezloader Remix is an improved version of Deezloader based on the Reborn branch"
arch=('x86_64')
url="https://notabug.org/RemixDevs/${_pkgname}"
license=('GPL3')
makedepends=('git' 'npm')
depends=('electron3')
conflicts=('deezloader-remix-bin')
source=("git+https://notabug.org/RemixDevs/${_pkgname}"
        "${_pkgname}.desktop")
md5sums=('SKIP'
         '5d12c62e4eab4bb22346ac934598c601')

pkgver() {
    cd ${srcdir}/${_pkgname}
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd ${srcdir}/${_pkgname}
    
    # use system electron version
    # see: https://wiki.archlinux.org/index.php/Electron_package_guidelines
    electronDist=$(dirname $(realpath $(which electron3)))
    electronVer=$(electron3 --version | tail -c +2)
    sed -i "/\"electron\": \"/c\\\"electron\": \"$electronVer\"," package.json
    HOME="$srcdir/.electron-gyp" npm install --cache "${srcdir}/npm-cache"
    ./node_modules/.bin/electron-builder --linux --x64 --dir dist -c.electronDist=$electronDist -c.electronVersion=$electronVer
}

package() {
    cd ${srcdir}/${_pkgname}
    
    install -dm755 "${pkgdir}/usr/lib/${_pkgname}"
    cp -dr --no-preserve=ownership dist/linux-unpacked/* "${pkgdir}/usr/lib/${_pkgname}/"
    
    install -dm755 "${pkgdir}/usr/share/icons/hicolor"
    install -Dm644 app/icon.png "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/${_pkgname}.png"
    
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/usr/lib/${_pkgname}/deezloader-rmx" "${pkgdir}/usr/bin/deezloader-remix"
    
    install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
 
 
