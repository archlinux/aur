# Maintainer: Jeremy Cantrell <jmcantrell at gmail dot com>

pkgname=pathbomb
pkgver=0.2.0
pkgrel=1
pkgdesc="Deploy files to known locations using predefined methods"
arch=('any')
url="https://git.sr.ht/~jmcantrell/$pkgname"
license=('MIT')
optdepends=(
    'rsync: copy method'
    'stow: symlink method'
    'gettext: template method'
    'age: decrypt method'
)
makedepends=('scdoc')
checkdepends=('parallel' 'diffutils')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c2c8fcf84cbb5f9815d127c4efd9344088bf3d733fcf1db89ec72c7473b1b6e6')

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
