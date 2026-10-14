# Maintainer: 5unekku <swagalicious@awesomsauce.net>
_pkgname="lice"
pkgname="${_pkgname}-git"
pkgver=r22.0d19cdb
pkgrel=1
pkgdesc="inject a license file into your git repo"
arch=('any')
url="https://gitlab.com/5unekku/lice"
license=('GPL-3.0-only')
depends=()
makedepends=('git' 'rust')
source=("$pkgname::git+${url}.git")
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
    # a user or system cargo config may relocate the target dir; pin it so package() finds the binary
    export CARGO_TARGET_DIR=target
    cargo build --release --locked
}

package() {
    cd "$pkgname"
    install -Dm755 "target/release/lice" "$pkgdir/usr/bin/lice"
}
