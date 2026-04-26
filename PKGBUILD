# Maintainer: Louis Nelson Jr. <https://lousclues.com>
pkgname=vigil-baseline
pkgver=1.6.0
pkgrel=1
pkgdesc="Linux file integrity monitor with BLAKE3 hashing and HMAC-chained audit trail"
arch=('x86_64')
url="https://github.com/lousclues-labs/vigil"
license=('GPL-3.0-only')
depends=('gcc-libs' 'glibc')
makedepends=('rust')
provides=('vigil')
conflicts=('vigil')
options=(!lto)
install=vigil-baseline.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/lousclues-labs/vigil/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

prepare() {
    cd "vigil-$pkgver"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "vigil-$pkgver"
    cargo build --frozen --release
}

check() {
    cd "vigil-$pkgver"
    # Unit tests only — integration tests require filesystem/inotify privileges
    cargo test --frozen --release --lib
}

package() {
    cd "vigil-$pkgver"

    # Binaries
    install -Dm755 target/release/vigil "$pkgdir/usr/bin/vigil"
    install -Dm755 target/release/vigild "$pkgdir/usr/bin/vigild"

    # systemd units
    install -Dm644 systemd/vigild.service "$pkgdir/usr/lib/systemd/system/vigild.service"
    install -Dm644 systemd/vigil-scan.service "$pkgdir/usr/lib/systemd/system/vigil-scan.service"
    install -Dm644 systemd/vigil-scan.timer "$pkgdir/usr/lib/systemd/system/vigil-scan.timer"

    # Documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/doc/$pkgname/LICENSE"
    install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
    install -Dm644 config/vigil.toml "$pkgdir/usr/share/doc/$pkgname/vigil.toml.example"

    # Additional docs
    install -dm755 "$pkgdir/usr/share/doc/$pkgname/docs"
    install -m644 docs/*.md "$pkgdir/usr/share/doc/$pkgname/docs/"
}
