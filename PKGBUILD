# Maintainer mattf <matheusfillipeag@gmail.com>

pkgname=curl-impersonate-firefox
pkgver=r59.979750a
_gitname=curl-impersonate
pkgrel=1
pkgdesc="A special compilation of curl that makes it impersonate Firefox"
url="https://github.com/lwthiker/curl-impersonate"
license=('MIT')
arch=('x86_64')
makedepends=(git gcc cmake go ninja unzip zlib autoconf automake libtool python mercurial gyp patch)
depends=(brotli nss)
provides=(curl-impersonate-firefox)

NSS_VERSION=nss-3.74
NSS_URL=https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_74_RTM/src/nss-3.74-with-nspr-4.32.tar.gz
NGHTTP2_VERSION=nghttp2-1.46.0
NGHTTP2_URL=https://github.com/nghttp2/nghttp2/releases/download/v1.46.0/nghttp2-1.46.0.tar.bz2
CURL_VERSION=curl-7.81.0
CURL_URL="https://curl.se/download/${CURL_VERSION}.tar.xz"

source=(
  "git+$url"
  "${NSS_VERSION}.tar.gz::${NSS_URL}"
  "${NGHTTP2_VERSION}.tar.bz2::${NGHTTP2_URL}"
  "${CURL_VERSION}.tar.xz::${CURL_URL}"
)

md5sums=('SKIP'
         '75aa40414886d9327a5f4f4bff79bdf5'
         'de2aaa48ae0bf9713da3a9bfc3f1629f'
         '41954fa09f879fccb57d88be23fe8606')

browser_dir=${_gitname}/firefox


pkgver() {
  cd ${_gitname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build_nss () {
  cd ${srcdir}
  cd ${NSS_VERSION}/nss
  ./build.sh -o --disable-tests --static
}

patch_nghttp2 () {
  cd ${srcdir}
  cp ${browser_dir}/patches/libnghttp2-*.patch ${NGHTTP2_VERSION}/
  cd ${NGHTTP2_VERSION}
  for p in $(ls libnghttp2-*.patch); do patch -p1 < $p; done
  autoreconf -i && automake && autoconf
}

build_nghttp2 () {
  cd ${srcdir}
  cd ${NGHTTP2_VERSION}
  ./configure --with-pic --prefix ${srcdir}/${NGHTTP2_VERSION}/build
  make
  make install
}

patch_curl () {
  cd ${srcdir}
  cp ${browser_dir}/patches/curl-*.patch ${CURL_VERSION}/ 
  cd ${CURL_VERSION}
  for p in $(ls curl-*.patch); do patch -p1 < $p; done
  autoreconf -fi
}

build_curl () {
  cd ${srcdir}
  cd ${CURL_VERSION}
  ./configure --with-nss=${srcdir}/${NSS_VERSION}/dist/Release --enable-static --disable-shared --with-nghttp2=${srcdir}/${NGHTTP2_VERSION}/build LIBS="-pthread" CFLAGS="-I${srcdir}/${NSS_VERSION}/dist/public/nss -I${srcdir}/${NSS_VERSION}/dist/Release/include/nspr -I${srcdir}/${NGHTTP2_VERSION}/build" USE_CURL_SSLKEYLOGFILE=true
  make
  mkdir -p out
  cp src/curl out/curl-impersonate
  cp ${srcdir}/${browser_dir}/curl_* out/
  chmod +x out/*
  strip out/curl-impersonate
}

build_libcurl () {
  cd ${srcdir}
  cd ${CURL_VERSION}
  ./configure --with-nss=${srcdir}/${NSS_VERSION}/dist/Release --with-nghttp2=${srcdir}/${NGHTTP2_VERSION}/build LIBS="-pthread" CFLAGS="-I${srcdir}/${NSS_VERSION}/dist/public/nss -I${srcdir}/${NSS_VERSION}/dist/Release/include/nspr -I${srcdir}/${NGHTTP2_VERSION}/build" USE_CURL_SSLKEYLOGFILE=true
  make clean
  make
  ver=$(readlink -f lib/.libs/libcurl.so | sed 's/.*so\.//')
  cp "lib/.libs/libcurl.so.$ver" "out/libcurl-impersonate.so.$ver"
  strip "out/libcurl-impersonate.so.$ver"
}

prepare () {
  patch_nghttp2
  patch_curl
}

build () {
  build_nss
  build_nghttp2
  build_curl
  build_libcurl
}

package () {
  mkdir -p "${pkgdir}/usr/lib/"

  cd ${CURL_VERSION}
  ver=$(readlink -f lib/.libs/libcurl.so | sed 's/.*so\.//')
  major=$(echo -n $ver | cut -d'.' -f1)
  cd out/

  sed -i "s/\$dir\/curl-impersonate/${pkgname}/g" curl_*
  install -Dm755 curl-impersonate "${pkgdir}/usr/bin/${pkgname}"
  install -Dm755 curl_* "${pkgdir}/usr/bin/"
  install -Dm755 libcurl-impersonate.so.$ver "${pkgdir}/usr/lib/libcurl-impersonate-firefox.so.$ver"

  cd "${pkgdir}/usr/lib/"
  ln -s "libcurl-impersonate-firefox.so.$ver" "libcurl-impersonate-firefox.so.$major"
  ln -s "libcurl-impersonate-firefox.so.$ver" "libcurl-impersonate-firefox.so"
}
