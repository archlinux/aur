# Maintainer: Jeremy Cantrell <jmcantrell at gmail dot com>

pkgname=btrfs-snapshots
pkgver=0.8.3
pkgrel=1
pkgdesc="Manage timestamped collections of btrfs snapshots"
arch=('any')
url="https://git.sr.ht/~jmcantrell/$pkgname"
license=('MIT')
depends=('btrfs-progs')
makedepends=('scdoc')
checkdepends=('parallel' 'diffutils')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4c4183b469dd384b8e2c115545c3f2ed65f23645407d6c66835181516cb26c47')

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
    DEST_DIR=$pkgdir PREFIX=/usr ./scripts/install
}
