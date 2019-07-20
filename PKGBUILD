# Maintainer: Lubomir 'Kuci' Kucera <kuci24-at-gmail-dot-com>

pkgname=velocity-xbox360-git
pkgver=0.1.0.0.r1256.2c15bb6
pkgrel=1
pkgdesc="A cross-platform application built using the Qt framework which allows you to browse and edit Xbox 360 files."
arch=('i686' 'x86_64')
url="https://github.com/hetelek/Velocity.git"
license=('GPL3')
depends=('qt4' 'botan1.10')
makedepends=('git')
options=('!makeflags')
source=("$pkgname"::'git://github.com/hetelek/Velocity.git'
        'velocity.desktop'
        'libbotan-version.patch')
sha512sums=('SKIP'
            '1855384f6dd07a86f97da17a538771c51959a800b5951f86dbbdccb7002dd48e611b3bf1f0c5f889f318a48d4c7b4d99e568064bffcebffc6c08aff915bb03ae'
            'b1dd7053f8bca090ac47b47ec04914a960d3282ddcd742872b33ca98b647644ee4812db0a759d6706b521e9dd356ca2483da4eb98c453640b686955787df55f2')

prepare() {
    cd "$srcdir/$pkgname"
    patch -Np1 -i "${srcdir}/libbotan-version.patch"
}

pkgver() {
    cd "$srcdir/$pkgname"
    echo "$(grep 'VERSION =' Velocity/Velocity.pro | cut -d ' ' -f 3).$(printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)")"
}

build() {
    cd "$srcdir/$pkgname"
    make release
}

package() {
    mkdir -p "$pkgdir/opt/velocity/plugins"
    install -Dm755 "$srcdir/$pkgname/Velocity/Velocity" "$pkgdir/opt/velocity/velocity"
    install -Dm644 "$srcdir/$pkgname/Velocity/Images/Leaner.png" "$pkgdir/usr/share/pixmaps/velocity.png"
    mkdir -p "$pkgdir/usr/bin"
    ln -s /opt/velocity/velocity "$pkgdir/usr/bin/velocity"
    install -Dm644 "$srcdir/velocity.desktop" "$pkgdir/usr/share/applications/velocity.desktop"
}
