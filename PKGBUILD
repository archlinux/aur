# Maintainer: Nguyen Phi <nguyenphidt at gmail dot com>
#
# Kept in https://github.com/ngosen/ngosen/tree/main/packaging/aur; its release workflow fills in
# sha256sums and pushes it here. Send changes there.

pkgname=fcitx5-ngosen
# Ngó Sen numbers its own releases from 0.5.0; the epoch keeps them above the 3.5.10 builds.
epoch=1
pkgver=1.14.1
pkgrel=1
_tag=ngosen-$pkgver-$pkgrel
pkgdesc="Ngó Sen, a Vietnamese input method for fcitx5"
arch=('x86_64')
url="https://github.com/ngosen/ngosen"
license=('GPL-3.0-or-later')
depends=('fcitx5' 'fcitx5-configtool' 'fcitx5-gtk' 'fcitx5-qt' 'hicolor-icon-theme'
         'glibc' 'libstdc++' 'libgcc' 'libxcb' 'python-qtpy' 'python-pyqt6' 'python-dbus' 'qt6-svg')
optdepends=('python-gobject: settings window in GTK, opened on GNOME, Cinnamon and Xfce'
            'libadwaita: settings window in GTK, opened on GNOME, Cinnamon and Xfce')
makedepends=('cmake' 'extra-cmake-modules' 'rust' 'librsvg')
options=('!debug')
install=fcitx5-ngosen.install
source=("$_tag.tar.gz::$url/archive/refs/tags/$_tag.tar.gz")
sha256sums=('690f8b4477038857cae251e79e6a384ddb526bd57065eedbb2b88df57ac1d7c4')

build() {
    cmake -S "ngosen-$_tag" -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=/usr/lib \
        -DBUILD_TESTING=ON
    cmake --build build
}

check() {
    ctest --test-dir build --output-on-failure -j"$(nproc)"
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
