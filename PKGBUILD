# Maintainer: Victor Roest <victor at xirion dot net>
# Co-Maintainer: Jonathan Dönszelmann <jonabent at gmail dot com>
pkgname=roll-rs-git
_pkgname=roll-rs
pkgver=r11.e6bf4c3
pkgrel=1
pkgdesc="A rust dice rolling application using the standard dice notation"
arch=('x86_64')
url="https://github.com/finitum/roll-rs"
license=('EUPL-1.2')
conflicts=('dice-roller-git')
provides=('roll-rs')

makedepends=("cargo")
source=("git+https://github.com/finitum/roll-rs")
sha512sums=('SKIP')

build () {
    cd "${_pkgname}"
	cargo build --release --locked --all-features --target-dir=target
}

check () {
    cd "${_pkgname}"
	cargo test --release --locked --target-dir=target
}

pkgver () {
    cd "${_pkgname}"
    ( set -o pipefail
      git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

package() {
    cd "${_pkgname}"
	install -Dm 755 "target/release/roll" -t "${pkgdir}/usr/bin/"
}

