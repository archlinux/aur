# Maintainer: mb <mb@example.com>
pkgname=swaycwd-git
pkgver=r1.0000000
pkgrel=1
pkgdesc="Print the working directory of the foreground process in the focused Sway window"
arch=(x86_64)
url="https://gitlab.com/bullbytes/swaycwd-rs"
license=(AGPL3)
depends=()
makedepends=(git rust)
optdepends=("sway: Sway compositor (required at runtime)")
provides=(swaycwd)
conflicts=(swaycwd)
source=("$pkgname::git+https://gitlab.com/bullbytes/swaycwd-rs.git")
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
    install -Dm755 target/release/swaycwd   "$pkgdir/usr/bin/swaycwd"
    install -Dm644 swaycwd.1                "$pkgdir/usr/share/man/man1/swaycwd.1"
    install -Dm644 LICENSE                  "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
