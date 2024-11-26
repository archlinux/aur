# Maintainer: MeaTLoTioN <ml@erb.pw>
pkgname=syncterm-src
pkgver=latest
pkgrel=1
pkgdesc="SyncTERM - A terminal for connecting to BBSes"
arch=('x86_64')
url="https://syncterm.bbsdev.net/"
license=('GPL')
depends=('ncurses' 'glibc')
makedepends=('git' 'gcc' 'make')
source=("get-syncterm.sh::https://erb.pw/get-syncterm.sh")
sha256sums=('fe8fff71e078ca5b9a4c6fac9006d7a7821a8dc1399deecb7e1fd92a644c1674')

build() {
    cd "$srcdir"

    # Stop the script from installing as we need to do it the PKGBUILD way
    sed -i '/^sudo make install/,$d' get-syncterm.sh
    sed -i "s#/tmp/get-syncterm#$srcdir/get-syncterm#g" get-syncterm.sh

    # Run the script to fetch and build the source
    bash get-syncterm.sh
}

package() {
    cd "$srcdir"

    # Find the newly built binary
    binary_file="$(find $srcdir -name syncterm|tail -1)"
    binary_file="$(echo "$binary_file"|sed 's|^\./||')"

    # Install the newly built binary
    install -Dm755 "${binary_file}" "$pkgdir/usr/bin/syncterm"
}
