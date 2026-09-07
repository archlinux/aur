# Maintainer: Amro Emad <korialo001 at gmail dot com>

pkgname=p5.js
pkgver=v2.3.3
_pkgver=${pkgver#v}
pkgrel=1
pkgdesc="p5.js is a client-side JS platform that empowers artists, designers, students, and anyone to learn to code and express themselves creatively on the web. It is based on the core principles of Processing. (Full library)"
arch=("any")
url="https://beta.p5js.org"
license=("LGPL-2.1-only")
makedepends=(
    "git"
    "npm")
source=("https://github.com/processing/p5.js/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('11a89f996bf4f5675e6c7b8401b38a78ef5f16d1bbff50a9557fdb40389098fc')

prepare() {
    cd "${pkgname}-${_pkgver}"
  
    npm ci --cache "${srcdir}/npm-cache"
}

build() {
    cd "${pkgname}-${_pkgver}"

    npm run build
}

package() {
    cd "${pkgname}-${_pkgver}"

    install -Dm644 "license.txt" -t "${pkgdir}/usr/share/licenses/${pkgname%.*}"
    
    cd "lib"

    install -Dm644 "README.txt" -t "${pkgdir}/usr/share/doc/${pkgname%.*}"
    mv -v "empty-example/" "${pkgdir}/usr/share/${pkgname%.*}"
    find * -type f -regex ".*js.*" | xargs -I {} install -Dm644 {} "$pkgdir/usr/lib/${pkgname%.*}/"{}
}
