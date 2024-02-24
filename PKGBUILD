# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="libcorecrypto"
# curl -s https://developer.apple.com/security/ | grep 'rel="/file/?file=security&agree=Yes"' | cut -d "(" -f2 | cut -d ")" -f1 | grep -o '[0-9]\+'
pkgver=2022
pkgrel=2
pkgdesc="Library implementing Apple low-level cryptographic primitives"
url="https://developer.apple.com/security/"
license=("custom")
arch=("x86_64" "armv7h" "aarch64")
makedepends=("clang" "cmake" "curl" "python")
source=("LICENSE"
        "corecrypto.zip.b2"
        "code-coverage.cmake")
b2sums=('571233903371c819e99b2e39f4b32013b37e3c8a618d54ee27d98b0c61bfb50f702780f597e096df9d8e8e4d0ad0a4e3fcaf6949b7035796ecb5be274c1894d0'
        '97e9b6d5e586bdd53ed81db49af3da6dee10ca3e2007f2043555eaebab8aa6136d5679b1f4c30132bdbb87f869c3f27b7283a24bad0c6b610c04be8f13930a2b'
        'd934a8493da900214c10781bfdf58e6a4c776ac15030ba8ab6b4ab51ab505acffc4eb9050482471f347e2efae1118824aa52d32af2fc6bcad67475ab4e0d2cd2')
provides=("libcorecrypto")
conflicts=("libcorecrypto-git")

prepare(){
 # get corecrypto.zip from apple website
 # since apple doesn't allow redistribution of the archive, and that a canonical download link would have been too mainstream, i had to use firefox > copy as curl
 # also the server doesn't seem to support byte ranges, so to skip the download we cannot rely on curl
 echo "==> Retrieving corecrypto.zip from Apple (~40MB)..."
 if [ ! -f "corecrypto.zip" ]; then
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
 fi
 echo "  -> Found corecrypto.zip"
 echo "==> Validating corecrypto.zip with b2sums..."
 b2sum --check --quiet "corecrypto.zip.b2" || return 1
 echo "    corecrypto.zip. ... Passed"
 bsdtar --extract --file "corecrypto.zip"
}

build(){
 cd "corecrypto"
 install -d "scripts"
 install -D "$srcdir/code-coverage.cmake" "scripts/code-coverage.cmake"
 # https://wiki.archlinux.org/title/CMake_package_guidelines
 # https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=cpprestsdk
 CC=clang CXX=clang++ cmake -B "build" -S . \
        -DCMAKE_BUILD_TYPE="Release" \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -DCMAKE_INSTALL_LIBDIR="lib" \
        -Wno-dev \
 # avoid errors, as per https://github.com/NyaMisty/AltServer-Linux/ 
 sed '/corecrypto_perf\|corecrypto_test/d' -i "build/CMakeFiles/Makefile2"
 cmake --build "build" -j "$(nproc)"
}

package(){
 cd "corecrypto"
 make -C "build" DESTDIR="$pkgdir" install
 install -D -m 644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/libcorecrypto/LICENSE"
}

