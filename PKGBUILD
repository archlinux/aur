pkgbase=kata-containers-git
pkgname=(kata-ksm-throttler-git kata-proxy-git kata-runtime-git kata-shim-git kata-agent-git kata-containers-image-git kata-linux-container-git)
pkgver=1.10.0~rc0~runtime.r31.3ea682d6
_pkgver=1.10.0-rc0
pkgrel=1
pkgdesc="Lightweight virtual machines for containers"
arch=('x86_64')
url="https://katacontainers.io/"
license=('Apache')
makedepends=('go-pie')
_gh_org="github.com/kata-containers"
source=(
  "agent::git+https://${_gh_org}/agent"
  "ksm-throttler::git+https://${_gh_org}/ksm-throttler"
  "osbuilder::git+https://${_gh_org}/osbuilder"
  "proxy::git+https://${_gh_org}/proxy"
  "runtime::git+https://${_gh_org}/runtime"
  "shim::git+https://${_gh_org}/shim"
  "https://${_gh_org}/runtime/releases/download/${_pkgver}/kata-static-${_pkgver}-${CARCH}.tar.xz"
)
sha512sums=(
  'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
  'f0e69db2327f87234b053c554793ee28f0f102835e1778e85772d14c90c0caf63890541a780cc5439e08d39a419fa86bd5ff4750228c93f70f2511328afe1aa5'
)

pkgver(){
    cd "${srcdir}/src/${_gh_org}/runtime"
    GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"
    printf '%s.r%s.%s' \
        "${GITTAG/-/\~}~runtime" \
        "$(git rev-list --count ${GITTAG}..)" \
        "$(git rev-parse --short HEAD)"
}

prepare(){
  mkdir -p "${srcdir}/src/${_gh_org}"
  for i in agent ksm-throttler proxy runtime shim; do
    rm -rf "${srcdir}/src/${_gh_org}/${i}"
    mv "${srcdir}/${i}" "${srcdir}/src/${_gh_org}/${i}"
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

package_kata-agent-git(){
  conflicts=('kata-agent')
  provides=('kata-agent')
  cd "${srcdir}/src/${_gh_org}/agent"
  GOPATH="${srcdir}" make install DESTDIR="${pkgdir}" BINDIR="/usr/bin" PKGLIBEXECDIR="/usr/lib/kata-containers" LIBEXECDIR="/usr/lib"
}

package_kata-ksm-throttler-git(){
  conflicts=('kata-ksm-throttler')
  provides=('kata-ksm-throttler')
  cd "${srcdir}/src/${_gh_org}/ksm-throttler"
  GOPATH="${srcdir}" make install DESTDIR="${pkgdir}" BINDIR="/usr/bin" PKGLIBEXECDIR="/usr/lib/kata-containers" LIBEXECDIR="/usr/lib"
  install -d -m 0755 "${pkgdir}/var/lib/vc/{firecracker,sbs,uuid}"
}

package_kata-proxy-git(){
  conflicts=('kata-proxy')
  provides=('kata-proxy')
  cd "${srcdir}/src/${_gh_org}/proxy"
  GOPATH="${srcdir}" make install DESTDIR="${pkgdir}" BINDIR="/usr/bin" PKGLIBEXECDIR="/usr/lib/kata-containers" LIBEXECDIR="/usr/lib"
}

package_kata-runtime-git(){
  conflicts=('kata-runtime')
  provides=('kata-runtime')
  depends=('qemu-headless' "kata-ksm-throttler=${pkgver}" "kata-proxy=${pkgver}" "kata-shim=${pkgver}" "kata-linux-container=${pkgver}" "kata-containers-image=${pkgver}")
  optdepends=(
    'firecracker'
    'cloud-hypervisor'
    #'acrn'
  )
  install=kata-runtime.install
  cd "${srcdir}/src/${_gh_org}/runtime"
  GOPATH="${srcdir}" make install DESTDIR="${pkgdir}" BINDIR="/usr/bin" PKGLIBEXECDIR="/usr/lib/kata-containers" LIBEXECDIR="/usr/lib"
}

package_kata-shim-git(){
  conflicts=('kata-shim')
  provides=('kata-shim')
  cd "${srcdir}/src/${_gh_org}/shim"
  GOPATH="${srcdir}" make install DESTDIR="${pkgdir}" BINDIR="/usr/bin" PKGLIBEXECDIR="/usr/lib/kata-containers" LIBEXECDIR="/usr/lib"
}

package_kata-containers-image-git(){
  conflicts=('kata-containers-image')
  provides=('kata-containers-image')
  install -Dm644 -t "${pkgdir}/usr/share/kata-containers/" \
    ${srcdir}/opt/kata/share/kata-containers/kata-containers-image_clearlinux_${_pkgver}_agent_*.img \
    ${srcdir}/opt/kata/share/kata-containers/kata-containers-initrd_alpine_${_pkgver}_agent_*.initrd
  cd "${pkgdir}/usr/share/kata-containers/"
  ln -s kata-containers-image_clearlinux_${_pkgver}_agent_*.img kata-containers.img
  ln -s kata-containers-initrd_alpine_${_pkgver}_agent_*.initrd kata-containers-initrd.img
}

package_kata-linux-container-git(){
  conflicts=('kata-linux-container')
  provides=('kata-linux-container')
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
