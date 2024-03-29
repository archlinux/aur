# Maintainer: ldev <ldev dot eu dot org> 
pkgver=r3.3f22126
pkgrel=1

pkgname=git-credential-github-git
pkgdesc="A simple git credentials helper for github"
license=('MIT')
url="https://github.com/Xgames123/git-credential-github"
arch=('any')

binname=git-credential-github
source=("git+$url")
sha256sums=('SKIP')
conflicts=("git-credential-github" "gh-login")
provides=("git-credential-github")
makedepends=(
cargo
)
optdepends=(
xdg-utils
wl-clipboard
xclip
)

pkgver() {
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd "$srcdir/git-credential-github"
    rm -f Cargo.lock
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch
}

build() {
    cd "$srcdir/git-credential-github"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd "$srcdir/git-credential-github"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$binname"
    ln -s "/usr/bin/$binname" "$pkgdir/usr/bin/git-credential-gh-login"
}
