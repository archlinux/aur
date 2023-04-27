# Maintainer: Ziah Jyothi <`echo 'Y29udGFjdEB6aWFoLmRldgo=' | base64 -d`>
pkgname=curl-http3-ngtcp2
pkgver=8.0.1
pkgrel=4
pkgdesc="An URL retrieval utility and library - compiled with HTTP/3 support (using ngtcp2 and nghttp3)"
arch=('x86_64')
url='https://curl.se/'
license=('MIT')
depends=('ca-certificates' 'brotli' 'libbrotlidec.so' 'krb5' 'libgssapi_krb5.so'
         'libidn2' 'libidn2.so' 'libnghttp2' 'libpsl' 'libpsl.so' 'libssh2' 'libssh2.so'
         'openssl' 'zlib' 'zstd' 'libzstd.so' 'nghttp3' 'libnghttp3.so' 'ngtcp2' 'libngtcp2.so')
makedepends=('git' 'patchelf')
conflicts=('curl')
provides=('curl' 'libcurl.so')
validpgpkeys=('27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2') # Daniel Stenberg
_tag='6b77e19466486b37f93d07d2107579f9508a6645' # git rev-parse v${_tag_name}
source=("git+https://github.com/curl/curl.git?signed#tag=${_tag}"
        "ngtcp2-refactor.patch")
sha512sums=('SKIP'
            'fd0496462866aa67b86bd536a9d051dcab9f546a4bda80bd21a28a93aaac57d0d15ed8d19a36ade9642e10ae41922cb0bb63d56a96b4d79e69dda202fd686da5')

pkgver() {
    cd "${srcdir}/curl"
    git describe | sed -E 's/curl-([0-9]+)_([0-9]+)_([0-9]+)/\1.\2.\3/g'
}

prepare() {
    cd "${srcdir}/curl"

    # Patch curl
    patch -Np1 -i ../ngtcp2-refactor.patch

    # no '-DEV' in version, please...
    sed -i "/\WLIBCURL_VERSION\W/c #define LIBCURL_VERSION \"${pkgver}\"" include/curl/curlver.h

    autoreconf -fi
}

build() {
    mkdir -p "${srcdir}/build-curl"

    cd "${srcdir}/build-curl"

    "${srcdir}/curl/configure" \
        LDFLAGS="-Wl,-rpath,/usr/local/lib -fPIC" \
        --with-openssl \
        --with-nghttp3 \
        --with-ngtcp2 \
        --enable-versioned-symbols \
        --enable-alt-svc \
        --prefix=/usr \
        --mandir=/usr/share/man \
        --disable-ldap \
        --disable-ldaps \
        --disable-manual \
        --enable-shared \
        --disable-static \
        --enable-ipv6 \
        --enable-threaded-resolver \
        --enable-websockets \
        --with-gssapi \
        --with-libssh2 \
        --without-librtmp \
        --disable-rtsp \
        --with-random=/dev/urandom \
        --with-ca-bundle=/etc/ssl/certs/ca-certificates.crt
    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
    make -j "$(nproc)"
}

package() {
    cd "${srcdir}/build-curl"

    make DESTDIR="${pkgdir}" install
    make DESTDIR="${pkgdir}" install -C scripts

    cd ..

    # License
    install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m0644 "${srcdir}/curl"/COPYING
}
