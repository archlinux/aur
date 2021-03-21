# Maintainer:  Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: David Runge <dvzrv -at- archlinux -dot- org>
# Contributor: Severen Redwood <severen -at- shrike -dot- me
# Contributor: Dave Reisner <dreisner -at- archlinux -dot- org>
# Contributor: Matthias Blaicher <matthias -at- blaicher -dot- com>
# Contributor: pepijndevos <pepijndevos -at- gmail -dot- com>

_pkgname=capnproto
pkgname=capnproto-git
pkgver=0.9.r3463.b5ab41ea
pkgrel=1
pkgdesc="Cap'n Proto serialization/RPC system (git version)"
arch=('x86_64')
url='https://capnproto.org/'
license=('MIT')
conflicts=("${_pkgname}")
provides=("${_pkgname}" "${_pkgname}=${pkgver/.r*/}"
          'libcapnp.so' "libcapnp.so=${pkgver/.r*/}"
          'libcapnp-json.so' "libcapnp-json.so=${pkgver/.r*/}"
          'libcapnp-rpc.so' "libcapnp-rpc.so=${pkgver/.r*/}"
          'libcapnpc.so' "libcapnpc.so=${pkgver/.r*/}"
          'libkj-async.so' "libkj-async.so=${pkgver/.r*/}"
          'libkj-gzip.so' "libkj-gzip.so=${pkgver/.r*/}"
          'libkj-http.so' "libkj-http.so=${pkgver/.r*/}"
          'libkj-test.so' "libkj-test.so=${pkgver/.r*/}"
          'libkj.so' "libkj.so=${pkgver/.r*/}"
)
depends=('gcc-libs' 'glibc' 'openssl' 'zlib')
makedepends=('cmake' 'git')
source=("${_pkgname}::git+https://github.com/${_pkgname}/${_pkgname}.git")
sha512sums=('SKIP')


pkgver() {
  cd "${srcdir}/${_pkgname}/c++"
  local ver="$(grep '^set(VERSION' CMakeLists.txt | sed -e 's/set(VERSION \([0-9]\+\.[0-9]\+.*\))/\1/;s/-dev$//')"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-dev$//;s/-/./g' ||
    printf "%s.r%s.%s" "$ver" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "${srcdir}/${_pkgname}"
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_SHARED_LIBS=ON \
        -B build \
        -S .
  make VERBOSE=1 -C build
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="${pkgdir}" install -C build
  install -vDm 644 LICENSE \
    -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -vDm 644 {CONTRIBUTORS,README.md} \
    -t "${pkgdir}/usr/share/doc/${_pkgname}"
}

# vim:set ts=2 sw=2 et:
