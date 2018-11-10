# Maintainer: Mattéo Delabre <bonjour@matteodelabre.me>

pkgname=sfgui
pkgver=0.4.0
pkgrel=2
pkgdesc="Graphical user interface (GUI) library for programs that use SFML for rendering"
arch=(x86_64)
url="https://github.com/TankOs/SFGUI"
license=("ZLIB")
makedepends=("cmake")
depends=("sfml")
source=("https://github.com/TankOs/${pkgname^^}/archive/$pkgver.tar.gz")
sha256sums=("2dfe95a2ecfed12ab2d4c591fbf6b10d16bbdedec2530545b4c2140ab01c05dc")

build() {
    mkdir -p build
    cd build

    cmake -DCMAKE_INSTALL_PREFIX=/usr \
          -DCMAKE_BUILD_TYPE=RelWithDebugInfo \
          "../${pkgname^^}-$pkgver"
    make
}

package() {
    cd build
    make DESTDIR="$pkgdir/" install

    # fix case mismatch issue on library name
    mv $pkgdir/usr/lib/lib{${pkgname^^},${pkgname}}.so

    cd "../${pkgname^^}-$pkgver"
    install -Dm644 LICENSE.md $pkgdir/usr/share/licenses/$pkgname/LICENSE.md
    install -Dm644 FONT.LICENSE.md $pkgdir/usr/share/licenses/$pkgname/FONT.LICENSE.md

    cmakever=$(cmake --version | head -n1 | cut -d' ' -f 3 | cut -d'.' -f1,2)
    install -Dm644 cmake/Modules/FindSFML.cmake $pkgdir/usr/share/cmake-$cmakever/Modules/FindSFML.cmake
    install -Dm644 cmake/Modules/FindSFGUI.cmake $pkgdir/usr/share/cmake-$cmakever/Modules/FindSFGUI.cmake
}
