# Maintainer: zer0def <zer0def@github>
# Contributor: Kaushal M <kshlmster cat gmail dog com>
# Contributor: Stefan Zwanenburg <stefan cat zwanenburg dog info>
pkgbase=kata2-containers
_pkgbase=kata-containers
pkgname=(
  kata2-agent
  kata2-runtime
  kata2-linux-container

  # this doesn't work, but exists for completeness of source build
  #kata2-containers-image
)
pkgver=2.0.0
_pkgver=${pkgver/\~/-}
pkgrel=1
pkgdesc="Lightweight virtual machines for containers"
arch=('x86_64')
url="https://katacontainers.io/"
license=('Apache')
makedepends=('go' 'bc' 'rust' 'git' 'udisks2')

_gh_org="github.com/kata-containers"
_kata_kernel_ver="5.4.71"
_arch_bootstrap_ver="2020.10.01"

source=("${_pkgbase}-${_pkgver}.tar.gz::https://${_gh_org}/kata-containers/archive/${_pkgver}.tar.gz")
sha512sums=(3106c05aa2ab613525ef4eff545059a9af864bf0fc44f67a5966ad9a0fb27cfd6c67f5d8f004a186a0d57ae52d419bce2462a6a751723a135b4419951eb78ef7)
b2sums=(818e5cf96e85d0116c350bf09666073579c1126d6c7ca23412352e0aebb0794605a42052317d2313c28e9dc24192f9436c996b202e5de5bf6868f2a2b22aba6f)

if [[ " ${pkgname[@]} " =~ " kata2-linux-container " ]]; then
  source+=(
    "https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-${_kata_kernel_ver}.tar.xz"
    "https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-${_kata_kernel_ver}.tar.sign"
  )
  sha512sums+=(
    2b9c83425c3fd40abb76197e65933d1f79c60b71b3eccc6e0dcbb6748001ccbd002366cc2b61a796536166f08d831478a840bcb1e19ca0531b7f180a451e4d1c
    SKIP
  )
  b2sums+=(
    450f91dd84df37cb16c6937e2a4cc55a8b2e5046b6396685cf2ae5a733a925ed5502944b5a60a1056827c788407fa3f916e04b48b9c8e3d68df6b0830039ff0b
    SKIP
  )
  _build_kernel="yes"
fi

if [[ " ${pkgname[@]} " =~ " kata2-containers-image " ]]; then
  source+=(
    "http://mirrors.evowise.com/archlinux/iso/${_arch_bootstrap_ver}/archlinux-bootstrap-${_arch_bootstrap_ver}-x86_64.tar.gz"
    "http://mirrors.evowise.com/archlinux/iso/${_arch_bootstrap_ver}/archlinux-bootstrap-${_arch_bootstrap_ver}-x86_64.tar.gz.sig"

    "image_builder.sh"
    "rootfs-builder-config.sh"
    "rootfs-builder-lib.sh"
  )
  sha512sums+=(
    0bbe8fd91b3f38b6035a72ba71bb2dd006a39dc13fd4c9b6dba6369f9d0ef8f0471ad96052a78cacd81572ef9fffe4694bdb8d14cc9053a0aaa628aec8bc47e2
    SKIP

    6f476297d9001eef9a0665689f752cf5124907522cfc87240df16488379a5c7c9820a6e33a576dbf7f75c4fdfa7cab7a0e395b05c9339069dedbdaac42fb6c04
    375990194988a019f2429ed85eb996222929a028a52ec609de106df8939704db6654af6d92aec5e192693d7758fc9561f236bbb29df319c2d506b5b2d2b16553
    f163aa40aea809e8cb9acdc78de6ea504e6fa608a3f71d5c62418a3f23390e006e5a6c81a0aa96a2f9319ff67ca31ae85084caf26df7bc61739f0a21a967d5ec
  )
  b2sums+=(
    5053da704b1d908ee2b413cb4f8c8d330035b8081cdeeb2e78191b2f67f3fc25c36b47db906a113c0c99134381162bc6660a47f4915d71599cfa8294a6398470
    SKIP

    1745aa5d5df0af2452381de163e3964511172e045c13736a062bb2c932e3306250d24992b2bdbc534ced188b35d3b1f4958a5680c99356afd3097d11c84aee31
    a0d55c2fbd3d94859c156e7f68033091430d523e374a7058cbcbe029cb9dc41c5c6c56560425c698438f66ab3754423f656885962ac40d8cd5aeb2f8039a77c9
    f1be90935e6201bb8d0c911d75d3c5f52ee6530ea8cd7b42f405bd09485e89e0465dcfe01648d2e3efe20bd19a84c19ae19f907ed1de90e940d9891c945393f6
  )
  noextract=("archlinux-bootstrap-${_arch_bootstrap_ver}-x86_64.tar.gz")
  _build_images="yes"
