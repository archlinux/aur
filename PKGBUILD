# Maintainer: zer0def <zer0def@github>
# Contributor: Kaushal M <kshlmster cat gmail dog com>
# Contributor: Stefan Zwanenburg <stefan cat zwanenburg dog info>
pkgbase=kata-containers
pkgname=(kata-ksm-throttler kata-proxy kata-runtime kata-shim kata-agent)
pkgver=1.10.3
#pkgver=1.11.0~rc0
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
  56359fd8f47dfa845f4809d8e3c5563c501bc6cef206b4e4c396874576626ce444b2ced5c77be0d4c5736ef045dbd13ae5b220a429ab825a9caa4ed0e3340070
  f6b16c739b809500598fc1af0feff67e0b834b5711c4ce7d4c39e3ac48958bd2aa03e887be9680c59f358449d69500b2f0617c7b98183ad3be8d5b6df98e757d
  f7135589d8e3c520add22c78a53c513d6abfc6abba397a7ee92adbca13a01e72fad09fd6327031d0eeee930a73877b6696dd91fe887cd307d9a6f981e57371bf
  475d99d2a1200b4d6b8d6e0dcdc8a0a45585cada9b1d45e34e3cd1b270b343340002c18611adff62065d7f5dd5e7b8869bcb5694a2cffa6463a300c2da6dbaf6
  b8e280cd520935f886d7dcd232896c9759598c28bf4d2a4a355dbac6869f70c7993307000844136e1659f8a790f77a8580736ec46f79bdc755cdee0aa2c47939
  ceb61c6b7af29b3d6de18527574c9c03fc7882b451217f126e891a8aacfd9efb9aeb080a5bcea088e5f28a75c5637d35fecdd1145229da2654656dabdaf936e9
  #bc52dd92c012c301a747a1804c42bf7cf2e42b166930da8f2b9beec4fab19a52085b5862afa5f9209c36ea04b4198e762eaffb1e0260c2f800d3712660041403
  #3b46f1e3d86b7c935086c77d92c67263f78924280dd2b363cb89e1db14e619831bbdd08ffe98a10bc3b779493d470454bfcfedf2797f6bb022fc88ec8be59ddd
  #21d4adaab235a9eab17df600cae03697a805e595f90c0fe78f8cf17bf5f5aa3486b081544e2ef99bc59b04da9900f801b39e8e6fd5bd250a15506346320c81ad
  #d16509f18aee8a5b855150448f277f758c4f33908f15027d32caf1a8e932e840f613e55e48022b226dba203e64ecebe811a75ade0120af2b352f5c944b2d137a
  #f4561ae756a9fa76423229465cab26597f065bd43b400facbdb3e4d34fdfa664d7c656e34811b3fda5426c41a3d64f4ecb320a6efc3fe3d1c9cdb644b2fead87
  #41252fa65b6f7c12daaca78a873ab6212f5452f98f5f7965b4a55927ce936c1fe0f96d5352bbd5e841a1ebcdbe8ce5a48e6b96f0f3863d8009df89a9a015c3ff
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
