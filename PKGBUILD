# Maintainer: Jordan Day < jordanday444 at gmail dot com >

pkgname=snestracker-git
pkgver=0.0.r967.b384741b
pkgrel=2
pkgdesc="SNES Tracker aims to become a full-featured cross-platform music production software for the Super Nintendo Entertainment System (SNES), aka the Super Famicom."
arch=('x86_64')
url="https://github.com/bazz1tv/snestracker"
license=('GPL3')
makedepends=('git' 'cmake')
depends=('sdl2' 'boost' 'imagemagick' 'alsa-lib' 'gtk3')
source=("$pkgname::git+https://github.com/bazz1tv/snestracker"
        sortFix.patch
        gtk3.patch)
sha256sums=('SKIP'
            '3925ceec0599253071ee2e92f62ab6831d05e2f045a232a1fbf4130ccdf29ee8'
            '1cf91315ca23f83c9cebb65a316dbb5568ebd9e69780e1fbbe3825224d1efd19')
options=(!makeflags !buildflags)

pkgver() {
    cd $pkgname
    printf "0.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd $srcdir/$pkgname

    patch -p1 -i "${srcdir}"/sortFix.patch
    patch -p1 -i "${srcdir}"/gtk3.patch

    ./build-submodules.sh
    make
}

package() {
    cd $srcdir/$pkgname

    mkdir -p "${pkgdir}/usr/bin/snestracker_data"
    cp -r pc/bin/* "${pkgdir}/usr/bin/snestracker_data"
    ln -s "/usr/bin/snestracker_data/snestracker" "${pkgdir}/usr/bin/snestracker"
}

