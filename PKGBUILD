# Maintainer: Nguyen Phi <nguyenphidt at gmail dot com>
#
# Kept in https://github.com/ngosen/ibus-ngosen/tree/main/packaging/aur; its release workflow fills in
# sha256sums and pushes it here. Send changes there.

pkgname=ibus-ngosen
pkgver=1.6.0
pkgrel=1
pkgdesc="Ngó Sen, a Vietnamese input method for IBus"
arch=('x86_64')
url="https://github.com/ngosen/ibus-ngosen"
license=('GPL-3.0-or-later' 'LGPL-2.1-or-later' 'MIT' 'GPL-2.0-or-later')
depends=('ibus' 'python' 'python-gobject' 'gtk4' 'libadwaita' 'hicolor-icon-theme'
         'glibc' 'gcc-libs' 'libxcb' 'wayland')
makedepends=('cmake' 'rust')
# Both install the forward-keys extension of the same name.
conflicts=('fcitx5-ngosen')
options=('!debug')
# The release tarball, unlike the tag archive, carries the ngosen submodule.
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/releases/download/$pkgname-$pkgver-$pkgrel/$pkgname-$pkgver.tar.gz")
sha256sums=('7c0401de720c059ae88319956454636b6193b4093da7580397c0b39be79d3ce3')

build() {
    cmake -S "$pkgname-$pkgver" -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBEXECDIR=lib/ibus \
        -DNGOSEN_IBUS_DAEMON_TESTS=OFF
    cmake --build build
}

check() {
    ctest --test-dir build --output-on-failure -j"$(nproc)"
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    # bamboo-core, built into the engine, is the MIT part.
    install -Dm644 "$pkgname-$pkgver/ngosen/bamboo-rs/vendor/bamboo-core/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE.bamboo-core"
}
