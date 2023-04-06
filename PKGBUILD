# Maintainer: Curve <curve.platin at gmail dot com>

pkgname="libcorecrypto-git"
pkgdesc="Library implementing Apple low-level cryptographic primitives"
pkgver=2021
pkgrel=1
url="https://developer.apple.com/security/"
license=("custom")
arch=("x86_64" "armv7h" "aarch64")
makedepends=("clang" "cmake" "curl" "unzip")
source=("LICENSE")
sha256sums=("ffaf28b090b70d896fad024204eb0a84d0fb4d2f32c9861b9ba7f78bc50120e7")
provides=("libcorecrypto")
conflicts=("libcorecrypto")

pkgver() {
    curl -s https://developer.apple.com/security/ | grep 'rel="/file/?file=security&agree=Yes"' | cut -d "(" -f2 | cut -d ")" -f1 | grep -o '[0-9]\+'
}

build(){
  curl -s 'https://developer.apple.com/file/?file=security&agree=Yes' \
       -H 'Referer: https://developer.apple.com/security/' \
       -H 'Accept-Encoding: gzip, deflate, br' \
       -o "corecrypto.zip"

 unzip -q -o "corecrypto.zip"
 cd "corecrypto"

 sed '/coverage/d' -i "CMakeLists.txt"

 CC=clang CXX=clang++ cmake -B "build" -S . \
        -DCMAKE_BUILD_TYPE="Release" \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -DCMAKE_INSTALL_LIBDIR="lib" \
        -Wno-dev 

 # https://github.com/NyaMisty/AltServer-Linux/ 
 sed '/corecrypto_perf\|corecrypto_test/d' -i "build/CMakeFiles/Makefile2"

 cmake --build "build" -j "$(nproc)"
}

package(){
 cd "corecrypto"
 make -C "build" DESTDIR="$pkgdir" install
 install -D -m 644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/libcorecrypto/LICENSE"
}