fi

case "${CARCH}" in
  x86_64)     _KARCH=x86_64;;
  aarch64)    _KARCH=arm64;;
  s390|s390x) _KARCH=s390;;
  ppc64le)    _KARCH=powerpc;;
esac

prepare(){
  if [ "${_build_kernel}" = "yes" ]; then
    # kata2-linux-container prep (ref: https://github.com/kata-containers/packaging/tree/master/kernel )
    cd "${srcdir}/linux-${_kata_kernel_ver}"
    #for p in $(find "${srcdir}/${_pkgbase}-${_pkgver}/tools/packaging/kernel/patches" -type f -name "*.patch"); do
    #  patch -p1 <"${p}"
    #done

    # kernel config prep from upstream ("${srcdir}/${_pkgbase}-${_pkgver}/tools/packaging/obs-packaging/linux-container/kata-linux-container.spec-template")
    make -s mrproper
    rm -f .config

    _KCONFIG="$(find "${srcdir}/${_pkgbase}-${_pkgver}/tools/packaging/kernel/configs" -type f -name "${_KARCH}_kata_kvm_${_kata_kernel_ver%.*}.x")"
    if [ -z "${_KCONFIG}" ]; then
      KCONFIG_CONFIG=.config ARCH=${_KARCH} scripts/kconfig/merge_config.sh -r -n "${srcdir}/${_pkgbase}-${_pkgver}/tools/packaging/kernel/configs/fragments/common/"*.conf "${srcdir}/${_pkgbase}-${_pkgver}/tools/packaging/kernel/configs/fragments/${_KARCH}/"*.conf
    else
      install -Dm 0644 "${_KCONFIG}" .config
    fi
    make -s ARCH="${_KARCH}" oldconfig
  fi

  # remove subrepos without the `install` makefile target
  sed -i \
    -e '/COMPONENTS += trace-forwarder/d' \
    -e '/TOOLS += agent-ctl/d' \
    "${srcdir}/${_pkgbase}-${_pkgver}/Makefile"
  [ "${_build_images}" = "yes" ] && install -m0755 "${srcdir}/image_builder.sh" "${srcdir}/${_pkgbase}-${_pkgver}/tools/osbuilder/image-builder/image_builder.sh" ||:
}

