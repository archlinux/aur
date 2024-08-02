# Maintainer: TPHRyan <ryan.paroz@gmail.com>
pkgname=git-ps-rs
pkgver=7.3.1
pkgrel=1
pkgdesc="A patch stack oriented Git wrapper"
arch=('x86_64')
url="https://git-ps.sh"
license=('MIT')
depends=('gcc-libs' 'glibc' 'git' 'gpgme' 'libgpg-error' 'openssl' 'zlib')
makedepends=('rust' 'perl-file-mimeinfo')
source=("https://github.com/drewdeponte/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
md5sums=('372ee2defc12cc8d696645b232e42a20')
sha256sums=('e4d936535c072d88ff91eec4e009149ba2c4694a0fa0785c2563a13fe254bb74')

prepare() {
	cd "$pkgname-$pkgver"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$pkgname-$pkgver"
    export CFLAGS+=" -ffat-lto-objects"
    cargo build --frozen --release
}

check() {
	cd "$pkgname-$pkgver"
	cargo check --frozen --release

    bin_path="target/release/gps"
    if [ ! -e "$bin_path" ]; then
        echo "Binary not found at $bin_path!"
        return 1
    fi
    binary_mimetype="$(mimetype -b "$bin_path")"
    if echo "$binary_mimetype" | grep -qv  'application/x-executable'; then
        echo "$bin_path: MIME type '$binary_mimetype' is invalid!"
        return 1
    fi
}

package() {
	cd "$pkgname-$pkgver"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/git-ps-rs/LICENSE"
    install -Dm755 "target/release/gps" "$pkgdir/usr/bin/gps"
}
