# Maintainer: flankmekid <rogamer266@gmail.com>

pkgname=tuichess
pkgver=0.1.0
pkgrel=1
pkgdesc="Terminal chess engine with minimax AI, alpha-beta pruning, and ncurses interface"
arch=('x86_64' 'aarch64')
url="https://github.com/flankmekid/tuichess"
license=('MIT')
depends=('ncurses' 'glibc')
# gcc and make are provided by base-devel, which AUR helpers require
makedepends=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/flankmekid/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
# Run `updpkgsums` to replace SKIP with the real sha256 before submitting
sha256sums=('b7eff1a28df37483ea25a3fdead2b8ff7a2e422743b5a4c0db2b429014e0e269')

prepare() {
    cd "$pkgname-$pkgver"
    sed -i 's/\$(CC) \$(CFLAGS) -o/$(CC) $(CFLAGS) $(LDFLAGS) -o/' Makefile
}

build() {
    cd "$pkgname-$pkgver"
    make CFLAGS="-Wall -Wextra -std=c99 -Isrc -D_XOPEN_SOURCE_EXTENDED=1 -O2" LDFLAGS="-Wl,-z,relro,-z,now"
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 tuichess         "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE          "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md        "$pkgdir/usr/share/doc/$pkgname/README.md"
}
