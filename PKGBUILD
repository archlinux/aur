# Maintainer: zer0def <zer0def@github>
# Contributor: Kaushal M <kshlmster cat gmail dog com>
# Contributor: Stefan Zwanenburg <stefan cat zwanenburg dog info>
pkgbase=kata-containers
pkgname=(kata-ksm-throttler kata-proxy kata-runtime kata-shim kata-agent)
pkgver=1.10.2
_pkgver=${pkgver/\~/-}
pkgrel=1
pkgdesc="Lightweight virtual machines for containers"
arch=('x86_64')
url="https://katacontainers.io/"
license=('Apache')
makedepends=('go-pie')
_gh_org="github.com/kata-containers"
source=(
  "agent-${_pkgver}.tar.gz::https://${_gh_org}/agent/archive/${_pkgver}.tar.gz"
  "ksm-throttler-${_pkgver}.tar.gz::https://${_gh_org}/ksm-throttler/archive/${_pkgver}.tar.gz"
  "osbuilder-${_pkgver}.tar.gz::https://${_gh_org}/osbuilder/archive/${_pkgver}.tar.gz"
  "proxy-${_pkgver}.tar.gz::https://${_gh_org}/proxy/archive/${_pkgver}.tar.gz"
  "runtime-${_pkgver}.tar.gz::https://${_gh_org}/runtime/archive/${_pkgver}.tar.gz"
  "shim-${_pkgver}.tar.gz::https://${_gh_org}/shim/archive/${_pkgver}.tar.gz"
)
sha512sums=(
  4c2754aa89e8d138a734ce1094fd3ba9d53b33bcc29b775e004277cff45464bd9ccf743a339459d47f33bf8bed2795088a81cd0faa7b27a5a10618f8068dc87d
  f1dc5ffa2264d580ced5adef3867c8a4bba1f456ca75dc48390be2a36a773f6d0ae91a8bfab35a77e37366d6bb983c3b80c5afa9964ac288635fd0f1631335e9
  993c699d4c768226d6559e6545bda6f60c55833e230aec6e200e57dff0ff84637a4ecae0065849e930aa0c3e0b46f718476f43e82c8c6ff5cd7a7fa68bdd3a4f
  f3428e043847829156abedc635445f189d02b93b2acf196e6c12da5c9659f96700b0a85bba4e3e28fb2451d4152e32e08893aa13a51d6290a5ec823ebba62f66
  dd2720acff2774fd3eaf2512f7a83e2e089f5ac7fa385d2f6f7f80d61089799a66dbbd8bd378b16a689658e80a37202f934a19aa5c1bffeed7039b542b2dac6d
  857c9eaea59ec811b27b6ba0bb211d985776ce66a401c7e1ccf7a2b086e0b74d6dc275928503defd9eaf803ab90b8b85b1e63c6b0f8263365ddbbdcbb162694b
)

prepare(){
  mkdir -p "${srcdir}/src/${_gh_org}"
  for i in agent ksm-throttler proxy runtime shim; do
    rm -rf "${srcdir}/src/${_gh_org}/${i}"
    mv "${srcdir}/${i}-${_pkgver}" "${srcdir}/src/${_gh_org}/${i}"
  done
}

build(){
  cd "${srcdir}/src/${_gh_org}/agent"
  GOPATH="${srcdir}" LDFLAGS="" make

  for i in ksm-throttler proxy runtime shim; do
    echo "Building kata-${i}…"
    cd "${srcdir}/src/${_gh_org}/${i}"
    GOPATH="${srcdir}" make DESTDIR="${pkgdir}" BINDIR="/usr/bin" PKGLIBEXECDIR="/usr/lib/kata-containers" LIBEXECDIR="/usr/lib"
  done
}

package_kata-agent(){
  cd "${srcdir}/src/${_gh_org}/agent"
  GOPATH="${srcdir}" make install DESTDIR="${pkgdir}" BINDIR="/usr/bin" PKGLIBEXECDIR="/usr/lib/kata-containers" LIBEXECDIR="/usr/lib"
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
  depends=('qemu-headless' "kata-ksm-throttler=${pkgver}" "kata-proxy=${pkgver}" "kata-shim=${pkgver}" "kata-linux-container" "kata-containers-image")
  optdepends=(
    'firecracker<0.20.0'
    'cloud-hypervisor<0.5.0'
    #'acrn'
  )
  install=kata-runtime.install
  cd "${srcdir}/src/${_gh_org}/runtime"
  GOPATH="${srcdir}" make install DESTDIR="${pkgdir}" BINDIR="/usr/bin" PKGLIBEXECDIR="/usr/lib/kata-containers" LIBEXECDIR="/usr/lib"
}

package_kata-shim(){
  cd "${srcdir}/src/${_gh_org}/shim"
  GOPATH="${srcdir}" make install DESTDIR="${pkgdir}" BINDIR="/usr/bin" PKGLIBEXECDIR="/usr/lib/kata-containers" LIBEXECDIR="/usr/lib"
}
