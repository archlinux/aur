# Maintainer: Rizki Rakasiwi <rizkirr.xyz@gmail.com>
pkgname=muslimtify
pkgver=0.3.1
pkgrel=1
pkgdesc="An Islamic prayer time notification daemon for Linux"
arch=('x86_64' 'aarch64')
url="https://github.com/rizukirr/muslimtify"
license=('MIT')
depends=('libnotify' 'curl')
makedepends=('cmake' 'pkgconf')
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('0a4b7a7114dfa9c9f7e8632ab68f17eb17138b81390ba5c63f06e39d87d5c322')

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
