pkgname=shashchess
pkgver=22
pkgrel=1
pkgdesc="A try to implement Alexander Shashin's theory on a Stockfish's derived chess engine"
arch=('x86_64' 'i686' 'armv7h')
url="https://github.com/amchess/ShashChess"
license=('GPL3')
depends=('glibc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/amchess/ShashChess/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('6236b8e93e65eacbe2983391414e16a597f15a24e7f72ba3bf72ac95fb3e2565dbcb0829d9a5de584f9d26fb5c1c822e7fcd24079cf94f0b53ccadd2308d1d92')

build() {
    cd "ShashChess-${pkgver}/src/All"

    sed -i 's/-lws2_32//' Makefile

    if test "$CARCH" == "armv7h"; then
        _arch=armv7
    elif [[ "$CARCH" == "aarch64" ]]; then
        _arch=armv8
    elif [[ "$CARCH" == "i686" ]]; then
        _arch=x86-32
    elif grep -wq bmi2 /proc/cpuinfo; then
        _arch=x86-64-bmi2
    elif grep -w popcnt /proc/cpuinfo | grep -wqv cr8_legacy; then
        _arch=x86-64-modern
    else
        _arch=x86-64
    fi

    make build ARCH="$_arch" COMP=gcc
}

package() {
    cd "ShashChess-${pkgver}/src/All"
    # ./makeAll.sh
    make PREFIX="$pkgdir/usr" install
}
