# Maintainer: notliad <dailton.rcf@gmail.com>
pkgname=mutui
pkgver=0.5.3
pkgrel=1
pkgdesc="Lightweight terminal-based music player for YouTube and local libraries"
url="https://github.com/notliad/mutui"
arch=('x86_64' 'aarch64')
license=('MIT' 'LGPL-2.1-only')
depends=('mpv' 'yt-dlp')
makedepends=('cargo')
options=(!lto)
# Run `makepkg -g` after updating pkgver to regenerate the real checksum.
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('c0be5bf60bba6c076bfb2b85bb97a93f2c4cdd52fa2d432303acb389397a2964')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --bin mutui --bin mutuid
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm0755 "target/release/mutui"  "$pkgdir/usr/bin/mutui"
    install -Dm0755 "target/release/mutuid" "$pkgdir/usr/bin/mutuid"

    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm0644 LICENSE.LGPL-2.1 \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE.LGPL-2.1"
    install -Dm0644 THIRD-PARTY-LICENSES.txt \
        "$pkgdir/usr/share/licenses/$pkgname/THIRD-PARTY-LICENSES.txt"
}
