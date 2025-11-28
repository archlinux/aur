# Maintainer: Nico <d3sox at protonmail dot com>

pkgname=kwin-effects-forceblur-git
pkgver=r441.a97689a
pkgrel=2
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

    # On Wayland, disable the X11 plugin, which currently fails to build
    if [[ ${XDG_SESSION_TYPE} == wayland ]]; then
        _cmake_args+=(-DBETTERBLUR_X11=OFF)
    fi

    cmake "${_cmake_args[@]}" -B build -S "$pkgname"
    make -C build
}

package() {
    make -C build DESTDIR="${pkgdir}" PREFIX=/usr install
}

