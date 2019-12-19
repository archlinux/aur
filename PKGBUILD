pkgbase=kata-containers-git
pkgname=(kata-ksm-throttler-git kata-proxy-git kata-runtime-git kata-shim-git kata-agent-git)
pkgver=1.10.0~rc0~runtime.r33.a198efcf
_pkgver=1.10.0-rc0
pkgrel=2
pkgdesc="Lightweight virtual machines for containers (Git version)"
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
)
sha512sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

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
  depends=('qemu-headless' "kata-ksm-throttler" "kata-proxy" "kata-shim" "kata-linux-container" "kata-containers-image")
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
