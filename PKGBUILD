# Maintainer: Jeremy Cantrell <jmcantrell at gmail dot com>

pkgname=btrfs-snapshots
pkgver=0.8.2
pkgrel=1
pkgdesc="Manage timestamped collections of btrfs snapshots"
arch=('any')
url="https://github.com/jmcantrell/$pkgname"
license=('MIT')
depends=('btrfs-progs')
makedepends=('scdoc')
checkdepends=('parallel' 'diffutils')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('cabd689244b5c9a4cf7e6b7372b79be9db923de98e998b615ed98e9ab4393757')

check() {
    cd "$srcdir/$pkgname-$pkgver"
    ./scripts/test
}

prepare() {
    local file
    while read -r file; do
        sed -i "1s:#\!.*/env \(.*\)$:#\!/usr/bin/\1:" "$file" # use explicit shebang
        sed -i "\:/usr/local/etc:s:/usr/local::g" "$file"     # use system etc
        sed -i "\:/usr/local:s:/usr/local:/usr:g" "$file"     # use system prefix
    done < <(find "$srcdir/$pkgname-$pkgver" -type f)
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    ./scripts/build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    DEST_DIR=$pkgdir PREFIX=/usr ./scripts/install
}
