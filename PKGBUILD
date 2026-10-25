# Maintainer: Celti B. <celti@celti.name>

pkgname=pasejo
pkgver=2026.10.25
pkgrel=1
pkgdesc='CLI password manager for teams using age'
url="https://github.com/metio/$pkgname"
license=('0BSD')
makedepends=('cargo')
depends=('glibc' 'libgcc')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
b2sums=('cc2d55df82b40bf25d7304a91f6197a502085f5e87e730d49ccd8fa46f4e427fae61ffb13cdc20616379897b2a36e54c1b2a1c1571d54c01f7957059306811a3')

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
