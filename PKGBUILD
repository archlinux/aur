#
# Please note:
#   Export your keys using export_keys command in
#   trtl-simplewallet before upgrading to version
#   0.3.2 (r135.7fcc6ad).
#   
#   For more information visit:
#       https://github.com/turtlecoin/turtlecoin/releases/tag/v0.3.2
#

pkgname=turtlecoin-git
pkgver=r135.7fcc6ad
pkgrel=1
pkgdesc="Turtlecoin simplewallet and miner"
arch=('x86_64')
url="https://turtlecoin.lol"
license=('LGPLv3')
install="${pkgname}.install"
makedepends=('git' 'cmake')
depends=('boost-libs' 'boost')
conflicts=('turtlecoin-bin')
source=('git+https://github.com/turtlecoin/turtlecoin.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/turtlecoin"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
    cd "$srcdir/turtlecoin"
    mkdir -p build/release
    cd build/release
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_C_FLAGS="-fassociative-math" -DCMAKE_CXX_FLAGS="-fassociative-math" ../..
    make
}

package() {
    install -D -m755 "$srcdir/turtlecoin/build/release/src/connectivity_tool" -T "$pkgdir/usr/bin/trtl-connectivity_tool"
    install -D -m755 "$srcdir/turtlecoin/build/release/src/miner" -T "$pkgdir/usr/bin/trtl-miner"
    install -D -m755 "$srcdir/turtlecoin/build/release/src/simplewallet" -T "$pkgdir/usr/bin/trtl-simplewallet"
    install -D -m755 "$srcdir/turtlecoin/build/release/src/TurtleCoind" -t "$pkgdir/usr/bin/"
    install -D -m755 "$srcdir/turtlecoin/build/release/src/walletd" -T "$pkgdir/usr/bin/trtl-walletd"
}
