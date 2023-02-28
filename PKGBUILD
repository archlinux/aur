# Maintainer: Jeremy Cantrell <jmcantrell at gmail dot com>

pkgname=btrfs-snapshots
pkgver=0.7.1
pkgrel=1
pkgdesc="Manage timestamped collections of btrfs snapshots"
arch=('any')
url="https://git.sr.ht/~jmcantrell/$pkgname"
license=('GPL3')
depends=('btrfs-progs')
checkdepends=('parallel' 'diffutils')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2d971e988d6e96c35427f448d470ac94ebdb9155185d18e1f46f227f5c8bf9ba')

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

package() {
    cd "$srcdir/$pkgname-$pkgver"
    DESTDIR=$pkgdir PREFIX=/usr ./scripts/install
}
