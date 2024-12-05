# Maintainer: Aria Moradi <aria.moradi007 at gmail dot com>
# Maintainer: taotieren <admin@taotieren.com>
# Contributor: Sasasu <lizhaolong0123@gmail.com>

pkgname=hex2bin-git
pkgver=1.12.r2.g97a58d9
pkgrel=1
pkgdesc="Hex to binary converter."
arch=($CARCH)
url="https://github.com/Keidan/hex2bin"
license=('GPL-3.0-only')
replaces=('hex2bin')
depends=(
    glibc
    gcc-libs)
makedepends=(
    git
    cmake
    ninja
    python)
checkdepends=()
source=("$pkgname::git+${url}.git")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    (
        set -o pipefail
        git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

build() {
    cd "$srcdir/$pkgname"
    cmake -DDISTRIBUTION=release \
        -DCMAKE_BUILD_TYPE=release \
        -DDEFSTART=0 \
        -DDEFLIMIT=0 \
        -B build \
        -G Ninja

    ninja -C build
}

check() {
    cd "$srcdir/$pkgname"
    python test.py -f bin/hex2bin
}

package() {
    install -Dm0755 "$srcdir/$pkgname/bin/hex2bin" -t "$pkgdir/usr/bin/"
}
