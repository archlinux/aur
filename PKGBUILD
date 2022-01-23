# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="corecrypto"
pkgver=2020
pkgrel=1
pkgdesc="Library implementing Apple low-level cryptographic primitives"
url="https://developer.apple.com/security/"
license=("custom")
arch=("x86_64" "armv7h" "aarch64")
makedepends=("clang" "cmake" "curl" "unzip")
source=("LICENSE")
sha256sums=('SKIP')

build(){
 # get corecrypto.zip from apple website
 # since apple doesn't allow redistribution of the archive, and that a canonical download link would have been too mainstream, i had to use firefox > copy as curl
 # also the server doesn't seem to support byte ranges, so to skip the download we cannot rely on curl
 if [ ! -f "corecrypto.zip" ]; then
  echo "[W8] Downloading corecrypto.zip from Apple (~40MB)"
  curl -s 'https://developer.apple.com/file/?file=security&agree=Yes' \
       -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101 Firefox/91.0' \
       -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8' \
       -H 'Accept-Language: en-US,en;q=0.5' \
       -H 'Accept-Encoding: gzip, deflate, br' \
       -H 'Referer: https://developer.apple.com/security/' \
       -H 'DNT: 1' \
       -H 'Connection: keep-alive' \
       -H 'Cookie: geo=US' \
       -H 'Upgrade-Insecure-Requests: 1' \
       -H 'Sec-Fetch-Dest: document' \
       -H 'Sec-Fetch-Mode: navigate' \
       -H 'Sec-Fetch-Site: same-origin' \
       -H 'Sec-Fetch-User: ?1' \
       -H 'Pragma: no-cache' \
       -H 'Cache-Control: no-cache' \
       -o "corecrypto.zip"
  echo "[OK] Download complete"     
 else
  echo "[OK] Skipping download, corecrypto.zip already exists"
 fi
 unzip -q -o "corecrypto.zip"
 cd "corecrypto"
 # https://wiki.archlinux.org/title/CMake_package_guidelines
 # https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=cpprestsdk
 CC=clang CXX=clang++ cmake -B "build" -S . \
        -DCMAKE_BUILD_TYPE="Release" \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -DCMAKE_INSTALL_LIBDIR="lib" \
        -Wno-dev 
 # avoid errors, as per https://github.com/NyaMisty/AltServer-Linux/ 
 sed '/corecrypto_perf\|corecrypto_test/d' -i "build/CMakeFiles/Makefile2"
 cmake --build "build" -j "$(nproc)"
}

package(){
 cd "corecrypto"
 make -C "build" DESTDIR="$pkgdir" install
 install -D -m 644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/corecrypto/LICENSE"
}

