# Maintainer: Amro Emad <korialo001 at gmail dot com>

pkgname=p5.js
pkgver=v2.4.0
_pkgver=${pkgver#v}
pkgrel=1
pkgdesc="p5.js is a client-side JS platform that empowers artists, designers, students, and anyone to learn to code and express themselves creatively on the web. It is based on the core principles of Processing. (Full library)"
arch=("any")
url="https://beta.p5js.org"
license=("LGPL-2.1-only")
makedepends=("npm")
source=("https://github.com/processing/p5.js/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('b7a790b7b3dfd382fc7eece2402ba93e1aa6f4624eb7e933547c6c89dc286600')

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
    install -Dm644 ./empty-example/* -t "${pkgdir}/usr/share/${pkgname%.*}"
    find . -type f ! -regex ".*/empty-example/.*" -regex ".*js.*" | xargs -I {} install -Dm644 {} "$pkgdir/usr/lib/${pkgname%.*}/"{}
}
