# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=chewing-editor-git
pkgver=0.1.1.r30.g637be39
pkgrel=1
pkgdesc="Cross platform chewing user phrase editor"
arch=('i686' 'x86_64')
url="http://chewing.im"
license=('GPL')
depends=('libchewing' 'qt5-base' 'hicolor-icon-theme')
makedepends=('git' 'cmake' 'qt5-tools' 'help2man')
source=("git+https://github.com/chewing/chewing-editor.git"
         qtchooser-notfound.patch)
sha256sums=('SKIP'
            'aea1b4df5654394aa41aac08048d5d60a0b5bd735eb4ed246b219ded9ea62fd2')


pkgver() {
    cd "chewing-editor"

    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "chewing-editor"

    patch -Np1 -i "../qtchooser-notfound.patch"
    mkdir -p "build"
}

build() {
    cd "chewing-editor/build"

    cmake ../ -DCMAKE_INSTALL_PREFIX="/usr"
    make
}

check() {
    cd "chewing-editor/build"

    ./run-test
}

package() {
    cd "chewing-editor/build"

    make DESTDIR="$pkgdir" install
    install -Dm644 "../COPYING" "$pkgdir/usr/share/licenses/chewing-editor/COPYING"
}
