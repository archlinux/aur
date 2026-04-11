# Maintainer: uwuclxdy <https://github.com/uwuclxdy>
pkgname=larpshell-git
pkgver=r72.b614217
pkgrel=1
pkgdesc='Convert natural language to shell commands using an LLM'
arch=('x86_64')
url='https://github.com/uwuclxdy/larpshell'
license=('MIT')
makedepends=('cargo' 'git')
depends=('gcc-libs' 'glibc')
options=('!lto' '!debug')
conflicts=('larpshell')
provides=('larpshell')
source=("$pkgname::git+https://github.com/uwuclxdy/larpshell.git#branch=mommy")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$srcdir/$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm0755 "target/release/larpshell" "$pkgdir/usr/bin/larpshell"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
