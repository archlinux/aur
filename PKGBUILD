# Maintainer: Rizki Rakasiwi <rizkirr.xyz@gmail.com>
pkgname=muslimtify
pkgver=0.4.3
pkgrel=1
pkgdesc="An Islamic prayer time notification daemon for Linux"
arch=('x86_64' 'aarch64')
url="https://github.com/muslimtify-org/muslimtify"
license=('MIT')
depends=('libnotify' 'curl')
makedepends=('cmake' 'pkgconf')
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('379440675272bb6ff04fa24ccbd494757d3e0fcac6ad370814e1b90411f1220e')

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
