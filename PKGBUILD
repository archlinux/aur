pkgbase=kata1-containers-git
pkgname=(
  kata1-ksm-throttler-git
  kata1-runtime-git
  kata1-proxy-git
  kata1-shim-git
)
pkgver=1.13.0~alpha0~runtime.r0.cd63aacc
pkgrel=1
pkgdesc="Lightweight virtual machines for containers (Git version)"
arch=('x86_64')
url="https://katacontainers.io/"
license=('Apache')
makedepends=(
  'go1.15'
  #'yq2-bin'
  'bc'
  'git'
)
_gh_org="github.com/kata-containers"
source=(
  "ksm-throttler::git+https://${_gh_org}/ksm-throttler"
  "proxy::git+https://${_gh_org}/proxy"
  "runtime::git+https://${_gh_org}/runtime"
  "shim::git+https://${_gh_org}/shim"
)
sha512sums=(SKIP SKIP SKIP SKIP)
b2sums=(SKIP SKIP SKIP SKIP)

pkgver(){
  cd "${srcdir}/src/${_gh_org}/runtime"
  GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"
  printf '%s.r%s.%s' \
    "${GITTAG/-/\~}~runtime" \
    "$(git rev-list --count ${GITTAG}..)" \
    "$(git rev-parse --short HEAD)"
}

prepare(){
  # kata-runtime makedep
  install -dm0755 "${srcdir}/bin"
  #ln -sf "$(command -v yq)" "${srcdir}/bin/yq"
  ln -sf "$(command -v go1.15)" "${srcdir}/bin/go"
  export PATH="${srcdir}/bin${PATH:+:${PATH}}"

  mkdir -p "${srcdir}/src/${_gh_org}"
  for i in ksm-throttler proxy runtime shim; do
    rm -rf "${srcdir}/src/${_gh_org}/${i}"
    mv "${srcdir}/${i}" "${srcdir}/src/${_gh_org}/${i}"
  done
}

build(){
  for i in ksm-throttler proxy runtime shim; do
    echo "Building kata-${i}…"
    cd "${srcdir}/src/${_gh_org}/${i}"
    GOPATH="${srcdir}" make DESTDIR="${pkgdir}" BINDIR="/usr/bin" PKGLIBEXECDIR="/usr/lib/kata-containers" LIBEXECDIR="/usr/lib"
  done
}

package_kata1-ksm-throttler-git(){
  conflicts=('kata1-ksm-throttler')
  provides=('kata1-ksm-throttler')
  cd "${srcdir}/src/${_gh_org}/ksm-throttler"
  GOPATH="${srcdir}" make install DESTDIR="${pkgdir}" BINDIR="/usr/bin" PKGLIBEXECDIR="/usr/lib/kata-containers" LIBEXECDIR="/usr/lib"
  install -d -m 0755 "${pkgdir}/var/lib/vc/{firecracker,sbs,uuid}"
}

package_kata1-proxy-git(){
  conflicts=('kata1-proxy')
  provides=('kata1-proxy')
  cd "${srcdir}/src/${_gh_org}/proxy"
  GOPATH="${srcdir}" make install DESTDIR="${pkgdir}" BINDIR="/usr/bin" PKGLIBEXECDIR="/usr/lib/kata-containers" LIBEXECDIR="/usr/lib"
}

package_kata1-runtime-git(){
  conflicts=('kata1-runtime')
  provides=('kata1-runtime')
  depends=('qemu-headless' "kata1-proxy" "kata1-shim" "kata1-linux-container" "kata1-containers-image")
  optdepends=(
    'kata1-ksm-throttler'
    'firecracker'
    'cloud-hypervisor'
    #'acrn'
  )
  install=kata-runtime.install
  cd "${srcdir}/src/${_gh_org}/runtime"
  GOPATH="${srcdir}" make install DESTDIR="${pkgdir}" BINDIR="/usr/bin" PKGLIBEXECDIR="/usr/lib/kata-containers" LIBEXECDIR="/usr/lib"
}

package_kata1-shim-git(){
  conflicts=('kata1-shim')
  provides=('kata1-shim')
  cd "${srcdir}/src/${_gh_org}/shim"
  GOPATH="${srcdir}" make install DESTDIR="${pkgdir}" BINDIR="/usr/bin" PKGLIBEXECDIR="/usr/lib/kata-containers" LIBEXECDIR="/usr/lib"
}
