# Maintainer: 5unekku <jimmy.bungalo8@gmail.com>

pkgname=lice-git
_pkgname=lice
pkgver=r8.c7df858
pkgrel=1
pkgdesc="inject a license file into your git repo"
arch=('x86_64')
url="https://gitlab.com/5unekku/lice"
license=('GPL-3.0-only')
depends=()
makedepends=('git' 'rust')
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$pkgname"
    # ring compiles .S files via cc; -flto=auto produces IR-only objects that drop
    # assembly symbols at link time — fat LTO objects include both IR and real code
    export CFLAGS+=" -ffat-lto-objects"
    export CXXFLAGS+=" -ffat-lto-objects"
    cargo build --release --locked
}

package() {
    cd "$pkgname"
    install -Dm755 target/release/lice "$pkgdir/usr/bin/lice"
}
