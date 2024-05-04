# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Hilton Medeiros <medeiros.hilton@gmail.com>
# Contributor: Dave Reisner <d@falconindy.com>

_pkgname=libgit2
pkgname=lib32-libgit2
pkgver=1.8.0
pkgrel=2
pkgdesc="A linkable library for Git"
arch=('x86_64')
url='https://github.com/libgit2/libgit2'
license=('LicenseRef-GPL-2.0-only-with-linking-exception')
depends=(
  'lib32-gcc-libs'
  'lib32-glibc'
  "libgit2=1:${pkgver}"
  'lib32-libssh2'
  'lib32-openssl'
  'lib32-pcre2'
  'lib32-http-parser'
  'lib32-zlib'
)
makedepends=(
  'cmake'
  'python'
)
provides=('libgit2.so')
source=("https://github.com/libgit2/libgit2/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9e1d6a880d59026b675456fbb1593c724c68d73c34c0d214d6eb848e9bbd8ae4')

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
    'network_url_parse__ipv6_empty_port|'
    'proxy_auto_not_detected'

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
    'libssh2.so'
    'libcrypto.so' 'libssl.so'
    'libpcre2-8.so'
    'libhttp_parser.so'
    'libz.so'
  )

  DESTDIR="${pkgdir}" cmake --install build
  rm -fr "${pkgdir}/usr/include"
  (
    cd "${pkgdir}/usr/bin"
    mv git2 git2-32
  )
  install -vDm 644 "${_pkgname}-${pkgver}"/{AUTHORS,README.md} -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
