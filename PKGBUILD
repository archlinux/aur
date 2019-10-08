# Maintainer: Simon Tas <simon.tas.st@gmail.com>
pkgname="listen-moe-desktop-git"
_pkgname="listen-moe-desktop"
__pkgname="desktop-app"
pkgver=0.2.6.r1.g4da59ce
pkgrel=1
pkgdesc="Official LISTEN.moe Desktop Client"
arch=('x86_64')
url="https://github.com/LISTEN-moe/${__pkgname}"
makedepends=('git' 'npm')
source=("git+https://github.com/LISTEN-moe/${__pkgname}.git"
        "listen-moe-desktop.desktop")
md5sums=('SKIP'
         '91dc502eb72cca45e2d786de3c1ac00d')

pkgver() {
    cd ${srcdir}/${__pkgname}
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd ${srcdir}/${__pkgname}
    
    npm install --cache "${srcdir}/npm-cache"
    ./node_modules/.bin/vue-cli-service electron:build --linux --x64 --dir dist
}

package() {
    cd ${srcdir}/${__pkgname}
    
    install -dm755 "${pkgdir}/usr/lib/${_pkgname}"
    cp -dr --no-preserve=ownership dist_electron/linux-unpacked/* "${pkgdir}/usr/lib/${_pkgname}/"
    
    install -dm755 "${pkgdir}/usr/share/icons/hicolor"
    install -Dm644 build/256x256.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png"
    
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/usr/lib/${_pkgname}/listen.moe-desktop-app" "${pkgdir}/usr/bin/listen-moe-desktop"
    
    install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
 
 
