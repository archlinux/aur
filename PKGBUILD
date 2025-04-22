# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="ntirpc"
pkgver=6.3
pkgrel=2
pkgdesc="New Transport Independent RPC Library"
arch=('aarch64' 'x86_64')
url="https://github.com/nfs-ganesha/${pkgname}"
license=('BSD-3-Clause')
depends=('glibc' 'krb5' 'liburcu' 'rdma-core')
makedepends=('cmake>=2.6.3')
provides=("lib${pkgname}.so")
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('f6c204ad125b79165a3fd643c5bbd0b99dc6f75c835392e013768c1b276bfae3944f5ed22fc7950749f046e0b22bc610f0722bc8b8e84dee567d62b690e04fcd')

build() {
  local cmake_options=(
    -G 'Unix Makefiles'
    -B "${_pkgsrc}/build"
    -S "${_pkgsrc}"
    -W no-dev
    -D CMAKE_BUILD_TYPE:STRING='None'
    -D CMAKE_INSTALL_PREFIX:PATH='/usr'
    -D CMAKE_POLICY_VERSION_MINIMUM=3.5
    -D OVERRIDE_INSTALL_PREFIX:PATH='/usr'
    -D USE_RPC_RDMA:BOOL=ON
    -D USE_GSS:BOOL=ON
    -D USE_PROFILE:BOOL=OFF
    -D USE_LTTNG:BOOL=OFF
  )

  cd "${srcdir}"
  cmake "${cmake_options[@]}"
  cmake --build "${_pkgsrc}/build"
}

package() {
  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build"

  cd "${_pkgsrc}"
  install -vDm644 "README"  "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -vDm644 "COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
