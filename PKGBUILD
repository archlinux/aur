# Maintainer: networkjanitor <networkjanitor@xyooz.net>
pkgname=raidgrep-git
_pkgname=raidgrep
pkgver=1.1.0.r7.g013776c
pkgrel=1
pkgdesc="Guild Wars 2/arcdps evtc log searching tool. Built[sic] from master branch using the rust nightly toolchain."
arch=("x86_64")
url="https://gitlab.com/dunj3/raidgrep"
license=("GPL")
provides=("${_pkgname}")
conflicts=("${_pkgname}-bin" "${_pkgname}")
makedepends=('cargo' 'rustup' 'asciidoc')
depends=("gcc-libs")
source=(
    "${_pkgname}::git+https://gitlab.com/dunj3/raidgrep.git#branch=master"
)
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${_pkgname}"
    cargo +nightly build --release --locked
    a2x -f manpage "${_pkgname}.1.asciidoc"
}

check() {
    cd "${_pkgname}"
    cargo +nightly test --release --locked
}

package() {
    cd "${_pkgname}"
    install -Dm 755 "target/release/raidgrep" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm 644 "${_pkgname}.1" "${pkgdir}/usr/share/man/man1/${_pkgname}.1"
}

