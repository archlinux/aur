# Maintainer: Julian Y. Richard Corbet (julian-corbet on GitHub)
pkgname=cksk
pkgver=0.1.11
pkgrel=1
pkgdesc="Server-monitor boards for a clck kiosk display"
arch=('x86_64')
# !lto: ureq pulls rustls/ring C+asm objects; under makepkg's global lto option
# those objects mislink (undefined ring_core_* symbols) -- same class as cfetch's
# sqlite3 case. The crate's own release profile already sets opt-level.
options=('!lto')
url="https://github.com/corbet-labs/cksk"
license=('LicenseRef-FSL-1.1-ALv2')
depends=()
makedepends=('cargo')
provides=('cksk')
conflicts=('cksk-bin')
replaces=('nixwatch-bin' 'nixwatch')
# NOTE: crates.io, not GitHub: github.com serves every corbet-labs URL with 404s
# (org-wide flag, 2026-09-14). Revisit a git source once anonymous serving works again.
source=("https://static.crates.io/crates/cksk/cksk-$pkgver.crate")
sha256sums=('599a1a28dbf34f1180cad7cdb10ef8aa51f705debcaa72a06a4d07e40990f31f')

build() {
    cd "cksk-$pkgver"
    cargo build --release --frozen --bin cksk
}

package() {
    cd "cksk-$pkgver"
    install -Dm755 "target/release/cksk" "$pkgdir/usr/bin/cksk"
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
