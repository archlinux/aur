# Maintainer: mb <mb@example.com>
pkgname=swaypwd-git
pkgver=r1.0000000
pkgrel=1
pkgdesc="Print the working directory of the foreground process in the focused Sway window"
arch=(x86_64)
url="https://gitlab.com/bullbytes/swaypwd"
license=(AGPL-3.0-or-later)
depends=(gcc-libs)
makedepends=(git rust)
optdepends=("python: Chromium local-file support")
provides=(swaypwd)
conflicts=(swaypwd swaypwd-bin)
source=("$pkgname::git+https://gitlab.com/bullbytes/swaypwd.git")
b2sums=(SKIP)

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd "$pkgname"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname"
    cargo build --release --locked --offline
}

package() {
    cd "$pkgname"
    install -Dm755 target/release/swaypwd  "$pkgdir/usr/bin/swaypwd"
    install -Dm644 swaypwd.1               "$pkgdir/usr/share/man/man1/swaypwd.1"
    install -Dm644 LICENSE                 "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