build(){
  cd "${srcdir}/${_pkgbase}-${_pkgver}"
  GOPATH="${srcdir}" make BINDIR="/usr/bin" PKGLIBEXECDIR="/usr/lib/kata-containers" LIBEXECDIR="/usr/lib" LIBC=gnu

  if [ "${_build_kernel}" = "yes" ]; then
    # kernel build
    cd "${srcdir}/linux-${_kata_kernel_ver}"
    echo "Building kata2-linux-container…"
    make -s ARCH="${_KARCH}"
  fi

  if [ "${_build_images}" = "yes" ]; then
    # rootfs and initrd build (it's horrid, but somewhat works)
    _ROOTFS_DIR="${srcdir}/${_pkgbase}-${_pkgver}/tools/osbuilder/rootfs-builder/rootfs"

    # build rootfs
    install -Dm 0644 "${srcdir}/rootfs-builder-config.sh" "${srcdir}/${_pkgbase}-${_pkgver}/tools/osbuilder/rootfs-builder/archlinux/config.sh"
    install -Dm 0644 "${srcdir}/rootfs-builder-lib.sh" "${srcdir}/${_pkgbase}-${_pkgver}/tools/osbuilder/rootfs-builder/archlinux/rootfs_lib.sh"

    cd "${srcdir}/${_pkgbase}-${_pkgver}/tools/osbuilder/rootfs-builder"
    GOPATH="${srcdir}" AGENT_SOURCE_BIN="${srcdir}/${_pkgbase}-${_pkgver}/src/agent/target/${_KARCH}-unknown-linux-gnu/release/kata-agent" ROOTFS_DIR="${_ROOTFS_DIR}" ARCH_BOOTSTRAP_VER="${_arch_bootstrap_ver}" fakeroot -- ./rootfs.sh archlinux

    # rootfs image (builds filesystem with uid:gid of building system user! beware!)
    cd "${srcdir}/${_pkgbase}-${_pkgver}/tools/osbuilder/image-builder"
    ./image_builder.sh -f ext4 "${_ROOTFS_DIR}"

    # initrd
    cd "${srcdir}/${_pkgbase}-${_pkgver}/tools/osbuilder/initrd-builder"
    ./initrd_builder.sh "${_ROOTFS_DIR}"
  fi
}

package_kata2-agent(){
  cd "${srcdir}/${_pkgbase}-${_pkgver}/src/agent"
  GOPATH="${srcdir}" make install DESTDIR="${pkgdir}" BINDIR="/usr/bin" PKGLIBEXECDIR="/usr/lib/kata-containers" LIBEXECDIR="/usr/lib" LIBC=gnu
}

package_kata2-containers-image(){
  install -Dm 0644 "${srcdir}/${_pkgbase}-${_pkgver}/tools/osbuilder/image-builder/kata-containers.img" "${pkgdir}/usr/share/kata-containers/kata-containers-image_archlinux_${_pkgver%%~*}_agent.img"
  install -Dm 0644 "${srcdir}/${_pkgbase}-${_pkgver}/tools/osbuilder/initrd-builder/kata-containers-initrd.img" "${pkgdir}/usr/share/kata-containers/kata-containers-initrd_archlinux_${_pkgver%%~*}_agent.initrd"
  cd "${pkgdir}/usr/share/kata-containers"
  ln -sf "kata-containers-image_archlinux_${_pkgver%%~*}_agent.img" "kata-containers.img"
  ln -sf "kata-containers-initrd_archlinux_${_pkgver%%~*}_agent.initrd" "kata-containers-initrd.img"
}

package_kata2-linux-container(){
  install -Dm 0644 "${srcdir}/linux-${_kata_kernel_ver}/vmlinux" "${pkgdir}/usr/share/kata-containers/vmlinux-${_kata_kernel_ver}.container"
  cd "${pkgdir}/usr/share/kata-containers"
  ln -sf "vmlinux-${_kata_kernel_ver}.container" vmlinux.container
  if [ "${_KARCH}" = "powerpc" ]; then
    ln -sf "vmlinux-${_kata_kernel_ver}.container" "vmlinuz-${_kata_kernel_ver}.container"
    ln -sf "vmlinuz-${_kata_kernel_ver}.container" vmlinuz.container
  else
    # param out bzImage for other archs?
    install -Dm 0644 "${srcdir}/linux-${_kata_kernel_ver}/arch/${_KARCH}/boot/bzImage" "${pkgdir}/usr/share/kata-containers/vmlinuz-${_kata_kernel_ver}.container"
    ln -sf "vmlinuz-${_kata_kernel_ver}.container" vmlinuz.container
  fi
}

package_kata2-runtime(){
  depends=('qemu-headless' "kata2-linux-container" "kata2-containers-image")
  optdepends=(
    'firecracker<0.22.0'
    'cloud-hypervisor<0.11.0'
  )
  install=kata2-runtime.install
  cd "${srcdir}/${_pkgbase}-${_pkgver}/src/runtime"
  GOPATH="${srcdir}" make install DESTDIR="${pkgdir}" BINDIR="/usr/bin" PKGLIBEXECDIR="/usr/lib/kata-containers" LIBEXECDIR="/usr/lib" LIBC=gnu
}
