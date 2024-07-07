# Maintainer: Dyredhead <danielyentin@gmail.com>

pkgname="sapm-git"
_pkgname="sapm"
pkgver="1.0.0"
pkgrel=1
pkgdesc="A System Agnostic Package Manager (SAPM) which provides basic but useful functionality"
arch=("any")
url="https://github.com/Dyredhead/sapm"
license=("MIT")
makedepends=("git" "cargo")
provides=("$_pkgname")
conflicts=("$_pkgname" "${_pkgname}-bin")
source=("git+https://github.com/Dyredhead/${_pkgname}.git")
sha256sums=("SKIP")

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cd "$_pkgname"
    cargo build --release --all-features
    ./target/release/man 
    ./target/release/completions
}

check() {
    export RUSTUP_TOOLCHAIN=stable

    cd "$_pkgname"
    cargo test --all-features
}

package() {
    cd "$_pkgname"

    install -Dm755 "./target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"

    mkdir -p "$pkgdir/etc/$_pkgname/"
    cp -a "./data/config/"* "$pkgdir/etc/$_pkgname/"

    mkdir -p $pkgdir/usr/share/$_pkgname/
    install -Dm644 "./data/local/template.json" "$pkgdir/usr/share/$_pkgname/"
    
    mkdir -p "$pkgdir/usr/share/man/man1/"
    cp -a "./data/local/man/"*".1" "$pkgdir/usr/share/man/man1/"

    install -Dm644 "./data/local/completions/$_pkgname.bash" "$pkgdir/usr/share/bash-completion/completions/$_pkgname.bash"
    install -Dm644 "./data/local/completions/$_pkgname.fish" "$pkgdir/usr/share/fish/vendor_completions/$_pkgname.fish"
    install -Dm644 "./data/local/completions/_$_pkgname" "$pkgdir/usr/share/zsh/site-functions/_$_pkgname"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
