pkgbase=kata-containers-git
pkgname=(
  kata-agent-git
  kata-ksm-throttler-git
  kata-runtime-git
  kata-proxy-git
  kata-shim-git

  #kata-linux-container-git
  #kata-containers-image-git
)
pkgver=1.12.0~alpha0~runtime.r72.a1d993fa
pkgrel=1
pkgdesc="Lightweight virtual machines for containers (Git version)"
arch=('x86_64')
url="https://katacontainers.io/"
license=('Apache')
makedepends=('go' 'yq2-bin' 'bc')
_gh_org="github.com/kata-containers"
_kata_kernel_ver="5.4.60"
source=(
  "agent::git+https://${_gh_org}/agent"
  "ksm-throttler::git+https://${_gh_org}/ksm-throttler"
  "osbuilder::git+https://${_gh_org}/osbuilder"
  "packaging::git+https://${_gh_org}/packaging"
  "proxy::git+https://${_gh_org}/proxy"
  "runtime::git+https://${_gh_org}/runtime"
  "shim::git+https://${_gh_org}/shim"
)
sha512sums=(SKIP SKIP SKIP SKIP SKIP SKIP SKIP)

if [[ " ${pkgname[@]} " =~ " kata-linux-container-git " ]]; then
  source+=(
    "https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-${_kata_kernel_ver}.tar.xz"
    "http://mirrors.evowise.com/archlinux/iso/2020.08.01/archlinux-bootstrap-2020.08.01-x86_64.tar.gz"
    "http://mirrors.evowise.com/archlinux/iso/2020.08.01/archlinux-bootstrap-2020.08.01-x86_64.tar.gz.sig"

    "0001-osbuilder-goversion.patch"
    "rootfs-builder-config.sh"
    "rootfs-builder-Dockerfile.in"  # unfit for use yet
    "rootfs-builder-lib.sh"
  )
  sha512sums+=(
    fb9ebada932c17d0adbc099a1df31a7d97afe3be694665b1f8171e7159bda84a36a435ceecfdce6d492d8e5075ed4253c68029dcdf952e75a3fe7ee36646327b
    24044fb5a9870dbe13ec7eafb60d99e664cec10d50d80a73a0445d1368c0fa95881003d92e0a1c0446f76c1bbe89b098f35ceffd0ef24e9beaa51f1a83494b98
    SKIP

    0cac0aa5d0f7f0d49da9185bc71ce05a089d6339ad0d660905e18724b30381cbe3fb84b56b0de21def793ca52c945f02b99f81a6b4e77e2398da250ec8e4ff6b
    375990194988a019f2429ed85eb996222929a028a52ec609de106df8939704db6654af6d92aec5e192693d7758fc9561f236bbb29df319c2d506b5b2d2b16553
    352c9ac91eb03d5fd28da6e6f1d1fce7daa0d557d34457e624dadc0dd28e6051cdcf580029c793558980391d86df54d22b59daaf85b00590bec430c3f4f06c89
    e987501a16828636b3da5cfa7b4c3af5e981aab20dee4b97d10daf8625de92e77203f7ccbfa2beff8700b32371ffa4d9f94f97216fe6abb13a475984cdf5d6e3
  )
  noextract=('archlinux-bootstrap-2020.08.01-x86_64.tar.gz')
  _build_artifacts="yes"
fi

case "${CARCH}" in
  x86_64)     _KARCH=x86_64;;
  aarch64)    _KARCH=arm64;;
  s390|s390x) _KARCH=s390;;
  ppc64le)    _KARCH=powerpc;;
esac

pkgver(){
  cd "${srcdir}/src/${_gh_org}/runtime"
  GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"
  printf '%s.r%s.%s' \
    "${GITTAG/-/\~}~runtime" \
    "$(git rev-list --count ${GITTAG}..)" \
    "$(git rev-parse --short HEAD)"
}

prepare(){
  if [ "${_build_artifacts}" = "yes" ]; then
    # kata-linux-container prep (ref: https://github.com/kata-containers/packaging/tree/master/kernel )
    cd "${srcdir}/linux-${_kata_kernel_ver}"
    #for p in $(find "${srcdir}/packaging/obs-packaging/linux-container/patches" -type f -name "*.patch"); do
    #  patch -p1 <"${p}"
    #done

    # kernel config prep from upstream ("${srcdir}/packaging/obs-packaging/linux-container/kata-linux-container.spec-template")
    make -s mrproper
    rm -f .config

    _KCONFIG="$(find "${srcdir}/packaging/kernel/configs" -type f -name "${_KARCH}_kata_kvm_${_kata_kernel_ver%.*}.x")"
    if [ -z "${_KCONFIG}" ]; then
      KCONFIG_CONFIG=.config ARCH=${_KARCH} scripts/kconfig/merge_config.sh -r -n "${srcdir}/packaging/kernel/configs/fragments/common/"*.conf "${srcdir}/packaging/kernel/configs/fragments/${_KARCH}/"*.conf
    else
      install -D -m 0644 "${_KCONFIG}" .config
    fi
    make -s ARCH="${_KARCH}" oldconfig

    # kata-container-image osbuilder fix
    cd "${srcdir}/osbuilder"
    patch -p1 < "${srcdir}/0001-osbuilder-goversion.patch"
  fi

  # kata-runtime makedep
  mkdir -p "${srcdir}/bin"
  ln -sf "$(type -p yq)" "${srcdir}/bin/yq"

  mkdir -p "${srcdir}/src/${_gh_org}"
  for i in agent ksm-throttler proxy runtime shim; do
    rm -rf "${srcdir}/src/${_gh_org}/${i}"
    mv "${srcdir}/${i}" "${srcdir}/src/${_gh_org}/${i}"
  done
}

