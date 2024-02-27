# SPDX-License-Identifier: AGPL-3.0
#
# Maintainer:  Pellegrino Prevete (dvorak) <pellegrinoprevete@gmail.com>
# Maintainer:  Truocolo <truocolo@aol.com>
# Contributor: Bruno Pagani <archange@archlinux.org>
# Contributor: Baptiste Jonglez <archlinux at bitsofnetworks dot org>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

_pkg="secp256k1"
_pkgname="lib${_pkg}"
_majver="0.2"
_minver="0"
pkgname="${_pkgname}-${_majver}"
# _gitcommit=43756da819a235d813e7ecd53eae6df073b53247
# _pkgver=20220630+1625+g43756da
pkgver="${_majver}.${_minver}"
pkgrel=1
pkgdesc="Optimized C library for EC operations on curve ${_pkg}"
arch=(
  x86_64
)
url="https://github.com/bitcoin-core/${_pkg}"
license=(
  MIT
)
depends=(
  glibc
  # gmp
)
source=(
  # ${url}/archive/${_gitcommit}/${pkgname}-${pkgver}.tar.gz
  ${url}/archive/refs/tags/v${pkgver}.tar.gz
)
provides=(
  "${_pkgname}=${pkgver}"	
)
sha256sums=(
  '6cb0fd596e6b1a671f96e9ed7e65a047960def73de024e7b39f45a78ab4fc8df'
)

prepare() {
  cd \
    "${_pkg}-${pkgver}"
  autoreconf \
    -vfi
}

build() {
  local \
    _configure_opts=()
  _configure_opts=(
    --program-suffix="-${_majver}"
    --prefix="/usr"
    --sbindir="/usr/bin"
    --libexecdir="/usr/bin"
    --sysconfdir="/etc"
    --libdir="/usr/lib/${pkgname}"
    --includedir="/usr/include/${pkgname}"
    --sharedstatedir="/usr/share/${_pkgname}"
    --localstatedir="/var/lib/${_pkgname}"
    --disable-static
    --disable-benchmark
    --disable-coverage
    --enable-module-ecdh
    --enable-module-recovery
    # See aurweb comments
    # --enable-tests
    --disable-tests
    --enable-exhaustive-tests
    --with-gnu-ld
  )
  _ldflags=(
    "${LDFLAGS}"
  )
  cd \
    "${_pkg}-${pkgver}"
  # LDFLAGS="${_ldflags[*]}" \
  ./configure \
    "${_configure_opts[@]}"
  # LDFLAGS="${_ldflags[*]}" \
  make
}

check() {
  cd \
    "${_pkg}-${pkgver}"
  make \
    check
}

package() {
  local \
    _usr
  _usr="$( \
    dirname \
      "$( \
        dirname \
          "$( \
	    command \
	      -v \
	      "gcc" \
	      "cc")")")"
  cd \
    "${_pkg}-${pkgver}"
  make \
    DESTDIR="${pkgdir}" \
    install
  install \
    -Dm644 \
    COPYING \
    -t \
    "${pkgdir}/usr/share/licenses/${pkgname}"
  ln \
    -s \
    "${_usr}/lib/${pkgname}/${_pkgname}.so.1.0.0" \
    "${pkgdir}/usr/lib/${_pkgname}.so.1.0.0"
  ln \
    -s \
    "${_usr}/lib/${pkgname}/${_pkgname}.so.1" \
    "${pkgdir}/usr/lib/${_pkgname}.so.1"
}

# vim:set sw=2 sts=-1 et:
