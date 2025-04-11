# Maintainer: kochan <bifadea02 at disroot dot org>

_pkgname=purrcrypt
pkgname="${_pkgname}-git"
pkgver=r7.116f168
pkgrel=1
pkgdesc="An encryption tool that encodes your secrets as adorable cat and dog sounds"
arch=('x86_64')
url="https://github.com/vxfemboy/$_pkgname"
license=("MIT")
depends=('gcc-libs')
makedepends=('git' 'cargo')
provides=('purr')

source=("git+https://github.com/vxfemboy/$_pkgname.git")
b2sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    ( set -o pipefail
        git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

build() {
    cd "$srcdir/$_pkgname"
    cargo build --release --all-features
}

check() {
    cd "$srcdir/$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "$srcdir/$_pkgname"
    install -Dm755 "target/release/purr" "$pkgdir/usr/bin/purr"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 README.md purrcrypt-demo.gif -t "$pkgdir/usr/share/doc/$pkgname"
}
