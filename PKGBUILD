pkgbase=kata-containers-git
pkgname=(
  kata-agent-git
  kata-ksm-throttler-git
  kata-runtime-git
  kata-proxy-git
  kata-shim-git

  kata-linux-container-git
  #kata-containers-image-git
)
pkgver=1.12.0~rc0~runtime.r9.9380b6e1
pkgrel=1
pkgdesc="Lightweight virtual machines for containers (Git version)"
arch=('x86_64')
url="https://katacontainers.io/"
license=('Apache')
makedepends=(
  'go<2:1.15'  # thanks Intel, love you big time: https://github.com/kata-containers/runtime/issues/2982
  'yq2-bin'
  'bc'
  'git'
)

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

  "https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-${_kata_kernel_ver}.tar.xz"
  "https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-${_kata_kernel_ver}.tar.sign"
  #"http://mirrors.evowise.com/archlinux/iso/2020.08.01/archlinux-bootstrap-2020.08.01-x86_64.tar.gz"
  #"http://mirrors.evowise.com/archlinux/iso/2020.08.01/archlinux-bootstrap-2020.08.01-x86_64.tar.gz.sig"

  "0001-osbuilder-goversion.patch"
  "rootfs-builder-config.sh"
  "rootfs-builder-lib.sh"
)
sha512sums=(
  SKIP SKIP SKIP SKIP SKIP SKIP SKIP

  fb9ebada932c17d0adbc099a1df31a7d97afe3be694665b1f8171e7159bda84a36a435ceecfdce6d492d8e5075ed4253c68029dcdf952e75a3fe7ee36646327b
  SKIP
  #24044fb5a9870dbe13ec7eafb60d99e664cec10d50d80a73a0445d1368c0fa95881003d92e0a1c0446f76c1bbe89b098f35ceffd0ef24e9beaa51f1a83494b98
  #SKIP

  0cac0aa5d0f7f0d49da9185bc71ce05a089d6339ad0d660905e18724b30381cbe3fb84b56b0de21def793ca52c945f02b99f81a6b4e77e2398da250ec8e4ff6b
  375990194988a019f2429ed85eb996222929a028a52ec609de106df8939704db6654af6d92aec5e192693d7758fc9561f236bbb29df319c2d506b5b2d2b16553
  e987501a16828636b3da5cfa7b4c3af5e981aab20dee4b97d10daf8625de92e77203f7ccbfa2beff8700b32371ffa4d9f94f97216fe6abb13a475984cdf5d6e3
)
b2sums=(
  SKIP SKIP SKIP SKIP SKIP SKIP SKIP

  1f6296eb9be00329b1eb015eafb4a965c575ded58b8618cfc0af3d15072c424afbbc029fad4d65e0af3bccc5963c4304c14b4a9d4763cfaec9b4596834a0f9b0
  SKIP
  #24044fb5a9870dbe13ec7eafb60d99e664cec10d50d80a73a0445d1368c0fa95881003d92e0a1c0446f76c1bbe89b098f35ceffd0ef24e9beaa51f1a83494b98
  #SKIP

  fac2f30e6d8613e23fcb84df14b589e515510e719c3510f91db48100d6ae9284d4b71f6267f634bcd571034c0583d3b88c3a4ddfb26e51b0f08c1042f7213ef9
  a0d55c2fbd3d94859c156e7f68033091430d523e374a7058cbcbe029cb9dc41c5c6c56560425c698438f66ab3754423f656885962ac40d8cd5aeb2f8039a77c9
  1c4994e2f925e7ca16298d135a29b92f55ad15b821d47ef1677d472514a906a6957022ca8366b5f4d1f4b33c6d727eebd08bb3e9d47f67851b35ab7b8bc396b8
)
noextract=('archlinux-bootstrap-2020.08.01-x86_64.tar.gz')
validpgpkeys=(
  647F28654894E3BD457199BE38DBBDC86092693E  # kernel
)

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

_kernel_prepare(){
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
}

prepare(){
  _kernel_prepare

  # kata-container-image osbuilder fix
  cd "${srcdir}/osbuilder"
  patch -p1 < "${srcdir}/0001-osbuilder-goversion.patch"

  # kata-runtime makedep
  mkdir -p "${srcdir}/bin"
  ln -sf "$(type -p yq)" "${srcdir}/bin/yq"

  mkdir -p "${srcdir}/src/${_gh_org}"
  for i in agent ksm-throttler proxy runtime shim; do
    rm -rf "${srcdir}/src/${_gh_org}/${i}"
    mv "${srcdir}/${i}" "${srcdir}/src/${_gh_org}/${i}"
  done
}

_kata_image_build(){
  # rootfs and initrd build (it's horrid, but somewhat works)
  _ROOTFS_DIR="${srcdir}/osbuilder/rootfs-builder/rootfs"

  # build rootfs
  install -D -m 0644 "${srcdir}/rootfs-builder-config.sh" "${srcdir}/osbuilder/rootfs-builder/archlinux/config.sh"
  install -D -m 0644 "${srcdir}/rootfs-builder-lib.sh" "${srcdir}/osbuilder/rootfs-builder/archlinux/rootfs_lib.sh"

  cd "${srcdir}/osbuilder/rootfs-builder"
  GOPATH="${srcdir}" AGENT_SOURCE_BIN="${srcdir}/src/${_gh_org}/agent/kata-agent" ROOTFS_DIR="${_ROOTFS_DIR}" ./rootfs.sh archlinux

  # rootfs image (need to bypass root requirement somehow)
  cd "${srcdir}/osbuilder/image-builder"
  ./image_builder.sh "${_ROOTFS_DIR}"

  # initrd
  cd "${srcdir}/osbuilder/initrd-builder"
  ./initrd_builder.sh "${_ROOTFS_DIR}"
}

build(){
  cd "${srcdir}/src/${_gh_org}/agent"
  echo "Building kata-agent…"
  GOPATH="${srcdir}" LDFLAGS="" make

  # kernel build
  cd "${srcdir}/linux-${_kata_kernel_ver}"
  make -s ARCH="${_KARCH}"

  #_kata_image_build

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
  depends=('qemu-headless' "kata-proxy" "kata-shim" "kata-linux-container" "kata-containers-image")
  optdepends=(
    'kata-ksm-throttler'
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
