# Maintainer: zer0def <zer0def@github>
# Contributor: Kaushal M <kshlmster cat gmail dog com>
# Contributor: Stefan Zwanenburg <stefan cat zwanenburg dog info>
pkgbase=kata-containers
pkgname=(kata-ksm-throttler kata-proxy kata-runtime kata-shim kata-agent)
pkgver=1.11.0
_pkgver=${pkgver/\~/-}
pkgrel=1
pkgdesc="Lightweight virtual machines for containers"
arch=('x86_64')
url="https://katacontainers.io/"
license=('Apache')
makedepends=('go')
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
  b03a755e3bb5ab91d08e3ebddc9e049e43d14d49d95d37a9fa24fce5e9ca6d12d4acdd4fa79608e00f8b7f784747dd53a5e3589d4bd9fb245107ca1e4555d9c4
  3c6eec072f3038bc6228f7aadca40bd525238a745ce975a86c6b033e587bc5ac631203002ef626a169399d8fab2e479eb02160cd54d0a71e502f7c556f92e605
  cdca1124ba77afa149c98c734448fd1ffae03a2a6a2187e99bd636838deff81d71f8507cc4dbd18021f911cefb2601fc2c2647b1c3eecc28c475c30d5e6ac47b
  e898b1a3c91d9b7a90db499ef13cf23cb4473e9f812105fcdd2ba0000d98f21ce449b307e818f0774ffadb85ca516d2935e2b64abd520bec326228238bf13a05
  9032af41d729f5a498e5b1712809d1998f3ead87501cf8c3c2bdbf6fe29d403da8c239e0fc89017125df87427fc602969a5281629615eb129a5eac8e68b95e90
  e9298eb9175da275ba8cf19cdf5d2134909c3a0fe4dd9c774015dd47ea780d55afd40195ab8fb4a2708d754903daac9691f7aa90e429fc0ec0fc44b9bbab6375
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
    'firecracker<0.21.0'
    'cloud-hypervisor<0.6.0'
  )
  install=kata-runtime.install
  cd "${srcdir}/src/${_gh_org}/runtime"
  GOPATH="${srcdir}" make install DESTDIR="${pkgdir}" BINDIR="/usr/bin" PKGLIBEXECDIR="/usr/lib/kata-containers" LIBEXECDIR="/usr/lib"
}

package_kata-shim(){
  cd "${srcdir}/src/${_gh_org}/shim"
  GOPATH="${srcdir}" make install DESTDIR="${pkgdir}" BINDIR="/usr/bin" PKGLIBEXECDIR="/usr/lib/kata-containers" LIBEXECDIR="/usr/lib"
}
