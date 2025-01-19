# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="libcorecrypto"
# when apple breaks the checksum, run 
#    curl -s https://developer.apple.com/security/ | grep 'rel="/file/?file=security&agree=Yes"' | cut -d "(" -f2 | cut -d ")" -f1 | grep -o '[0-9]\+'
pkgver=2023
pkgrel=1
pkgdesc="Library implementing Apple low-level cryptographic primitives"
url="https://developer.apple.com/security/"
license=("custom")
arch=("x86_64" "armv7h" "aarch64")
makedepends=("clang" "cmake" "curl" "python")
source=("LICENSE"
        #"corecrypto.zip.b2"
        #"code-coverage.cmake"
        )
b2sums=('571233903371c819e99b2e39f4b32013b37e3c8a618d54ee27d98b0c61bfb50f702780f597e096df9d8e8e4d0ad0a4e3fcaf6949b7035796ecb5be274c1894d0')
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
 if [ -e "corecrypto.zip" ]; then
  echo "  -> Found corecrypto.zip"
 else
  echo "  [KO] Could not find corecrypto.zip"
  exit 1
 fi
 # removing because checksum changes often
 #echo "==> Validating corecrypto.zip with b2sums..."
 #b2sum --check --quiet "corecrypto.zip.b2" || return 1
 #echo "    corecrypto.zip. ... Passed"
 bsdtar --extract --file "corecrypto.zip" || exit
 cd "corecrypto-2023"
 install -d "scripts"
 # missing comment character
 sed 's| Copyright|# Copyright|' -i "CMakeLists.txt"
 # not needed if removing all coverage entries
 #install -D "$srcdir/code-coverage.cmake" "scripts/code-coverage.cmake"
 sed '/coverage/d' -i "CMakeLists.txt"
 # run cmake
 # https://wiki.archlinux.org/title/CMake_package_guidelines
 # https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=cpprestsdk
 CC=clang CXX=clang++ cmake -B "build" -S . \
        -DCMAKE_BUILD_TYPE="Release" \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -DCMAKE_INSTALL_LIBDIR="lib" \
        -Wno-dev
 # avoid errors, as per https://github.com/NyaMisty/AltServer-Linux/ 
 sed '/corecrypto_perf\|corecrypto_test/d' -i "build/CMakeFiles/Makefile2"
 # avoid error, as per https://aur.archlinux.org/packages/libcorecrypto-git
 sed 's|CC_MARK_MEMORY_PUBLIC|//&|' -i "ccrng/src/ccrng_entropy.c"
 # not needed if removing all coverage entries
 # avoid "error: expected expression"
 #sed 's|^;|{};|g' -i "build/gen/corecrypto_test/include/cc_generated_test_vectors.h"
}

build(){
 cd "corecrypto"
 cmake --build "build" -j "$(nproc)"
}

package(){
 cd "corecrypto"
 make -C "build" DESTDIR="$pkgdir" install
 install -D -m 644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/libcorecrypto/LICENSE"
}

