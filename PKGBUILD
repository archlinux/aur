# Maintainer: Walter C <bitlord@disroot.org>
# Contributor: Wesley Moore <wes@wezm.net>

pkgname="pastel-git"
_pkgname="pastel"
pkgver=r310.282f462
pkgrel=1
pkgdesc="A command-line tool to generate, analyze, convert and manipulate colors"
arch=("i686" "x86_64" "arm" "aarch64")
url="https://github.com/sharkdp/pastel"
license=("MIT" "Apache")
depends=()
makedepends=("rust" "cargo" "git")
provides=("pastel")
conflicts=("pastel")
source=("$_pkgname::git+https://github.com/sharkdp/pastel.git")
sha384sums=("SKIP")

pkgver() {
    cd "$_pkgname"
    ( set -o pipefail
        git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
    cd $_pkgname
    export SHELL_COMPLETIONS_DIR="$PWD/completions"
    cargo build --release --locked
}
    
check() {
    cd $_pkgname
    cargo test --release --locked
}

package() {
    cd "$srcdir/$_pkgname"
    install -Dm755 target/release/$_pkgname "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 completions/_pastel \
    "$pkgdir/usr/share/zsh/site-functions/_pastel"
    install -Dm644 completions/pastel.bash \
    "$pkgdir/usr/share/bash-completion/completions/pastel"
    install -Dm644 completions/pastel.fish \
    "$pkgdir/usr/share/fish/vendor_completions.d/pastel.fish"
    for license in APACHE MIT
        do install -Dm644 "LICENSE-$license" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE-$license"
    done
}
