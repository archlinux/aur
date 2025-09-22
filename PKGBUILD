# Maintainer: Adam Wood <woodadam272@gmail.com>
pkgname=yume-2kki-launcher-git
_pkgname=${pkgname%-*}
pkgver=1.2.0
pkgrel=1
pkgdesc="Launcher, installer, and updater for Yume 2kki"
arch=('x86_64')
url="https://gitlab.com/Z-ixel/yume-2kki-launcher"
license=('GPL-3.0-or-later')
depends=('gtk4' 'gtkmm-4.0' 'curl' 'gumbo-parser' 'sqlite'
         'libarchive' 'libgit2' 'libadwaita' 'glibmm-2.68'
         'glib2' 'libsigc++-3.0' 'hicolor-icon-theme' 'jsoncpp')
makedepends=('git' 'cmake' 'ninja' 'gcc')
checkdepends=('catch2')
optdepends=('easyrpg-player: preferred way to launch Yume 2kki'
            '7zip: faster decompression of .7z files')
source=("git+$url.git")
sha256sums=('SKIP')

prepare() {
    rm -rf aur_build
}


build() {
    cd $_pkgname/GTK
    glib-compile-resources --target=resources.c --generate-source yume2kkilauncher.gresource.xml
    cd ../..
    cmake -S $_pkgname -B  aur_build -G Ninja \
        -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr \
        -DUNIT_TESTS=OFF -Wno-dev
    cmake --build aur_build
}


package() {
    DESTDIR="$pkgdir" cmake --install aur_build
}
