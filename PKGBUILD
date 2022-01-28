# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="libcorecrypto"
pkgver=2020
pkgrel=2
pkgdesc="Library implementing Apple low-level cryptographic primitives"
url="https://developer.apple.com/security/"
license=("custom")
arch=("x86_64" "armv7h" "aarch64")
makedepends=("clang" "cmake" "curl" "unzip")
source=("LICENSE"
        "corecrypto.zip.sha256")
sha256sums=('ffaf28b090b70d896fad024204eb0a84d0fb4d2f32c9861b9ba7f78bc50120e7'
            '217dfea4bda798c67c7b293d03493d3dfd0c6ccd258b00b379d2dbcdd6fb8d3e')

build(){
 # get corecrypto.zip from apple website
 # since apple doesn't allow redistribution of the archive, and that a canonical download link would have been too mainstream, i had to use firefox > copy as curl
 # also the server doesn't seem to support byte ranges, so to skip the download we cannot rely on curl
 if [ -f "corecrypto.zip" ] && sha256sum --check --quiet "corecrypto.zip.sha256"; then
  echo "[OK] Skipping download, corecrypto.zip already exists"
 else
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
 fi
 echo "[W8] Checking hash"
 sha256sum --check --quiet "corecrypto.zip.sha256" || return 1
 echo "[OK] Hash matches"
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
 install -D -m 644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/libcorecrypto/LICENSE"
}

