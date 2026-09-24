# Maintainer: Ateles
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=upmd-git
pkgver=r83.g8f7c8de
pkgrel=3
pkgdesc="Run tasks and workflows from Markdown"
arch=("x86_64")
url="https://github.com/rezigned/upmd"
license=("MIT")
depends=("gcc-libs")
makedepends=("cargo" "git")
provides=("upmd")
conflicts=("upmd")
source=("$pkgname::git+https://github.com/rezigned/upmd.git")
sha256sums=("SKIP")
options=(!lto)

pkgver() {
    cd "$srcdir/$pkgname" || exit 1
    printf 'r%s.g%s\n' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$pkgname" || exit 1
    cargo build --release --config 'profile.release.opt-level="z"' --config 'profile.release.lto=true' --config 'profile.release.codegen-units=1' --config 'profile.release.panic="abort"'
}

package() {
    cd "$srcdir/$pkgname" || exit 1
    install -Dm755 "target/release/upmd" "$pkgdir/usr/bin/upmd"
    install -Dm644 "LICENSE"             "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "README.md"           "$pkgdir/usr/share/doc/$pkgname/README.md"
}
