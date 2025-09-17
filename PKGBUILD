# Maintainer: Jeremy Cantrell <jmcantrell at gmail dot com>

pkgname=btrfs-snapshots
pkgver=0.10.2
pkgrel=2
pkgdesc="Manage timestamped collections of btrfs snapshots"
arch=('any')
url="https://github.com/jmcantrell/$pkgname"
license=('MIT')
depends=('btrfs-progs')
makedepends=('scdoc')
checkdepends=('parallel' 'diffutils')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2fa012ed34f118932468d9da31f3a46e87d9c5f47efc46adfbe964e3f574a6f7')

check() {
    cd "$srcdir/$pkgname-$pkgver" || return
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
    cd "$srcdir/$pkgname-$pkgver" || return
    ./scripts/build
}

package() {
    cd "$srcdir/$pkgname-$pkgver" || return
    DEST_DIR=$pkgdir PREFIX=/usr ./scripts/install
}
