# Maintainer: bziemons <ben@rs485.network>
pkgname=ulwgl-git
pkgver=0.1.RC3.215.gb299c67
pkgrel=2
pkgdesc="Unified launcher for Windows games on Linux in progress using Steam Runtime Tools, independent of Steam."
license=('GPL-3.0-only')
arch=('any')
url="https://github.com/Open-Wine-Components/ULWGL-launcher"
depends=(python curl zenity)
optdepends=('zenity: graphical status & progress dialogs')
makedepends=(git make meson ninja gcc scdoc)
provides=(ulwgl)
conflicts=(ulwgl)
install=ulwgl-git.install
source=('git+https://github.com/Open-Wine-Components/ULWGL-launcher.git')
sha512sums=('SKIP')

prepare() {
    cd "ULWGL-launcher"
    git submodule update --init
}

pkgver() {
    cd "ULWGL-launcher"
    printf "%s" $(git describe HEAD | sed 's/-/./g')
}

build() {
    cd "ULWGL-launcher"
    ./configure.sh --prefix=/usr
    make
}

check() {
    cd "ULWGL-launcher/ULWGL"
    export PYTHONDONTWRITEBYTECODE=1
    python ulwgl_test.py
    python ulwgl_test_plugins.py
}

package() {
    cd "ULWGL-launcher"
    make "DESTDIR=${pkgdir}" install
}
