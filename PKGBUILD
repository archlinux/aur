# Maintainer: rsp4jack <rsp4jack+aur<at>outlook.com>
pkgname=kwin-zones-git
pkgver=0.1.r49.e449735
pkgrel=1
pkgdesc="Experimental implementation of ext-zones Wayland protocol for KWin"
arch=('x86_64')
url="https://invent.kde.org/automotive/kwin-zones"
license=('CC0-1.0')
depends=(gcc-libs glibc kconfig kwin qt6-base qt6-wayland wayland wayland-protocols)
optdepends=(freetype2 fontconfig libglvnd vulkan-headers)
makedepends=('cmake' 'pkgconf' 'extra-cmake-modules' 'git')
provides=('kwin-zones')
source=("$pkgname::git+$url.git" "0001-Squash-Merge-2.patch" "0002-Fix-Wayland-detection.patch" "0003-Adapt-e016690b.patch")
sha256sums=('SKIP'
            '36d3c7abf0ba2aa417344561cb3cdaf404e456de8ca3cb57efabd496a8a9a8b1'
            '0b12d8fb41ce50e253217ea3568cf6e8da3c6f0b93d4cd6da34e317fd14d861a'
            '2f60eb04e6eb01b0d73c0a524d986818049ad86d52f4b4435df57dcdb4167fb7')

pkgver() {
    cd "$srcdir/$pkgname"
    printf "0.1.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd "$srcdir/$pkgname"
    git apply "$srcdir/0001-Squash-Merge-2.patch"
    git apply "$srcdir/0002-Fix-Wayland-detection.patch"
    git apply "$srcdir/0003-Adapt-e016690b.patch"
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
