# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Hilton Medeiros <medeiros.hilton@gmail.com>
# Contributor: Dave Reisner <d@falconindy.com>

_pkgname=libgit2
pkgname=lib32-libgit2
pkgver=1.7.1
pkgrel=1
pkgdesc="A linkable library for Git"
arch=('x86_64')
url="https://github.com/libgit2/libgit2"
license=('GPL2')
depends=(
  'lib32-gcc-libs'
  'lib32-glibc'
  "libgit2=1:${pkgver}"
)
makedepends=(
  'cmake'
  'lib32-openssl'
  'lib32-pcre2'
  'lib32-http-parser'
  'lib32-zlib'
  'lib32-libssh2'
  'python'
)
provides=('libgit2.so')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('17d2b292f21be3892b704dddff29327b3564f96099a1c53b00edc23160c71327')

build() {

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG='/usr/bin/i686-pc-linux-gnu-pkg-config'

  local cmake_options=(
    -B build
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX=/usr
    -DCMAKE_INSTALL_LIBDIR=lib32
    -DREGEX_BACKEND=pcre2
    -DUSE_HTTP_PARSER=system
    -DUSE_SSH=ON
    -S "${_pkgname}-${pkgver}"
    -Wno-dev
  )

  cmake "${cmake_options[@]}"
  cmake --build build --verbose
}

check() {
  local ignored_tests=(
    'invasive|'
    'online|'
    'ssh|'
    'network_url_parse__hostname_implied_root_empty_port|'
    'network_url_parse__hostname_empty_port|'
    'network_url_parse__ipv4_implied_root_empty_port|'
    'network_url_parse__ipv4_empty_port|'
    'network_url_parse__ipv6_implied_root_empty_port|'
    'network_url_parse__ipv6_empty_port'
  )
  local _ifs="$IFS"
  IFS=
  # NOTE: disable tests requiring the internet, relying on non-existent
  # resources, or those that are only compatible with the (modified) vendored
  # version of http-parser, but not with upstream http-parser
  ctest --test-dir build --output-on-failure -E "${ignored_tests[*]}"
  IFS="${_ifs}"
}

package() {
  depends+=(
    'lib32-libssh2' 'libssh2.so'
    'lib32-openssl' 'libcrypto.so' 'libssl.so'
    'lib32-pcre2' 'libpcre2-8.so'
    'lib32-http-parser' 'libhttp_parser.so'
    'lib32-zlib' 'libz.so'
  )

  DESTDIR="${pkgdir}" cmake --install build
  rm -fr "${pkgdir}/usr/include"
  (cd "${pkgdir}/usr/bin"; mv git2 git2-32)
  install -vDm 644 "${_pkgname}-${pkgver}"/{AUTHORS,README.md} -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
