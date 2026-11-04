# Maintainer: Jordon de Hoog <jordon.dehoog@gmail.com>
pkgname=dfdu-git
pkgver=0.5.0
pkgrel=1
pkgdesc="Disk usage browser for the terminal (latest commit)"
arch=('x86_64' 'aarch64')
url="https://github.com/jordond/dfdu"
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cargo' 'git')
provides=('dfdu')
conflicts=('dfdu')
options=('!lto')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release -p dfdu
}

package() {
    cd "$pkgname"
    install -Dm755 target/release/dfdu "$pkgdir/usr/bin/dfdu"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 assets/man/*.1 -t "$pkgdir/usr/share/man/man1"
    install -Dm644 assets/completions/dfdu.bash "$pkgdir/usr/share/bash-completion/completions/dfdu"
    install -Dm644 assets/completions/_dfdu "$pkgdir/usr/share/zsh/site-functions/_dfdu"
    install -Dm644 assets/completions/dfdu.fish "$pkgdir/usr/share/fish/vendor_completions.d/dfdu.fish"
}
