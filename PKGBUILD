# Maintainer: zer0def <zer0def@github>
# Contributor: Kaushal M <kshlmster cat gmail dog com>
# Contributor: Stefan Zwanenburg <stefan cat zwanenburg dog info>
pkgbase=kata-containers
pkgname=(kata-ksm-throttler kata-proxy kata-runtime kata-shim kata-agent)
pkgver=1.10.0
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
  '3d98c30fee3a5fcf7ddedb7f4a3457a75c0b052a53158abfa25908447cbca9072f43518b8b30f4a8caceade88fb6cc526536a9e7977d19585675d72ed51ef261'
  'd45ae8c453fe3ab1a9b78bcbe7b2f28227b5da86cad69e18c8e1b761d72ad267f489d1489fd8fbbcc084e92d1f5cacf6d1287c585df631836d9d9f13c0551c4a'
  '5b2ad701e0e4f10e9cf0c839e6265fae48b6727826c0f38e51615ff5041cf2af5b9b1f08e07cb6bec45d6bae0a773908b7c880f7803df8746ca9dbf0e812db25'
  'f3d32b44c65f8ba509ed67f8f9272cf50462f8a7f46ed06d1f59f293a9347100809d9f4862a151f878b806f70394c32f19113ddb55e2a9fcb9f5d83167918d48'
  'fd56add5bc0570abffae1f698f1ba5e36ba8def182a4043bc7542e469a8603f97440941a8962b4ce544879894077d12e28b9b0db7650b5a7e2da62ba472d5cf3'
  'bef8e28b09c826d76fc711b897a538425db13c6d5d1d014389836ef168bc42c706c9dcccd4c0238608b2d391c01f16b53cfa0b0bc6b840d105db108ecd042979'
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
  depends=('qemu-headless' "kata-ksm-throttler=${pkgver}" "kata-proxy=${pkgver}" "kata-shim=${pkgver}" "kata-linux-container=${pkgver}" "kata-containers-image=${pkgver}")
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
