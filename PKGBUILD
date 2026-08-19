pkgname=revc-encoder-git
pkgver=0.2.0.r93.gee865ee
pkgrel=1
pkgdesc="Rust EVC (MPEG-5) encoder/decoder"
arch=('x86_64')
url="https://github.com/revcx/revc"
license=('MIT')
depends=()
makedepends=('git' 'rust' 'cargo')
source=(
    "git+$url.git"
    "revc.patch"
)
sha256sums=(
    'SKIP'
    '19473672871409428dc080890f703e19ba737c4b0e7815059f9361ee3a0eb2f2'
)

pkgver() {
  cd "$srcdir/revc"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/v//g'
}

prepare() {
    cd "$srcdir/revc"
    patch -p0 < "$srcdir/revc.patch"
}

build() {
    cd "$srcdir/revc"

    export RUSTFLAGS="\
        -C opt-level=3 \
        -C target-cpu=native \
        -C embed-bitcode=yes \
        -C codegen-units=1 \
        -C strip=symbols \
        -C relocation-model=pic \
        -C link-arg=-fuse-ld=lld \
        -C link-arg=-Wl,--icf=safe \
        -C link-arg=-Wl,--gc-sections \
        -C link-arg=-Wl,--as-needed \
        -C link-arg=-Wl,-O3 \
    "
    cargo build --release
}

package() {
    cd "$srcdir/revc"

    # Binaries
    install -Dm755 "target/release/revce" "$pkgdir/usr/bin/revce"
    install -Dm755 "target/release/revcd" "$pkgdir/usr/bin/revcd"
}
