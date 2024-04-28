# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Previous maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor:  Vincent Grande <shoober420@gmail.com>
# Contributor: Dave Reisner <dreisner@archlinux.org>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: Lucien Immink <l.immink@student.fnt.hvu.nl>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgbase=curl-git
pkgname=('curl-git' 'libcurl-compat-git' 'libcurl-gnutls-git')
pkgver=8.7.1.r201.gc8e0cd1de8
pkgrel=1
pkgdesc="A command line tool and library for transferring data with URLs"
arch=('i686' 'x86_64')
url="https://curl.se/"
license=('MIT')
depends=('glibc' 'ca-certificates' 'brotli' 'krb5' 'libbrotlidec.so' 'libgssapi_krb5.so'
         'libidn2' 'libidn2.so' 'libnghttp2' 'libpsl' 'libpsl.so' 'libssh2' 'libssh2.so'
         'libzstd.so' 'zlib' 'zstd')
makedepends=('git' 'gnutls' 'openssl' 'patchelf')
options=('staticlibs')
source=("git+https://github.com/curl/curl.git")
sha256sums=('SKIP')


pkgver() {
  cd "curl"

  _tag=$(git tag -l --sort -v:refname | grep -E '^curl-[0-9_]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^curl-//;s/_/./g'
}

build() {
  cd "curl"

  local _configure_options=(
    --prefix="/usr"
    --disable-ldap
    --disable-ldaps
    --disable-manual
    --enable-ipv6
    --enable-threaded-resolver
    --with-ca-bundle="/etc/ssl/certs/ca-certificates.crt"
    --with-gssapi
    --with-libssh2
  )

  autoreconf -fi

  mkdir -p _build{-curl,-libcurl-compat,-libcurl-gnutls}

  # build curl
  pushd "_build-curl"
  ../configure \
    "${_configure_options[@]}" \
    --enable-versioned-symbols \
    --with-openssl
  make
  popd

  # build libcurl-compat
  pushd "_build-libcurl-compat"
  ../configure \
    "${_configure_options[@]}" \
    --disable-versioned-symbols \
    --with-openssl
  make -C "lib"
  popd

  # build libcurl-gnutls
  pushd "_build-libcurl-gnutls"
  ../configure \
    "${_configure_options[@]}" \
    --disable-versioned-symbols \
    --with-gnutls \
    --without-openssl
  make -C "lib"
  patchelf --set-soname 'libcurl-gnutls.so.4' "lib/.libs/libcurl.so"
  popd
}

check() {
  cd "curl"

  #make -C "_build-curl" check
}

package_curl-git() {
  depends+=('openssl')
  provides=("curl=$pkgver" 'libcurl.so')
  conflicts=('curl')

  cd "curl"

  make -C "_build-curl" DESTDIR="$pkgdir" install
  make -C "_build-curl/scripts" DESTDIR="$pkgdir" install
  install -Dm644 "COPYING" -t "$pkgdir/usr/share/licenses/curl"
}

package_libcurl-compat-git() {
  pkgdesc='A command line tool and library for transferring data with URLs (no versioned symbols)'
  depends=('curl')
  provides=("libcurl-compat=$pkgver" 'libcurl-compat.so')
  conflicts=('libcurl-compat')

  cd "curl"

  make -C "_build-libcurl-compat/lib" DESTDIR="$pkgdir" install

  mv "$pkgdir/usr/lib/libcurl.a" "$pkgdir/usr/lib/libcurl-compat.a"

  _version_full=$(find "$pkgdir/usr/lib" -type f | grep .so | tail -c 6)
  _version_major=$(echo "$_version_full" | head -c 1)
  rm "$pkgdir/usr/lib/libcurl.so"
  rm "$pkgdir/usr/lib/libcurl.so.$_version_major"
  mv "$pkgdir/usr/lib/libcurl.so.$_version_full" "$pkgdir/usr/lib/libcurl-compat.so.$_version_full"
  ln -s "libcurl-compat.so.$_version_full" "$pkgdir/usr/lib/libcurl-compat.so"
  ln -s "libcurl-compat.so.$_version_full" "$pkgdir/usr/lib/libcurl-compat.so.$_version_major"

  install -Dm644 "COPYING" -t "$pkgdir/usr/share/licenses/libcurl-compat"
}

package_libcurl-gnutls-git() {
  pkgdesc="A command line tool and library for transferring data with URLs (no versioned symbols, linked against gnutls)"
  depends=('curl' 'gnutls')
  provides=("libcurl-gnutls=$pkgver" 'libcurl-gnutls.so')
  conflicts=('libcurl-gnutls')

  cd "curl"

  make -C "_build-libcurl-gnutls/lib" DESTDIR="$pkgdir" install

  mv "$pkgdir/usr/lib/libcurl.a" "$pkgdir/usr/lib/libcurl-gnutls.a"

  _version_full=$(find "$pkgdir/usr/lib" -type f | grep .so | tail -c 6)
  _version_major=$(echo "$_version_full" | head -c 1)
  rm "$pkgdir/usr/lib/libcurl.so"
  rm "$pkgdir/usr/lib/libcurl.so.$_version_major"
  mv "$pkgdir/usr/lib/libcurl.so.$_version_full" "$pkgdir/usr/lib/libcurl-gnutls.so.$_version_full"
  ln -s "libcurl-gnutls.so.$_version_full" "$pkgdir/usr/lib/libcurl-gnutls.so"
  ln -s "libcurl-gnutls.so.$_version_full" "$pkgdir/usr/lib/libcurl-gnutls.so.$_version_major"

  install -Dm644 "COPYING" -t "$pkgdir/usr/share/licenses/libcurl-gnutls"
}
