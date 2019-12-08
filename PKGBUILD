# Maintainer: Andreas Schulz <andi.schulz@me.com>

pkgname=qtcreator-plugin-minimap-git
pkgver=r19.5c6f1e9
pkgrel=1
pkgdesc="Minimap for Qt Creator."
arch=('x86_64')
url="https://github.com/Longhanks/qtcreator-plugin-minimap"
license=('LGPL')
depends=('qtcreator')
makedepends=('git' 'qtcreator-src')
source=("$pkgname"::git+https://github.com/Longhanks/qtcreator-plugin-minimap.git)
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    mkdir -p build
}

build() {        
    cd build

    cmake "$srcdir/$pkgname" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DQTCREATOR_SRC="/usr/src/qtcreator" \
        -DQTCREATOR_BIN="/usr/bin/qtcreator"
        
    make
}

package() {
    cd build

    make DESTDIR="$pkgdir/" install

    install -D -m644 "$srcdir"/$pkgname/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
