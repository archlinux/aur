# Maintainer: Jisu-Woniu <jswn@jswn9945.xyz>
_pkgname=typstyle
pkgname=$_pkgname-git
pkgver=0.14.0.r0.48d4010
pkgrel=1
pkgdesc="Beautiful and reliable typst code formatter"
arch=("aarch64" "armv7h" "x86_64")
url="https://github.com/typstyle-rs/typstyle"
license=("Apache-2.0")
depends=("gcc-libs" "glibc")
makedepends=("git" "cargo" "libgit2")
optdepends=("typst: For typst compilation")
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    printf "%s" "$(git describe --long | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
    cd "$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --no-default-features --features=git-info,completion

    mkdir -p completions

    for shell in bash zsh fish; do
        target/release/$_pkgname completions $shell >completions/$_pkgname-completion.$shell
    done
}

# check() {
#     cd "$_pkgname"
#     export RUSTUP_TOOLCHAIN=stable

#     cargo test --frozen --no-default-features --features=git-info,completion
# }

package() {
    install -Dm755 "$_pkgname/target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"

    install -Dm644 "$_pkgname/completions/$_pkgname-completion.bash" "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
    install -Dm644 "$_pkgname/completions/$_pkgname-completion.zsh" "$pkgdir/usr/share/zsh/site-functions/_$_pkgname"
    install -Dm644 "$_pkgname/completions/$_pkgname-completion.fish" "$pkgdir/usr/share/fish/vendor_completions.d/$_pkgname.fish"
}
