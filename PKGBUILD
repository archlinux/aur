# Maintainer: Dyredhead <danielyentin@gmail.com>

pkgname="sapm-git"
_pkgname="sapm"
pkgver="1.0.0"
pkgrel=6
pkgdesc="A System Agnostic Package Manager (SAPM) which provides basic but useful functionality"
arch=("x86_64")
url="https://github.com/Dyredhead/sapm"
license=("MIT")
depends=(gcc-libs glibc)
makedepends=("git" "cargo")
provides=("$_pkgname")
conflicts=("$_pkgname" "${_pkgname}-bin")
source=("git+https://github.com/Dyredhead/${_pkgname}.git")
sha256sums=("SKIP")

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cd "$srcdir/$_pkgname"
    
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd "$srcdir/$_pkgname"

    cargo build --release --all-features --frozen
    ./target/release/man 
    ./target/release/completions
}

check() {
    export RUSTUP_TOOLCHAIN=stable
    cd "$_pkgname"
    
    cargo test --all-features --frozen
}

package() {
    cd "$srcdir/$_pkgname"

    install -Dm755 "./target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"

    # install -Dm644 "./data/$_pkgname.conf" "$pkgdir/etc/$_pkgname/$_pkgname.conf"
    install -d "$pkgdir/etc/$_pkgname/package_managers/"

    # install -Dm644 "./data/$_pkgname.conf" "$pkgdir/usr/share/$_pkgname/"
    install -Dm644 "./data/template.json" "$pkgdir/usr/share/$_pkgname/template.json"

    install -d "$pkgdir/usr/share/$_pkgname/package_managers/"
    cp -a "./data/package_managers/"* "$pkgdir/usr/share/$_pkgname/package_managers/"
    
    install -d "$pkgdir/usr/share/man/man1/"
    cp -a "./data/man/"*".1" "$pkgdir/usr/share/man/man1/"

    install -Dm644 "./data/completions/$_pkgname.bash"  "$pkgdir/usr/share/bash-completion/completions/$_pkgname.bash"
    install -Dm644 "./data/completions/$_pkgname.fish"  "$pkgdir/usr/share/fish/vendor_completions.d/$_pkgname.fish"
    install -Dm644 "./data/completions/_$_pkgname"      "$pkgdir/usr/share/zsh/site-functions/_$_pkgname"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
