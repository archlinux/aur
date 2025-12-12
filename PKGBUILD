# Maintainer: Nico <d3sox at protonmail dot com>

pkgname=kwin-effects-better-blur-dx-git
_reponame=${pkgname%-git}
pkgver=1.5.0
pkgrel=1
pkgdesc="KWin Better Blur DX effect fork with window class force blur feature (Wayland & X11)"
arch=(x86_64)
url="https://github.com/xarblu/$_reponame"
license=(GPL-3.0-or-later)
depends=(kio knotifications kcrash kglobalaccel kcmutils libepoxy)
optdepends=("kwin-x11: for X11" "kwin: for Wayland")
replaces=("kwin-effects-forceblur")
makedepends=(git extra-cmake-modules qt6-tools kwin kwin-x11)
source=("$_reponame-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
install="$pkgname.install"
sha256sums=('d5558cd419c8d46bdc958064cb97f963d1ea793866414c025906ec15033512ed')

build() {
    local _cmake_args=(-DCMAKE_INSTALL_PREFIX=/usr)

    # On Wayland, disable the X11 plugin, which currently fails to build
    if [[ ${XDG_SESSION_TYPE} == wayland ]]; then
        _cmake_args+=(-DBETTERBLUR_X11=OFF)
    fi

    cmake "${_cmake_args[@]}" -B build -S "$_reponame-$pkgver"
    make -C build
}

package() {
    make -C build DESTDIR="${pkgdir}" PREFIX=/usr install
}

