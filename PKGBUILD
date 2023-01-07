# Maintainer: Lubomir 'Kuci' Kucera <kuci24-at-gmail-dot-com>
# Maintainer: Bakasura <bakasura-at-protonmail-dot-ch>

pkgname=velocity-xbox360-git
pkgver=0.1.0.0.r1256.2c15bb6
pkgrel=4
pkgdesc="A cross-platform application built using the Qt framework which allows you to browse and edit Xbox 360 files."
arch=('i686' 'x86_64')
url="https://github.com/hetelek/Velocity.git"
license=('GPL3')
depends=('qt5-base' 'botan1.10')
makedepends=('git')
options=('!makeflags')
source=("${pkgname}::git+${url}"
        'velocity.desktop'
        'qt5.patch')
sha512sums=('SKIP'
            '1855384f6dd07a86f97da17a538771c51959a800b5951f86dbbdccb7002dd48e611b3bf1f0c5f889f318a48d4c7b4d99e568064bffcebffc6c08aff915bb03ae'
            'e49c46fe98829bc382a27f8c2cbcf10f594d87902bbd4be0b4063a8b9d506de34d98119e23fc9c4e595bb16314308fc5d08038e69e1d5d3cb20dcbf7caffa29d')

prepare() {
    cd "$srcdir/$pkgname"
    patch -Np1 -i "${srcdir}/qt5.patch"
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
