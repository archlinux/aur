# Maintainer: Nico <d3sox at protonmail dot com>

pkgname=kwin-effects-better-blur-dx
pkgver=2.0.0
pkgrel=1
pkgdesc="KWin Better Blur DX effect fork with window class force blur feature (Wayland & X11)"
arch=(x86_64)
url="https://github.com/xarblu/kwin-effects-better-blur-dx"
license=(GPL-3.0-or-later)
depends=(kio knotifications kcrash kglobalaccel kcmutils libepoxy)
optdepends=("kwin-x11: for X11" "kwin: for Wayland")
conflicts=("kwin-effects-forceblur")
replaces=("kwin-effects-forceblur")
makedepends=(extra-cmake-modules qt6-tools kwin kwin-x11)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
install="$pkgname.install"
sha256sums=('d9e66be7e6d1ca6f575e3f3383bc721096b47eb95c7f01b901446d862ffa5784')

build() {
    local _cmake_args=(-DCMAKE_INSTALL_PREFIX=/usr)
    local _srcdir="$pkgname-$pkgver"

    # X11 and Wayland have to be built separately
    cmake "${_cmake_args[@]}" -DBETTERBLUR_X11=OFF -B build_wayland -S "$_srcdir"
    cmake "${_cmake_args[@]}" -DBETTERBLUR_X11=ON -B build_x11 -S "$_srcdir"

    make -C build_wayland
    make -C build_x11
}

package() {
    make -C build_wayland DESTDIR="${pkgdir}" PREFIX=/usr install
    make -C build_x11 DESTDIR="${pkgdir}" PREFIX=/usr install
}

