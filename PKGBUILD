# Maintainer: Nakidai <plaza521 at inbox dot ru>
pkgname=nomi-git
pkgdesc="Minecraft launcher powered by Rust"
url="https://github.com/Umatriz/nomi"
license=("GPL-3.0-or-later")

pkgver=0.1.2.fixed.r55.g19ac2df
pkgrel=1

arch=("x86_64")
options=(!lto)
depends=("glibc" "gcc-libs" "bzip2")
makedepends=("git" "cargo")

source=(
    "$pkgname::git+https://github.com/Umatriz/nomi.git#branch=main"
)
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$pkgname"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname"
    cargo build --frozen --release --all-targets
}

package() {
    install -Dm755 "$pkgname/target/release/client" "$pkgdir/usr/bin/nomi"
}
