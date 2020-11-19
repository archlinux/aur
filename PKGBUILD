# Maintainer: zer0def <zer0def@github>
# Contributor: Kaushal M <kshlmster cat gmail dog com>
# Contributor: Stefan Zwanenburg <stefan cat zwanenburg dog info>
pkgbase=kata-containers
pkgname=(
  kata-ksm-throttler
  kata-runtime
  kata-proxy
  kata-shim
)
pkgver=1.12.0
_pkgver=${pkgver/\~/-}
pkgrel=2
pkgdesc="Lightweight virtual machines for containers"
arch=('x86_64')
url="https://katacontainers.io/"
license=('Apache')
makedepends=('go' 'yq2-bin')
_gh_org="github.com/kata-containers"
source=(
  "ksm-throttler-${_pkgver}.tar.gz::https://${_gh_org}/ksm-throttler/archive/${_pkgver}.tar.gz"
  "proxy-${_pkgver}.tar.gz::https://${_gh_org}/proxy/archive/${_pkgver}.tar.gz"
  "runtime-${_pkgver}.tar.gz::https://${_gh_org}/runtime/archive/${_pkgver}.tar.gz"
  "shim-${_pkgver}.tar.gz::https://${_gh_org}/shim/archive/${_pkgver}.tar.gz"
  "3082.patch"  # https://github.com/kata-containers/runtime/pull/3082 fixing https://github.com/kata-containers/runtime/issues/2982
)
sha512sums=(
  4680a524e674cb1fb34e61a0ff0ed9d9535c90527f01342e426deeb5a494984c22cdfa1de4c7e6082ade5898d4108b7f0a6fd982220d6d3e1e0f20c0b66c6cbc
  94d53f9e8d918cf0e439a695fa1ab95734da0e5dbc3a7a0148ba3221520cb66086276772c11dc244216693692007b323f85fb33570450f033e4289466d1cab4f
  d0241edaaba9f7df15c4daa1313b43d1acc365233455c5d71096cf2fc3d036e3849a93f2bc60c80b1f60859b6090b9711b2e357e7dc6ff7948ca5e961cebb7b6
  5818ba9962bfd541e162f9091609d2fc776accb94c2f580ef4cf11483a9d7dd6e900f235619581dacba777d042b483886bc013d11a6cd36b045e3c6c0ee2b7d2
  87568f7db71a816f4953245af4b302da2f0a19543a706bce9d84e9c7e9de8f6ef54f410e426f05c4faf46bcfb330f802fa8261848beda3aaa965bfc11408a5ca
)
b2sums=(
  4c6b4a9e2beff8ce04c82fc3b02d0e0e22db1eaff8d703ecc737fc54fd99fba21687f821bc0dd0579009364ceeff2c7503e1bf0ed6a958451a6a4047430c2dd6
  5b1ea0dd0eff23d4956a5e7d8fac1a0d87890248f8a851fde536a29660edb31e876a55c0c95598b829bf00ba154de25b8720bcb5fe5edd61e7c36425fe4bffe5
  48bd3e6bea66c8157b7965d8840d5f812db65e865ec4dee7897ebfd9cd4ff16a7043e41faeb62444944e1be14d2278fef0ff0841f3f404c17987b9bdf8bd54f3
  4eefe311f1c8110cd55397828eec5a2d01f8156c4fc17526255fdf1f05ca11dbeafb3155e0be9ed15668faf15103d1deb4bab83a8dff9721a2e7baf1b1664229
  d4f55b660a26ff6dc9e9a7f4eab80f3a45a228b9780054ae0a8d1080ca8db29333818e9e83235c4e6a128117473fe8fcb8f9e5831042aaf71d4defca09808ef2
)

prepare(){
  install -dm0755 "${srcdir}/bin"
  ln -sf "$(type -p yq)" "${srcdir}/bin/yq"

  install -dm0755 "${srcdir}/src/${_gh_org}"
  for i in ksm-throttler proxy runtime shim; do
    rm -rf "${srcdir}/src/${_gh_org}/${i}"
    mv "${srcdir}/${i}-${_pkgver}" "${srcdir}/src/${_gh_org}/${i}"
  done
  cd "${srcdir}/src/${_gh_org}/runtime"
  patch -p1 <"${srcdir}/3082.patch"
}

build(){
  for i in ksm-throttler proxy runtime shim; do
    cd "${srcdir}/src/${_gh_org}/${i}"
    GOPATH="${srcdir}" make DESTDIR="${pkgdir}" BINDIR="/usr/bin" PKGLIBEXECDIR="/usr/lib/kata-containers" LIBEXECDIR="/usr/lib"
  done
}

package_kata-ksm-throttler(){
  cd "${srcdir}/src/${_gh_org}/ksm-throttler"
  GOPATH="${srcdir}" make install DESTDIR="${pkgdir}" BINDIR="/usr/bin" PKGLIBEXECDIR="/usr/lib/kata-containers" LIBEXECDIR="/usr/lib"
  install -d -m 0755 "${pkgdir}/var/lib/vc/{firecracker,sbs,uuid}"
}

package_kata-proxy(){
  cd "${srcdir}/src/${_gh_org}/proxy"
  GOPATH="${srcdir}" make install DESTDIR="${pkgdir}" BINDIR="/usr/bin" PKGLIBEXECDIR="/usr/lib/kata-containers" LIBEXECDIR="/usr/lib"
}

package_kata-runtime(){
  depends=('qemu-headless' "kata-proxy=${pkgver}" "kata-shim=${pkgver}" "kata-linux-container" "kata-containers-image")
  optdepends=(
    "kata-ksm-throttler=${pkgver}"
    'firecracker<0.22.0'
    'cloud-hypervisor<0.9.0'
  )
  install=kata-runtime.install
  cd "${srcdir}/src/${_gh_org}/runtime"
  GOPATH="${srcdir}" make install DESTDIR="${pkgdir}" BINDIR="/usr/bin" PKGLIBEXECDIR="/usr/lib/kata-containers" LIBEXECDIR="/usr/lib"
}

package_kata-shim(){
  cd "${srcdir}/src/${_gh_org}/shim"
  GOPATH="${srcdir}" make install DESTDIR="${pkgdir}" BINDIR="/usr/bin" PKGLIBEXECDIR="/usr/lib/kata-containers" LIBEXECDIR="/usr/lib"
}
