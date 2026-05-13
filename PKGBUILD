# Maintainer: Jeremy Cantrell <jmcantrell at gmail dot com>

pkgname=btrfs-snapshots
pkgver=0.13.0
pkgrel=1
pkgdesc="Manage timestamped collections of btrfs snapshots"
arch=('any')
url="https://github.com/jmcantrell/$pkgname"
license=('MIT')
depends=('btrfs-progs')
makedepends=('scdoc')
checkdepends=('parallel' 'diffutils')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('04b577f97b9804754c3ac5b0077fecaf8040baa10e7ab30eb3a9d42b9ba470e2')

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
    done < <(find -- "$srcdir/$pkgname-$pkgver" -type f)
}

build() {
    cd "$srcdir/$pkgname-$pkgver" || return
    ./scripts/build
}

package() {
    cd "$srcdir/$pkgname-$pkgver" || return
    DESTDIR=$pkgdir PREFIX=/usr ./scripts/install
}
