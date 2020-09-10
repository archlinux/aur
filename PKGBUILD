# Maintainer: Alexander Lyon <arlyon@me.com>
pkgname=instantly
pkgver=0.1.0
pkgrel=2
pkgdesc="Download instagram photos instantly"
url="https://github.com/arlyon/instantly"
license=("MIT")
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
    install -Dm 755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm 755 "license" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}

