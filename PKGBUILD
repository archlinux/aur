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
pkgver=8.12.1
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
conflicts=('curl')
validpgpkeys=('27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2') # Daniel Stenberg
source=("git+https://github.com/curl/${_proj}.git#tag=${_git_tag}?signed")
sha512sums=('SKIP')

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
    --with-random='/dev/urandom'
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
sha512sums=('d438f215b2e6023104af52961a8a8de9082bd8ceaf9a557f353b3b754b18510cccf37f33476eb896744559ccf26eadf6e1411c5f8f04fa9526af04df6439a7d8')
sha512sums=('3ed91b678e318a62bbde32b986ebddb8c3ec2e5932462c9c368437414eaed85b4ecd5ae2d8d35c31c90a3a435d4cd9d26e1b91265e1b4396b6868641c629bd81')
sha512sums=('40862a8065fa6dba931eb0adbd737934da402f9d906f1933edc143fb472867b1391fc3b044d22e08d7e5f175b305f67215ab977fec0df5c2f0a9442c2bf1dbfd')
sha512sums=('40862a8065fa6dba931eb0adbd737934da402f9d906f1933edc143fb472867b1391fc3b044d22e08d7e5f175b305f67215ab977fec0df5c2f0a9442c2bf1dbfd')
sha512sums=('2c19680c2f9f21f0474ae3513d86c2bbd1d8e8f393116190a449c4d4512b3f833f67d1248b8bd96fd088bb30203575952d9c6b1052ee5c6ebb3e76c32cd7018a')
