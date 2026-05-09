# Maintainer: Adam Wood <woodadam272 at gmail dot com>
pkgname=yume-2kki-launcher-git
_pkgname=${pkgname%-*}
pkgver=2.1.1r333.df703df
pkgrel=1
pkgdesc="Launcher, installer, and updater for Yume 2kki"
arch=('x86_64')
url="https://gitlab.com/Z-ixel/yume-2kki-launcher"
license=('GPL-3.0-or-later')
depends=('gtk4' 'curl' 'gumbo-parser' 'sqlite'
         'libarchive' 'libgit2' 'libadwaita'
         'glib2' 'hicolor-icon-theme' 'jsoncpp')
makedepends=('git' 'cmake' 'ninja' 'gcc' 'peel')
optdepends=('easyrpg-player: preferred way to launch Yume 2kki'
            '7zip: faster decompression of .7z files')
provides=("yume-2kki-launcher=${pkgver}")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  printf "2.1.1r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


prepare() {
    rm -rf $_pkgname/aur_build
}


build() {
    cmake -S $_pkgname -B  $_pkgname/aur_build -G Ninja \
        -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr \
        -DUNIT_TESTS=OFF -Wno-dev
    cmake --build $_pkgname/aur_build
}


package() {
    DESTDIR="$pkgdir" cmake --install $_pkgname/aur_build
}
