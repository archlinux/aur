# Maintainer: Amy B <axtlos[at]getcryst[dot]al>
pkgname=lapis
pkgver=1.0.0
pkgrel=1
pkgdesc="Flutter GUI to convert arch to crystal"
arch=('any')
url="https://git.tar.black/crystal/programs/lapis"
depends=('gtk3' 'jade')
makedepends=('clang' 'ninja' 'cmake' 'git' 'unzip' 'flutter' 'flutter-group-pacman-hook')

source=("gui::git+${url}.git")
sha256sums=('SKIP')

build() {
    cd ${srcdir}/gui
    flutter config --enable-linux-desktop
    flutter config --no-analytics
    flutter clean
    flutter pub get
    flutter build linux --release --verbose
}

package() {
    mkdir -p ${pkgdir}/opt/lapis/
    install -dm755 ${pkgdir}/opt
    mv ${srcdir}/gui/build/linux/x64/release/bundle ${pkgdir}/opt/lapis/.

    install -dm755 ${pkgdir}/usr/bin
    ln -s /opt/lapis/bundle/lapis ${pkgdir}/usr/bin/lapis

    mkdir -p ${pkgdir}/opt/lapis/scripts/
    mv ${srcdir}/gui/scripts/* ${pkgdir}/opt/lapis/scripts/.
    chmod +x ${pkgdir}/opt/lapis/scripts/*

    mkdir -p ${pkgdir}/usr/share/applications/
    cp ${srcdir}/gui/lapis.desktop ${pkgdir}/usr/share/applications/lapis.desktop

}
