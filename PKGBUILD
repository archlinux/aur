# Maintainer: Simon Tas <simon.tas.st@gmail.com>
pkgname="deezloader-remix-git"
_pkgname="DeezloaderRemix"
pkgver=4.2.1.r258.gbfb9838
pkgrel=1
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
    
    # This method uses the system electron version but currently doesn't work (https://notabug.org/RemixDevs/DeezloaderRemix/issues/161)
    # # remove electron dependency
    # sed -i '/		"electron": /d' ./package.json
    # # use system electron version
    # # see: https://wiki.archlinux.org/index.php/Electron_package_guidelines#Building_compiled_extensions_against_the_system_electron
    # export npm_config_target=$(cat /usr/lib/electron/version | tail -c +2)
    # export npm_config_arch=x64
    # export npm_config_target_arch=x64
    # export npm_config_disturl=https://atom.io/download/electron
    # export npm_config_runtime=electron
    # export npm_config_build_from_source=true
    # HOME="$srcdir/.electron-gyp" npm install --cache "${srcdir}/npm-cache"
    
    npm install --cache "${srcdir}/npm-cache"
    ./node_modules/.bin/electron-builder --linux --x64 --dir dist
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
 
 
