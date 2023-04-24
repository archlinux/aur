# Maintainer: Jeremy Cantrell <jmcantrell at gmail dot com>

pkgname=btrfs-snapshots
pkgver=0.8.1
pkgrel=1
pkgdesc="Manage timestamped collections of btrfs snapshots"
arch=('any')
url="https://git.sr.ht/~jmcantrell/$pkgname"
license=('GPL3')
depends=('btrfs-progs')
makedepends=('scdoc')
checkdepends=('parallel' 'diffutils')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a22a09d4bee89294361adc3b6f4d68a6f4bc7a3659fdcc6207bde43f0405c18e')

check() {
    cd "$srcdir/$pkgname-refs/tags/v$pkgver"
    ./scripts/test
}

prepare() {
    local file
    while read -r file; do
        sed -i "1s:#\!.*/env \(.*\)$:#\!/usr/bin/\1:" "$file" # use explicit shebang
        sed -i "\:/usr/local/etc:s:/usr/local::g" "$file"     # use system etc
        sed -i "\:/usr/local:s:/usr/local:/usr:g" "$file"     # use system prefix
    done < <(find "$srcdir/$pkgname-refs/tags/v$pkgver" -type f)
}

build() {
    cd "$srcdir/$pkgname-refs/tags/v$pkgver"
    ./scripts/build
}

package() {
    cd "$srcdir/$pkgname-refs/tags/v$pkgver"
    DESTDIR=$pkgdir PREFIX=/usr ./scripts/install
}
