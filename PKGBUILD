# Maintainer: Ziah Jyothi <`echo 'Y29udGFjdEB6aWFoLmRldgo=' | base64 -d`>
# Base Curl Maintainer: Dave Reisner <dreisner@archlinux.org>
# Base Curl Contributor: Angel Velasquez <angvp@archlinux.org>
# Base Curl Contributor: Eric Belanger <eric@archlinux.org>
# Base Curl Contributor: Lucien Immink <l.immink@student.fnt.hvu.nl>
# Base Curl Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgbase=curl-http3-ngtcp2
pkgname=(curl-http3-ngtcp2 libcurl-http3-ngtcp2-compat libcurl-http3-ngtcp2-gnutls)
_tag='55b5fafb094ebe07ca8a5d4f79813c8b40670795' # git rev-parse v${_tag_name}
pkgver=8.5.0
pkgrel=1
pkgdesc="command line tool and library for transferring data with URLs - compiled with HTTP/3 support (using ngtcp2 and nghttp3)"
arch=('x86_64')
url='https://curl.se/'
license=('MIT')
depends=('ca-certificates' 'brotli' 'libbrotlidec.so' 'krb5' 'libgssapi_krb5.so'
         'libidn2' 'libidn2.so' 'libnghttp2' 'libpsl' 'libpsl.so' 'libssh2' 'libssh2.so'
         'openssl' 'zlib' 'zstd' 'libzstd.so' 'nghttp3' 'libnghttp3.so' 'ngtcp2' 'libngtcp2.so' 'quictls-openssl')
makedepends=('git' 'patchelf')
conflicts=('curl')
provides=("curl=${pkgver}" 'libcurl.so')
validpgpkeys=('27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2') # Daniel Stenberg
source=("git+https://github.com/curl/curl.git#tag=${_tag}?signed")
sha512sums=('SKIP')

_backports=(
)

_reverts=(
)

pkgver() {
  cd "${srcdir}/curl"
  git describe | sed -E 's/curl-([0-9]+)_([0-9]+)_([0-9]+)/\1.\2.\3/g'
}

prepare() {
  cd "${srcdir}/curl"

  local _c
  for _c in "${_backports[@]}"; do
    if [[ $_c == *..* ]]; then
      git log --oneline --reverse "${_c}"
    else
      git log --oneline -1 "${_c}"
    fi
    git cherry-pick -n -m1 "${_c}"
  done
  for _c in "${_reverts[@]}"; do
    git log --oneline -1 "${_c}"
    git revert -n "${_c}"
  done

  # no '-DEV' in version, release date from tagged commit...
  sed -i \
    -e "/\WLIBCURL_VERSION\W/c #define LIBCURL_VERSION \"${pkgver}\"" \
    -e "/\WLIBCURL_TIMESTAMP\W/c #define LIBCURL_TIMESTAMP \"$(git log -1 --format=%cs "${_tag}")\"" \
    include/curl/curlver.h

  autoreconf -fi
}

build() {
  local _configure_options=(
    --prefix='/usr'
    --mandir='/usr/share/man'
    --disable-ldap
    --disable-ldaps
    --disable-rtsp
    --disable-manual
    --enable-ipv6
    --enable-threaded-resolver
    --enable-websockets
    --enable-alt-svc
    --without-librtmp
    --with-gssapi
    --with-libssh2
    --with-nghttp3
    --with-ngtcp2
    --with-random='/dev/urandom'
    --with-ca-bundle='/etc/ssl/certs/ca-certificates.crt'
  )

  mkdir -p "${srcdir}"/build-curl{,-compat,-gnutls}

  # build curl
  cd "${srcdir}"/build-curl

  "${srcdir}/curl"/configure \
    LDFLAGS="-Wl,-rpath,/usr/local/lib -fPIC" \
    "${_configure_options[@]}" \
    --with-openssl \
    --enable-versioned-symbols
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make -j "$(nproc)"

  # build libcurl-compat
  cd "${srcdir}"/build-curl-compat

  "${srcdir}/curl"/configure \
    "${_configure_options[@]}" \
    --with-openssl \
    --disable-versioned-symbols
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make -C lib -j "$(nproc)"

  # build libcurl-gnutls
  cd "${srcdir}"/build-curl-gnutls

  "${srcdir}/curl"/configure \
    "${_configure_options[@]}" \
    --disable-versioned-symbols \
    --without-openssl \
    --with-gnutls
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make -C lib -j "$(nproc)"
  patchelf --set-soname 'libcurl-gnutls.so.4' ./lib/.libs/libcurl.so
}

package_curl-http3-ngtcp2() {
  cd "${srcdir}"/build-curl

  make DESTDIR="${pkgdir}" install
  make DESTDIR="${pkgdir}" install -C scripts

  cd "${srcdir}/curl"

  # license
  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m0644 COPYING
}

package_libcurl-http3-ngtcp2-compat() {
  pkgdesc='command line tool and library for transferring data with URLs (no versioned symbols)'
  depends=('curl-http3-ngtcp2' 'openssl')
  conflicts=('libcurl-compat')
  provides=("libcurl-compat=${pkgver}" 'libcurl-compat.so')

  cd "${srcdir}"/build-curl-compat

  make -C lib DESTDIR="${pkgdir}" install

  mv "${pkgdir}"/usr/lib/libcurl{,-compat}.so.4.8.0
  rm "${pkgdir}"/usr/lib/libcurl.{a,so}*
  for version in 3 4.0.0 4.1.0 4.2.0 4.3.0 4.4.0 4.5.0 4.6.0 4.7.0; do
    ln -s libcurl-compat.so.4.8.0 "${pkgdir}"/usr/lib/libcurl.so.${version}
  done

  install -dm 0755 "${pkgdir}"/usr/share/licenses
  ln -s curl "${pkgdir}"/usr/share/licenses/libcurl-http3-ngtcp2-compat
}

package_libcurl-http3-ngtcp2-gnutls() {
  pkgdesc='command line tool and library for transferring data with URLs (no versioned symbols, linked against gnutls)'
  depends=('curl-http3-ngtcp2' 'gnutls')
  conflicts=('libcurl-gnutls')
  provides=("libcurl-gnutls=${pkgver}" 'libcurl-gnutls.so')

  cd "${srcdir}"/build-curl-gnutls

  make -C lib DESTDIR="${pkgdir}" install

  mv "${pkgdir}"/usr/lib/libcurl{,-gnutls}.so.4.8.0
  rm "${pkgdir}"/usr/lib/libcurl.{a,so}*
  ln -s libcurl-gnutls.so.4 "${pkgdir}"/usr/lib/libcurl-gnutls.so
  for version in 3 4 4.0.0 4.1.0 4.2.0 4.3.0 4.4.0 4.5.0 4.6.0 4.7.0; do
    ln -s libcurl-gnutls.so.4.8.0 "${pkgdir}"/usr/lib/libcurl-gnutls.so.${version}
  done

  install -dm 0755 "${pkgdir}"/usr/share/licenses
  ln -s curl "${pkgdir}"/usr/share/licenses/libcurl-http3-ngtcp2-gnutls
}
