# Maintainer: jojii <jojii@gmx.net>
pkgname=earbuds
_gitname=LiveBudsCli
pkgver=0.1.2
pkgrel=1
pkgdesc="Control your galaxy buds live via cli"
url="https://github.com/JojiiOfficial/LiveBudsCli"
license=("GPL3")
source=("git+$url#tag=v$pkgver")
md5sums=("SKIP")
arch=("x86_64")
makedepends=("cargo" "git" "bluez" "bluez-libs" "gcc-libs" "glibc")

pkgver() {
    cd $_gitname
    ( set -o pipefail
        (git describe --abbrev=0 --tags || echo "$pkgver") | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' || # Try to use latest tag
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"                  # use git revision
    )
}

build() {
    cd $_gitname
    cargo build --release
}

package() {
    cd $_gitname
    usrdir="$pkgdir/usr"
    mkdir -p $usrdir
    install -Dm 755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm 755 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

