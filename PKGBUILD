# Maintainer: Jeremy Cantrell <jmcantrell at gmail dot com>

pkgname=pathbomb
pkgver=0.2.1
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
sha256sums=('be4af35410560c5c62c0d61df3a4531c13d040c1f7b77771a36f33466439f949')

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
