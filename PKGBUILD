# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="ntirpc"
_commit="d2b7209f82fac44fe95731ce98740f793e9e98a0" # v6.3
pkgver=6.3
pkgrel=2
pkgdesc="New Transport Independent RPC Library"
arch=('aarch64' 'x86_64')
url="https://github.com/nfs-ganesha/${pkgname}"
license=('BSD-3-Clause')
depends=('glibc' 'krb5' 'liburcu' 'rdma-core')
makedepends=('cmake>=2.6.3')
provides=("lib${pkgname}.so")
_pkgsrc="${pkgname}-${_commit}"
source=("${_pkgsrc}.tar.gz::${url}/archive/${_commit}.tar.gz")
b2sums=('13f91eb0536a4782e3aa3a793667adf173c8d42afcd19d998117dd9b849a6866c90de67f968e6d26e59757538c54e6da89022e0f166db055fa5113330f1af6bc')

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
