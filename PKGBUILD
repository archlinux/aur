# Maintainer: jojii <jojii@gmx.net>
pkgname=rsv
pkgver=1.1.0
pkgrel=1
pkgdesc="The runit sv command rewritten in rust with additional features"
url="https://github.com/JojiiOfficial/rsv"
license=("GPL-3.0")
source=("git+$url#tag=v$pkgver")
md5sums=("SKIP")
arch=("x86_64")
makedepends=("cargo")
provides=("rsv")

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
    install -Dm 755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

