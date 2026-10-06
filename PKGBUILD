# Maintainer: Celti B. <celti@celti.name>

pkgname=pasejo
pkgver=2026.10.4
pkgrel=1
pkgdesc='CLI password manager for teams using age'
url="https://github.com/metio/$pkgname"
license=('0BSD')
makedepends=('cargo')
depends=('glibc' 'libgcc')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
b2sums=('efccce002cf72056a2e51db9d5111625478a123b2f31ef783d0a28c197ef006044118a4d46024a2f82249c6e420c26251127122eb8542f1ab156dc1a2cbab44d')

_srcenv() {
    export CARGO_HOME="$srcdir"
    export CARGO_PROFILE_RELEASE_DEBUG=2
    export CARGO_PROFILE_RELEASE_STRIP=false
    export CARGO_PROFILE_RELEASE_LTO=true
    export CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1
    export CARGO_PROFILE_RELEASE_OPT_LEVEL=3
    export CFLAGS+=' -ffat-lto-objects'
}

prepare() {
    _srcenv
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target host-tuple
}

build() {
    _srcenv
    cd "$pkgname-$pkgver"
    cargo build --frozen --release --all-features
}

check() {
    _srcenv
    cd "$pkgname-$pkgver"
    cargo test --frozen --all-features
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # pasejo uses clap_complete::env, which recommends dynamically sourcing completions.
    # See https://docs.rs/clap_complete/latest/clap_complete/env/index.html for details.
    echo "source <(COMPLETE=bash $pkgname)" > "$pkgname.bash"
    install -Dm0644 "$pkgname.bash" "$pkgdir/usr/share/bash-completion/completions/$pkgname"

    echo "eval (E:COMPLETE=elvish $pkgname | slurp)" > "$pkgname.elv"
    install -Dm0644 -t "$pkgdir/usr/share/elvish/lib/" "$pkgname.elv"

    echo "COMPLETE=fish $pkgname | source" > "$pkgname.fish"
    install -Dm0644 -t "$pkgdir/usr/share/fish/vendor_completions.d/" "$pkgname.fish"

    echo "source <(COMPLETE=zsh $pkgname)" > "$pkgname.zsh"
    install -Dm0644 "$pkgname.zsh" "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
}
