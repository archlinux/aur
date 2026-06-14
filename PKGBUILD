pkgname=revc-encoder-git
pkgver=0.2.0.r93.gee865ee
pkgrel=1
pkgdesc="Rust EVC (MPEG-5) encoder/decoder"
arch=('x86_64')
url="https://github.com/revcx/revc.git"
license=('MIT')
depends=()
makedepends=('git' 'rust' 'cargo')
source=(
    "git+https://github.com/revcx/revc.git"
    "revc.patch"
)
sha256sums=(
    'SKIP'
    '19473672871409428dc080890f703e19ba737c4b0e7815059f9361ee3a0eb2f2'
)

pkgver() {
    cd "$srcdir/revc"
    git describe --long --tags --always | sed 's/^v//; s/-/.r/; s/-/./'
}

prepare() {
    cd "$srcdir/revc"
    pwd && ls
    ls src/bin/io/demuxer/y4m.rs
    patch -p0 < "$srcdir/revc.patch"
}

build() {
    cd "$srcdir/revc"
    cargo build --release
}

package() {
    cd "$srcdir/revc"

    # Binaries
    install -Dm755 "target/release/revce" "$pkgdir/usr/bin/revce"
    install -Dm755 "target/release/revcd" "$pkgdir/usr/bin/revcd"

    # Library
    install -Dm644 "target/release/librevc.rlib" \
        "$pkgdir/usr/lib/librevc.rlib"
}
