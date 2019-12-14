# Maintainer: zer0def <zer0def@github>
# Contributor: Kaushal M <kshlmster cat gmail dog com>
# Contributor: Stefan Zwanenburg <stefan cat zwanenburg dog info>
pkgbase=kata-containers
pkgname=(kata-ksm-throttler kata-proxy kata-runtime kata-shim kata-agent kata-containers-image kata-linux-container)
pkgver=1.10.0~rc0
_pkgver=${pkgver/\~/-}
pkgrel=2
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
  "https://${_gh_org}/runtime/releases/download/${_pkgver}/kata-static-${_pkgver}-${CARCH}.tar.xz"
)
sha512sums=(
  '5f90c4fc3d0115f5ba23ba98b9153ed1aa78636df78824261241a7a900717afb0c04c10a382b2bb4bf77321df3f6f77d5925cf80fa9b0824057b4ee1a2d17c13'
  '67b588f722af369698d0d0f287d410a787d7a4b947708c8b767c7a0831ab8adb4c99031d29f451d50c4277d50452c2f9f643f7a415a9e5b77d1d4330a3f5a60f'
  '2bb4a095653e922f1fe274793d56241e657856c9af36f53f4b2394be41f02068041fc1beedacaed246c63672bbeadb5a26fbefb24beaa5b96dc089511db1a9cd'
  '0471b8e876c3a49772d56a72e99dd4d36ad5136bbefc212250c83a78f29f0f6e03cc5fd94d70fc61d2b07613ff19fc9a1dfde915364e15838b6b4f6916278e5a'
  '93c1be4386563e246276f5e10a4a65f2fe084c5fbf9e79b65b0541f9ec72281119380bd94eb4022c573461b6b2ddbd3777b0b50de9645f54b5499e40107117d6'
  '426baf82874b614347772d824f7e8a8c02505f41f060ebef931c6f2bc112b41ad4209703994e22808d35e046f8e9e750177a8a07fe596028081595b1ccf3c807'
  'f0e69db2327f87234b053c554793ee28f0f102835e1778e85772d14c90c0caf63890541a780cc5439e08d39a419fa86bd5ff4750228c93f70f2511328afe1aa5'
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

package_kata-containers-image(){
  install -Dm644 -t "${pkgdir}/usr/share/kata-containers/" \
    ${srcdir}/opt/kata/share/kata-containers/kata-containers-image_clearlinux_${_pkgver}_agent_*.img \
    ${srcdir}/opt/kata/share/kata-containers/kata-containers-initrd_alpine_${_pkgver}_agent_*.initrd
  cd "${pkgdir}/usr/share/kata-containers/"
  ln -s kata-containers-image_clearlinux_${_pkgver}_agent_*.img kata-containers.img
  ln -s kata-containers-initrd_alpine_${_pkgver}_agent_*.initrd kata-containers-initrd.img
}

package_kata-linux-container(){
  install -Dm644 -t "${pkgdir}/usr/share/kata-containers/" \
    ${srcdir}/opt/kata/share/kata-containers/config-* \
    ${srcdir}/opt/kata/share/kata-containers/vmlinux-* \
    ${srcdir}/opt/kata/share/kata-containers/vmlinuz-*
  cd "${pkgdir}/usr/share/kata-containers/"
  ln -sf vmlinux-virtio-fs-* vmlinux-virtiofs.container
  ln -sf vmlinuz-virtio-fs-* vmlinuz-virtiofs.container
  # bash-specific behavior?
  ln -s vmlinux-[0-9].[0-9]* vmlinux.container
  ln -s vmlinuz-[0-9].[0-9]* vmlinuz.container
}
