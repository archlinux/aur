# Maintainer: Bridget Williams <bridget6454 at google's email domain ending in dot com>

pkgname=aerofoil-git
pkgver=1.1.2.r76.gf6069e7
pkgrel=5
# the repo makes no mention of what architectures are supported, so i'll just play it safe for now
arch=('x86_64')
pkgdesc='Multiplatform port of Glider PRO, the Macintosh paper airplane game'
url='https://github.com/elasota/Aerofoil'
license=('GPL-2.0')
# i'm probably missing some things here, let me know if that's the case
depends=('sdl2>=2.0.12' 'sdl2_image' 'freetype2>=2.10.1')
makedepends=('cmake>=3.10' 'git')
provides=("aerofoil")
conflicts=("aerofoil")
source=("${pkgname}::git+https://github.com/elasota/Aerofoil.git")
sha512sums=('SKIP')

pkgver() {
    cd ${pkgname}
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/${pkgname}"
    cmake -DCMAKE_INSTALL_PREFIX="/usr" -B build
    cmake --build build
}

package() {
    cd "$srcdir/${pkgname}"
    DESTDIR="$pkgdir/" cmake --install build
    mkdir -p "$pkgdir/usr/share/applications"
    mkdir "$pkgdir/usr/share/pixmaps"
    cp "$srcdir/${pkgname}/Resources/Linux/io.github.elasota.aerofoil.desktop" "$pkgdir/usr/share/applications"
    cp "$srcdir/${pkgname}/Resources/Linux/io.github.elasota.aerofoil.svg" "$pkgdir/usr/share/pixmaps"
}
