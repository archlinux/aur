# Maintainer: Jojii <Jojii@gmx.net>
pkgname=git-oxide
pkgver=0.4.0
pkgrel=1
pkgdesc="A command-line application for interacting with git repositories"
url="https://github.com/Byron/git-oxide"
license=("MIT OR Apache-2.0")
source=("git+$url#tag=v$pkgver")
md5sums=("SKIP")
arch=("x86_64")
makedepends=("cargo" "git")

pkgver() {
    cd $pkgname
    ( set -o pipefail
        (cat Cargo.toml | grep "version =" | cut -d "\"" -f2 | head -n1) ||                             # Try to parse Cargo.toml
        (git describe --abbrev=0 --tags || echo "$pkgver") | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' || # Try to use latest tag
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"                  # use git revision
    )
}

build() {
    cd $pkgname
    cargo build --release
}

package() {
    cd $pkgname
    usrdir="$pkgdir/usr"
    mkdir -p $usrdir
    install -Dm 755 "target/release/gix" "${pkgdir}/usr/bin/gix"
    install -Dm 755 "target/release/gixp" "${pkgdir}/usr/bin/gixp"
    install -Dm 755 "LICENSE-APACHE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
    install -Dm 755 "LICENSE-MIT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
}

