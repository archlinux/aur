pkgname=turtlecoin-git
pkgver=r2232.a7df2cf3
pkgrel=1
pkgdesc="TurtleCoin daemon, CLI wallet, RPC interface, and solo miner"
arch=('x86_64')
url="https://turtlecoin.lol"
license=('GPLv3')
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
    mkdir -p build
    cd build
    cmake ..
    make
}

package() {
    # Rename some executables so we don't conflict with other coins
    install -D -m755 "$srcdir/turtlecoin/build/src/miner" -T "$pkgdir/usr/bin/trtl-miner"
    install -D -m755 "$srcdir/turtlecoin/build/src/TurtleCoind" -t "$pkgdir/usr/bin/"
    install -D -m755 "$srcdir/turtlecoin/build/src/zedwallet" -T "$pkgdir/usr/bin/trtl-zedwallet"
    install -D -m755 "$srcdir/turtlecoin/build/src/wallet-api" -T "$pkgdir/usr/bin/trtl-wallet-api"
}
