pkgname=turtlecoin-git
pkgver=r110.1913ba5
pkgrel=1
pkgdesc="Turtlecoin simplewallet and miner"
arch=('x86_64')
url="https://turtlecoin.lol"
license=('custom')
install="${pkgname}.install"
makedepends=('git' 'cmake')
depends=('boost-libs' 'boost')
source=('git+https://github.com/turtlecoin/turtlecoin.git' '0001-Various-fixes-for-building-with-gcc-7.2.1.patch')
sha256sums=('SKIP' 'dd9a54526e68bf40460f7ae341cd1ae5e5d841efe0ec1935b40714863c6598ca')

pkgver() {
  cd "$srcdir/turtlecoin"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare()
{
    cd "$srcdir/turtlecoin"
    git apply ../../0001-Various-fixes-for-building-with-gcc-7.2.1.patch
}

build() {
    cd "$srcdir/turtlecoin"
    mkdir -p build/release
    cd build/release
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_C_FLAGS="-fassociative-math" -DCMAKE_CXX_FLAGS="-fassociative-math" ../..
    make
}

package() {
    install -D -m755 "$srcdir/turtlecoin/build/release/src/connectivity_tool" -T "$pkgdir/usr/bin/TC-connectivity_tool"
    install -D -m755 "$srcdir/turtlecoin/build/release/src/miner" -T "$pkgdir/usr/bin/TC-miner"
    install -D -m755 "$srcdir/turtlecoin/build/release/src/simplewallet" -T "$pkgdir/usr/bin/TC-simplewallet"
    install -D -m755 "$srcdir/turtlecoin/build/release/src/TurtleCoind" -t "$pkgdir/usr/bin/"
    install -D -m755 "$srcdir/turtlecoin/build/release/src/walletd" -T "$pkgdir/usr/bin/TC-walletd"
}
