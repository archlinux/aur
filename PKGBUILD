# Maintainer: Jeremy Cantrell <jmcantrell at gmail dot com>

pkgname=pathbomb-git
pkgver=0.1.2.r0.0ef5691
pkgrel=1
pkgdesc="Deploy files to known locations using predefined methods"
arch=('any')
url="https://git.sr.ht/~jmcantrell/${pkgname%-git}"
license=('GPL3')
optdepends=(
    'stow: symlink method'
    'age: decrypt method'
)
makedepends=('git' 'scdoc')
checkdepends=('parallel' 'diffutils')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "%s" "$(git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

check() {
    cd "$srcdir/${pkgname%-git}"
    ./scripts/test
}

prepare() {
    cd "$srcdir/${pkgname%-git}"
    local file
    while read -r file; do
        sed -i "1s:#\!.*/env \(.*\)$:#\!/usr/bin/\1:" "$file" # use explicit shebang
        sed -i "\:/usr/local/etc:s:/usr/local::g" "$file"     # use system etc
        sed -i "\:/usr/local:s:/usr/local:/usr:g" "$file"     # use system prefix
    done < <(git ls-files)
}

build() {
    cd "$srcdir/${pkgname%-git}"
    ./scripts/build
}

package() {
    cd "$srcdir/${pkgname%-git}"
    DEST_DIR=$pkgdir PREFIX=/usr ./scripts/install
}
