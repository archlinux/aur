# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="ntirpc"
pkgname="${_pkgname}-git"
pkgver=6.3.r2.g246fe95
pkgrel=1
pkgdesc="New Transport Independent RPC Library"
arch=('x86_64' 'aarch64')
url="https://github.com/nfs-ganesha/${_pkgname}"
license=('BSD-3-Clause')
depends=('glibc' 'krb5' 'rdma-core' 'liburcu')
makedepends=('cmake>=2.6.3' 'git')
provides=("${_pkgname}=${pkgver%%.r*}" "lib${_pkgname}.so")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}"
source=("${_pkgsrc}::git+${url}.git")
b2sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgsrc}"
  git describe --long --tags --abbrev=7 | sed 's/v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}"
  cmake \
    -G 'Unix Makefiles' \
    -B "${_pkgsrc}/build" \
    -S "${_pkgsrc}" \
    -DCMAKE_BUILD_TYPE:STRING='None' \
    -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
    -DOVERRIDE_INSTALL_PREFIX:PATH='/usr' \
    -DTIRPC_EPOLL=1 \
    -DUSE_RPC_RDMA=ON \
    -DUSE_GSS=ON \
    -Wno-dev
  cmake --build "${_pkgsrc}/build"
}

package() {
  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build"

  cd "${_pkgsrc}"
  install -vDm644 "README"  "${pkgdir}/usr/share/doc/${_pkgname}/README"
  install -vDm644 "COPYING" "${pkgdir}/usr/share/licenses/${_pkgname}/COPYING"
}
