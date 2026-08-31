# Maintainer: QaidVoid <contact@qaidvoid.dev>
pkgname=soar
pkgver=0.13.3
pkgrel=1
pkgdesc="A fast, modern package manager for Static Binaries, Portable Formats (AppImage|AppBundle|FlatImage|Runimage) & More"
arch=('aarch64' 'x86_64')
url="https://soar.qaidvoid.dev"
license=('MIT')
provides=('soar')
conflicts=('soar' 'soar-bin' 'soar-nightly-bin')
depends=('glibc' 'gcc-libs' 'bzip2' 'xz')
makedepends=('cargo' 'clang')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pkgforge/soar/archive/v$pkgver.tar.gz")
sha256sums=('6cab6e40c7e34a5f461662f030f57e21f9691a9a60f17b824cccd5399678e2bb')
# ring fails to build with lto
options=('!lto')

prepare() {
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 target/release/soar -t "$pkgdir/usr/bin"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 {README.md,CHANGELOG.md} -t "$pkgdir/usr/share/doc/$pkgname"
}
