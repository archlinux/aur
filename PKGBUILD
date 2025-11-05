# Maintainer on AUR: Whyme Lyu <callme5long@gmail.com>
#
# Imported from Arch official repo:
# Maintainer: Dave Reisner <dreisner@archlinux.org>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: Lucien Immink <l.immink@student.fnt.hvu.nl>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

_proj=curl
pkgname=curl-c-ares
pkgver=8.17.0
_git_tag="curl-${pkgver//./_}"
pkgrel=1
pkgdesc='command line tool and library for transferring data with URLs (built with c-ares)'
arch=('x86_64')
url='https://curl.se/'
license=('MIT')
depends=('ca-certificates'
         'brotli' 'libbrotlidec.so'
         'c-ares' 'libcares.so'
         'krb5' 'libgssapi_krb5.so'
         'libidn2' 'libidn2.so'
         'libnghttp2' 'libnghttp2.so'
         'libnghttp3' 'libnghttp3.so'
         'libpsl' 'libpsl.so'
         'libssh2' 'libssh2.so'
         'openssl' 'libcrypto.so' 'libssl.so'
         'zlib' 'libz.so'
         'zstd' 'libzstd.so')
makedepends=('git')
checkdepends=('valgrind')
provides=('curl' 'libcurl.so')
replaces=('wcurl')
conflicts=('curl' 'wcurl')
validpgpkeys=('27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2') # Daniel Stenberg
source=("git+https://github.com/curl/${_proj}.git#tag=${_git_tag}?signed")
sha512sums=('b2d6ab7e3bbfd7436524d78f82d1cf99151e43bc356a41f08005dff2cd0c15516af870c945db7f26c4495f5b2a013df116ffb9060dc52aa2e9acca085abc7044')

prepare() {
  cd $_proj

  # no '-DEV' in version, release date from tagged commit...
  sed -i \
    -e "/\WLIBCURL_VERSION\W/c #define LIBCURL_VERSION \"${pkgver}\"" \
    -e "/\WLIBCURL_TIMESTAMP\W/c #define LIBCURL_TIMESTAMP \"$(git log -1 --format=%cs "$_git_tag")\"" \
    include/curl/curlver.h

  autoreconf -fi
}

build() {
  local _configure_options=(
    --prefix='/usr'
    --mandir='/usr/share/man'
    --disable-ldap
    --disable-ldaps
    --disable-manual
    --enable-ares
    --enable-ipv6
    --with-gssapi
    --with-libssh2
    --with-ca-bundle='/etc/ssl/certs/ca-certificates.crt'
  )

  mkdir build-curl

  cd "${srcdir}"/build-curl

  "${srcdir}/$_proj/configure" \
    "${_configure_options[@]}" \
    --enable-versioned-symbols \
    --with-fish-functions-dir=/usr/share/fish/vendor_completions.d/ \
    --with-openssl \
    --with-openssl-quic \
    --with-zsh-functions-dir=/usr/share/zsh/site-functions/
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

check() {
  cd build-curl
  # disable test 433, since it requires the glibc debug info
  make TFLAGS="-v -a -k -p -j$(nproc) !433" test-nonflaky
}

package() {
  cd build-curl

  make DESTDIR="${pkgdir}" install
  make DESTDIR="${pkgdir}" install -C scripts

  cd "${srcdir}/${_proj}"

  # license
  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m0644 COPYING
}
