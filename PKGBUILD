# Maintainer: Jeremy Cantrell <jmcantrell at gmail dot com>

pkgname=btrfs-snapshots-git
pkgver=0.8.2.r6.63920b2
pkgrel=1
pkgdesc="Manage timestamped collections of btrfs snapshots"
arch=('any')
url="https://github.com/jmcantrell/${pkgname%-git}"
license=('MIT')
depends=('btrfs-progs')
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