build(){
  cd "${srcdir}/src/${_gh_org}/agent"
  echo "Building kata-agent…"
  GOPATH="${srcdir}" LDFLAGS="" make

  if [ "${_build_artifacts}" = "yes" ]; then
    # kernel build
    cd "${srcdir}/linux-${_kata_kernel_ver}"
    echo "Building kata-linux-container…"
    make -s ARCH="${_KARCH}"

    # rootfs and initrd build (it's horrid, but somewhat works)
    echo "Building kata-containers-image…"
    _ROOTFS_DIR="${srcdir}/osbuilder/rootfs-builder/rootfs"

    # build rootfs
    install -D -m 0644 "${srcdir}/rootfs-builder-config.sh" "${srcdir}/osbuilder/rootfs-builder/archlinux/config.sh"
    install -D -m 0644 "${srcdir}/rootfs-builder-Dockerfile.in" "${srcdir}/osbuilder/rootfs-builder/archlinux/Dockerfile.in"
    install -D -m 0644 "${srcdir}/rootfs-builder-lib.sh" "${srcdir}/osbuilder/rootfs-builder/archlinux/rootfs_lib.sh"

    cd "${srcdir}/osbuilder/rootfs-builder"
    GOPATH="${srcdir}" AGENT_SOURCE_BIN="${srcdir}/src/${_gh_org}/agent/kata-agent" ROOTFS_DIR="${_ROOTFS_DIR}" ./rootfs.sh archlinux

    # rootfs image (need to bypass root requirement somehow)
    cd "${srcdir}/osbuilder/image-builder"
    #./image_builder.sh "${_ROOTFS_DIR}"

    # initrd
    cd "${srcdir}/osbuilder/initrd-builder"
    ./initrd_builder.sh "${_ROOTFS_DIR}"
  fi

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

package_kata-containers-image-git(){
  conflicts=('kata-containers-image')
  provides=('kata-containers-image')
  #install -D -m 0644 "${srcdir}/osbuilder/image-builder/kata-containers.img" "${pkgdir}/usr/share/kata-containers/kata-containers-image_archlinux_${pkgver%%~*}_agent_git.img"
  install -D -m 0644 "${srcdir}/osbuilder/initrd-builder/kata-containers-initrd.img" "${pkgdir}/usr/share/kata-containers/kata-containers-initrd_archlinux_${pkgver%%~*}_agent_git.initrd"
  cd "${pkgdir}/usr/share/kata-containers"
  #ln -sf "kata-containers-image_archlinux_${pkgver%%~*}_agent_git.img" "kata-containers.img"
  ln -sf "kata-containers-initrd_archlinux_${pkgver%%~*}_agent_git.initrd" "kata-containers-initrd.img"
}

package_kata-ksm-throttler-git(){
  conflicts=('kata-ksm-throttler')
  provides=('kata-ksm-throttler')
  cd "${srcdir}/src/${_gh_org}/ksm-throttler"
  GOPATH="${srcdir}" make install DESTDIR="${pkgdir}" BINDIR="/usr/bin" PKGLIBEXECDIR="/usr/lib/kata-containers" LIBEXECDIR="/usr/lib"
  install -d -m 0755 "${pkgdir}/var/lib/vc/{firecracker,sbs,uuid}"
}

package_kata-linux-container-git(){
  conflicts=('kata-linux-container')
  provides=('kata-linux-container')
  install -D -m 0644 "${srcdir}/linux-${_kata_kernel_ver}/vmlinux" "${pkgdir}/usr/share/kata-containers/vmlinux-${_kata_kernel_ver}.container"
  cd "${pkgdir}/usr/share/kata-containers"
  ln -sf "vmlinux-${_kata_kernel_ver}.container" vmlinux.container
  if [ "${_KARCH}" = "powerpc" ]; then
    ln -sf "vmlinux-${_kata_kernel_ver}.container" "vmlinuz-${_kata_kernel_ver}.container"
    ln -sf "vmlinuz-${_kata_kernel_ver}.container" vmlinuz.container
  else
    # param out bzImage for other archs?
    install -D -m 0644 "${srcdir}/linux-${_kata_kernel_ver}/arch/${_KARCH}/boot/bzImage" "${pkgdir}/usr/share/kata-containers/vmlinuz-${_kata_kernel_ver}.container"
    ln -sf "vmlinuz-${_kata_kernel_ver}.container" vmlinuz.container
  fi
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
