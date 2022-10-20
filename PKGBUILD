# Maintainer: Bao Trinh <qubidt@gmail.com>

_pkgname=btsdu
pkgname=${_pkgname}-git
pkgver=r7.a9e131c
pkgrel=1
pkgdesc="Btrfs Snapshot Disk Usage Analyzer"
arch=("x86_64")
url="https://github.com/rkapl/btsdu"
provides=("${_pkgname}")
conflicts=("${_pkgname}")
license=('GPL2')
makedepends=('cargo' 'git')
optdepends=('ncdu: display results')
source=("$pkgname::git+https://github.com/rkapl/btsdu")
sha512sums=('SKIP')

pkgver() {
    cd "$pkgname"
    {
        git describe --long 2>/dev/null ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    } | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$pkgname"
    cargo build --release --all-features --target-dir=target
}

check() {
    cd "$pkgname"
    cargo test --release --locked --target-dir=target
}

package() {
    cd "$pkgname"
    install -Dm755 "target/release/${_pkgname}" -t "${pkgdir}/usr/bin"
}
