# Maintainer: zer0def <zer0def@github>
# Contributor: Kaushal M <kshlmster cat gmail dog com>
# Contributor: Stefan Zwanenburg <stefan cat zwanenburg dog info>
pkgbase=kata-containers
pkgname=(kata-ksm-throttler kata-proxy kata-runtime kata-shim kata-agent)
pkgver=1.10.4
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
  21a68323415db2b396407509e7f84266e6e71944d8364707c777a97ee43729adb40915fd039cbf3c1786f87cb9b3bd3d6062b735ba8ff3d375ccb98ea6859c29
  64bd02906493233b6c64d03cac40dda2c911b7f06d707fbed5fb931c94a5b4695e465369f5b87722be2e1efdc4b925c9e077552729f1d326fe18135c4bb4d5e1
  255e631584efe55bd0f1680808f1a4d1205b27755eed8f6ae9ba09dbf7f234dd7b55c9b63d58ef166eadb12552f9efed57f51f4fe2d93a5939dd7f816a9f4d99
  f01d84d783e0b97d69f7f0db9fff3ccf4407e44999bd5d90487d8d7c0cbdbeb76bf0ac7e7e369969010ec81f414f4638fdd0cfc5264a7bfa78efeaf6fb69d894
  92bce27faa7887dcce11d4ec0903f9a975cbcfff6045c8dbba992dd49ea706b43e1eb198cb31f50571168b4e8e2c21a542bdf96692998998315d154a612e6910
  223bf48c0a873e89f766698cd9ce08ef11c6b37ec004062daaafe7856c18d023dfb9565b20e008e9c3c3f6c1d0c02302b5e7565ee18e01a890c25ded5aada885
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
