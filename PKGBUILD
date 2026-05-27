# Maintainer: Rizki Rakasiwi <rizkirr.xyz@gmail.com>
pkgname=muslimtify
pkgver=0.2.3
pkgrel=2
pkgdesc="An Islamic prayer time notification daemon for Linux"
arch=('x86_64')
url="https://github.com/rizukirr/muslimtify"
license=('MIT')
depends=('libnotify' 'curl')
makedepends=('cmake' 'pkgconf')
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('98cfb87e96cf3ba98f379d5230c441c0345625679b6441966cf7c5d3974675bd')

prepare() {
    # Upstream service file points at /usr/local/bin; package installs to /usr/bin.
    sed -i 's|/usr/local/bin/muslimtify|/usr/bin/muslimtify|' \
        "$pkgname-$pkgver/systemd/muslimtify.service"
}

build() {
    cmake -B build -S "$pkgname-$pkgver" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build

    # Ship a user preset so the timer auto-enables for each user.
    install -Dm644 /dev/stdin \
        "$pkgdir/usr/lib/systemd/user-preset/90-muslimtify.preset" <<<'enable muslimtify.timer'
}
