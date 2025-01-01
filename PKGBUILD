# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="ntirpc"
_commit="d2b7209f82fac44fe95731ce98740f793e9e98a0" # v6.3
pkgver=6.3
pkgrel=1
pkgdesc="New Transport Independent RPC Library"
arch=('x86_64' 'aarch64')
url="https://github.com/nfs-ganesha/${pkgname}"
license=('BSD-3-Clause')
depends=('glibc' 'krb5' 'rdma-core' 'liburcu')
makedepends=('cmake>=2.6.3' 'git')
provides=("lib${pkgname}.so")
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}::git+${url}.git#commit=${_commit}")
b2sums=('da2ae91f66a66bd8fc4aec57a538970ac27fc88a4e033aa84863c71b99d7e9967e0c3de5f3f2defb0a578a24202d314af6a1bd9678894521cf176e0700af7ab6')

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
  install -vDm644 "README"  "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -vDm644 "COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
