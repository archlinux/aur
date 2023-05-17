# Maintainer: Jeremy Cantrell <jmcantrell at gmail dot com>

pkgname=pathbomb
pkgver=0.1.2
pkgrel=1
pkgdesc="Deploy files to known locations using predefined methods"
arch=('any')
url="https://git.sr.ht/~jmcantrell/$pkgname"
license=('GPL3')
optdepends=(
    'stow: symlink method'
    'age: decrypt method'
)
makedepends=('scdoc')
checkdepends=('parallel' 'diffutils')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('728186d7008f8233df10430465dea7d98280b17084faa2525f669e238a1c1ba0')

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
