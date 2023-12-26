# Maintainer: Aria Moradi <aria.moradi007 at gmail dot com>
# Maintainer: taotieren <admin@taotieren.com>
# Contributor: Sasasu <lizhaolong0123@gmail.com>

pkgname=hex2bin-git
pkgver=1.9.r0.g20430e8
pkgrel=1
pkgdesc="Hex to binary converter."
arch=(aarch64
	riscv64
	x86_64)
url="https://github.com/Keidan/hex2bin"
license=('GPL3')
replaces=('hex2bin')
depends=()
makedepends=(git
	cmake
	ninja)
checkdepends=(python)
source=("$pkgname::git+${url}.git")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    ( set -o pipefail
        git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

build() {
	cd "$srcdir/$pkgname"
    cmake -DDISTRIBUTION==release \
        -DDEFSTART=0 \
        -DDEFLIMIT=0 \
        -B build \
        -G Ninja

    ninja -C build
}

check() {
	cd "$srcdir/$pkgname"
    python test.py --file bin/hex2bin --extra
}

package() {
    install -Dm0755 "$srcdir/$pkgname/bin/hex2bin" -t "$pkgdir/usr/bin/"
}
