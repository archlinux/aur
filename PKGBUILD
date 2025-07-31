# Maintainer: rsp4jack <rsp4jack+aur<at>outlook.com>
pkgname=kwin-zones-git
pkgver=0.1.r46.2b60a89
pkgrel=1
pkgdesc="Experimental implementation of ext-zones Wayland protocol for KWin"
arch=('x86_64')
url="https://invent.kde.org/apol/kwin-zones"
license=('CC0-1.0')
depends=(gcc-libs glibc kconfig kwin qt6-base qt6-wayland wayland wayland-protocols)
optdepends=(freetype2 fontconfig libglvnd vulkan-headers)
makedepends=('cmake' 'pkgconf' 'extra-cmake-modules' 'git')
provides=('kwin-zones')
source=("$pkgname::git+$url.git" "0001-Adapt-e016690b.patch")
sha256sums=('SKIP' '3d3fa05d57e0933087afd3994433fa55f9e690b161e7d70e8cae04e7e904fcd6')

pkgver() {
    cd "$srcdir/$pkgname"
    printf "0.1.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd "$srcdir/$pkgname"
    patch -p1 < "$srcdir/0001-Adapt-e016690b.patch"
}

build() {
    cd "$srcdir/$pkgname"
    cmake -B build -W no-dev -D CMAKE_BUILD_TYPE=None -D CMAKE_INSTALL_PREFIX=/usr
    cmake --build build -j
}

package() {
    cd "$srcdir/$pkgname"
    DESTDIR="$pkgdir" cmake --install build
}
