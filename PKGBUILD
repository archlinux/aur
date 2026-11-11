# Maintainer: Rizki Rakasiwi <rizkirr.xyz@gmail.com>
pkgname=muslimtify
pkgver=0.4.5
pkgrel=1
pkgdesc="An Islamic prayer time notification daemon for Linux"
arch=('x86_64' 'aarch64')
url="https://github.com/muslimtify-org/muslimtify"
license=('GPL-3.0-only')
depends=('libnotify' 'curl')
makedepends=('cmake' 'pkgconf')
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('7db3e29989051463a9e43499dc350fe65d5aaf4c9d19e9e2ae437842ed08db9a')

build() {
    cmake -B build -S "$pkgname-$pkgver" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build

    # Ship a user preset so the service auto-enables for each user.
    install -Dm644 /dev/stdin \
        "$pkgdir/usr/lib/systemd/user-preset/90-muslimtify.preset" <<<'enable muslimtify.service'
}
