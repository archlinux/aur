# Maintainer: Nico <d3sox at protonmail dot com>

pkgname=kwin-effects-forceblur-git
pkgver=r452.89c263b
pkgrel=3
pkgdesc="KWin Better Blur DX effect fork with window class force blur feature (Wayland & X11)"
arch=(x86_64)
url="https://github.com/xarblu/kwin-effects-better-blur-dx"
license=(GPL-3.0-or-later)
depends=(kio knotifications kcrash kglobalaccel kcmutils libepoxy)
optdepends=("kwin-x11: for X11" "kwin: for Wayland")
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
makedepends=(git extra-cmake-modules qt6-tools kwin kwin-x11)
source=("$pkgname::git+${url}.git")
install="$pkgname.install"
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"

  # Get the version number.
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    local _cmake_args=(-DCMAKE_INSTALL_PREFIX=/usr)

    # X11 and Wayland have to be bult separately
    cmake "${_cmake_args[@]}" -DBETTERBLUR_X11=OFF -B build_wayland -S "$pkgname"
    cmake "${_cmake_args[@]}" -DBETTERBLUR_X11=ON -B build_x11 -S "$pkgname"

    make -C build_wayland
    make -C build_x11
}

package() {
    make -C build_wayland DESTDIR="${pkgdir}" PREFIX=/usr install
    make -C build_x11 DESTDIR="${pkgdir}" PREFIX=/usr install
}

