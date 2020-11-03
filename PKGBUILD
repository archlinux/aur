# Maintainer: zer0def <zer0def@github>
# Contributor: Kaushal M <kshlmster cat gmail dog com>
# Contributor: Stefan Zwanenburg <stefan cat zwanenburg dog info>
pkgbase=kata-containers-guest
pkgname=(
  kata-agent
  kata-linux-container
  #kata-containers-image
)
pkgver=1.11.4
_pkgver=${pkgver/\~/-}
pkgrel=1
pkgdesc="Lightweight virtual machines for containers (guest components)"
arch=('x86_64')
url="https://katacontainers.io/"
license=('Apache')
makedepends=(
  'go<2:1.15'  # thanks Intel, love you big time: https://github.com/kata-containers/runtime/issues/2982
  'yq2-bin'  # quietly pulled by Kata's codebase to read versions.yaml from repo
  'mkinitcpio'  # initrd build
  'udisks2'  # rootless image build
)

_gh_org="github.com/kata-containers"
_kata_kernel_ver="${KATA_KERNEL_VER:-5.4.32}"
_arch_bootstrap_ver="${ARCH_BOOTSTRAP_VER:-2020.11.01}"

source=(
  "agent-${_pkgver}.tar.gz::https://${_gh_org}/agent/archive/${_pkgver}.tar.gz"
  "osbuilder-${_pkgver}.tar.gz::https://${_gh_org}/osbuilder/archive/${_pkgver}.tar.gz"
  "packaging-${_pkgver}.tar.gz::https://${_gh_org}/packaging/archive/${_pkgver}.tar.gz"

  "https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-${_kata_kernel_ver}.tar.xz"
  "https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-${_kata_kernel_ver}.tar.sign"

  "http://mirrors.evowise.com/archlinux/iso/${_arch_bootstrap_ver}/archlinux-bootstrap-${_arch_bootstrap_ver}-x86_64.tar.gz"
  "http://mirrors.evowise.com/archlinux/iso/${_arch_bootstrap_ver}/archlinux-bootstrap-${_arch_bootstrap_ver}-x86_64.tar.gz.sig"
)
sha512sums=(
  "e0af374e279899a010ab66ed4fd4caff33c91d2cc19711f5e51302041cd49e69a71909d71092042bf0c4070acbbc5421f5c6cca49c55a4c332c060e745cf5a0c"
  "b8f8998229e2f12491cf6f9262cf8889353e83c58e93010ca3f328f77b61f89fb33d9209b21a1babae406f60b915011edb0832b803dd31b32115dfffa1b2edb1"
  "867f8fbf9c589535a10696a14c26aa6b9b3c6344690105489d55ed1287bdbd56909eb8052a22b4be98e8eb697fc57021212780ff41e478438c71a5c20d7446ad"

  "${KATA_KERNEL_SUM_SHA512:-197f292fa541031071b8ed64880a3d4251fa65059747cbdf3900b8f934d17f681b506ca5f70132899bdef343d2d249a7902215d2ea04af5410599f1e50d6cbac}"
  "SKIP"

  "${ARCH_BOOTSTRAP_SUM_SHA512:-91a3f0a1cbc7addb1941bc583b364b411e28223580980063ddc950cf4a0d247b0c40dbac6462f39d4d2f20102a8ff643b02179fa7dba685ae588962ea778c5d3}"
  "SKIP"
)
b2sums=(
  "94e996c463f0c5517bc6d97af2cb0f1dbadccd7e5f2ef5c45ea15d1deb5af65770371f25a0b9421ba70fa50a0b8c22c7d5a443173515ad4c5db30c1fa72cd395"
  "6c30855fc7d5298dbe8c6b7e294edbf840e123083fecfa3d73d91e741dcca70af6ca0c10672eb6fa24dd886b3ebddccefcff943b4c816ce65c2f05588947660e"
  "6194835f2526a7b16e5b8ca97fb831fdfb78a951dec51c8640c8cff6efd5186ed051e717ff748af7913bdf339f5a69e1b5c9aff2d70c732a4876481ac6fb59ea"

  "${KATA_KERNEL_SUM_B2:-0ac78d1eb97ce4689ccdab01fb1475d07f29a90251b44b05fcf030d2f9aa644ac9dbb1315c7fe1eb991ef1435b7f17669e2b4f66187e3404599a0f136d2b1a50}"
  "SKIP"

  "${ARCH_BOOTSTRAP_SUM_B2:-ce8bfce07a121780e6a09f2b652b0be3fb3c728cd0cccedaad4add394784a6ded18c5163d2a999fc8043cdc9eb6fc347aa6a26a990b31f1f4a445f83460eccc3}"
  "SKIP"
)
noextract=("archlinux-bootstrap-${_arch_bootstrap_ver}-x86_64.tar.gz")
validpgpkeys=(
  647F28654894E3BD457199BE38DBBDC86092693E  # kernel
  4AA4767BBC9C4B1D18AE28B77F2D434B9741E8AC  # arch
)

case "${CARCH}" in
  x86_64)     _KARCH=x86_64;;
  aarch64)    _KARCH=arm64;;
  s390|s390x) _KARCH=s390;;
  ppc64le)    _KARCH=powerpc;;
esac

_kernel_prepare(){
  # kata-linux-container prep (ref: https://github.com/kata-containers/packaging/tree/master/kernel )
  cd "${srcdir}/linux-${_kata_kernel_ver}"
  #for p in $(find "${srcdir}/packaging-${_pkgver}/obs-packaging/linux-container/patches" -type f -name "*.patch"); do
  #  patch -p1 <"${p}"
  #done

  # kernel config prep from upstream ("${srcdir}/packaging-${_pkgver}/obs-packaging/linux-container/kata-linux-container.spec-template")
  make -s mrproper
  rm -f .config

  local -r _KCONFIG="$(find "${srcdir}/packaging-${_pkgver}/kernel/configs" -type f -name "${_KARCH}_kata_kvm_${_kata_kernel_ver%.*}.x")"
  if [ -z "${_KCONFIG}" ]; then
    KCONFIG_CONFIG=.config ARCH=${_KARCH} scripts/kconfig/merge_config.sh -r -n "${srcdir}/packaging-${_pkgver}/kernel/configs/fragments/common/"*.conf "${srcdir}/packaging-${_pkgver}/kernel/configs/fragments/${_KARCH}/"*.conf
  else
    install -D -m 0644 "${_KCONFIG}" .config
  fi
  make -s ARCH="${_KARCH}" oldconfig
}

prepare(){
  _kernel_prepare

  install -dm0755 "${srcdir}/bin"
  ln -sf "$(type -p yq)" "${srcdir}/bin/yq"

  install -dm0755 "${srcdir}/src/${_gh_org}"
  mv "${srcdir}/agent-${_pkgver}" "${srcdir}/src/${_gh_org}/agent"
}

_kata_image_build(){
  # rootfs and initrd build (it's horrid, but somewhat works)
  local -r _ROOTFS_DIR="${srcdir}/osbuilder-${_pkgver}/rootfs-builder/rootfs"

  # build rootfs
  install -D -m 0644 "${srcdir}/rootfs-builder-config.sh" "${srcdir}/osbuilder-${_pkgver}/rootfs-builder/archlinux/config.sh"
  install -D -m 0644 "${srcdir}/rootfs-builder-lib.sh" "${srcdir}/osbuilder-${_pkgver}/rootfs-builder/archlinux/rootfs_lib.sh"

  cd "${srcdir}/osbuilder-${_pkgver}/rootfs-builder"
  GOPATH="${srcdir}" AGENT_SOURCE_BIN="${srcdir}/src/${_gh_org}/agent/kata-agent" ROOTFS_DIR="${_ROOTFS_DIR}" ./rootfs.sh archlinux

  # rootfs image (need to bypass root requirement somehow)
  cd "${srcdir}/osbuilder-${_pkgver}/image-builder"
  ./image_builder.sh "${_ROOTFS_DIR}"
}

build(){
  cd "${srcdir}/src/${_gh_org}/agent"
  GOPATH="${srcdir}" LDFLAGS="" make

  # kernel build
  cd "${srcdir}/linux-${_kata_kernel_ver}"
  make -s ARCH="${_KARCH}"

  #_kata_image_build
}

package_kata-agent(){
  cd "${srcdir}/src/${_gh_org}/agent"
  GOPATH="${srcdir}" make install DESTDIR="${pkgdir}" BINDIR="/usr/bin" PKGLIBEXECDIR="/usr/lib/kata-containers" LIBEXECDIR="/usr/lib"
}

package_kata-containers-image(){
  local -r _img_filename="kata-containers-${_pkgver%%~*}-arch-systemd-image.img" _initrd_filename="kata-containers-${_pkgver%%~*}-arch-agent-initrd.img"
  #install -D -m 0644 "${srcdir}/osbuilder-${_pkgver}/image-builder/kata-containers.img" "${pkgdir}/usr/share/kata-containers/${_img_filename}"
  install -D -m 0644 "${srcdir}/osbuilder-${_pkgver}/initrd-builder/kata-containers-initrd.img" "${pkgdir}/usr/share/kata-containers/${_initrd_filename}"
  pushd "${pkgdir}/usr/share/kata-containers"
  #ln -sf "${_img_filename}" "kata-containers-arch.img"
  ln -sf "${_initrd_filename}" "kata-containers-arch-initrd.img"
  popd
}

package_kata-linux-container(){
  install -D -m 0644 "${srcdir}/linux-${_kata_kernel_ver}/vmlinux" "${pkgdir}/usr/share/kata-containers/vmlinux-${_kata_kernel_ver}.container"
  pushd "${pkgdir}/usr/share/kata-containers"
  ln -sf "vmlinux-${_kata_kernel_ver}.container" vmlinux.container
  if [ "${_KARCH}" = "powerpc" ]; then
    ln -sf "vmlinux-${_kata_kernel_ver}.container" "vmlinuz-${_kata_kernel_ver}.container"
    ln -sf "vmlinuz-${_kata_kernel_ver}.container" vmlinuz.container
  else
    # param out bzImage for other archs?
    install -D -m 0644 "${srcdir}/linux-${_kata_kernel_ver}/arch/${_KARCH}/boot/bzImage" "${pkgdir}/usr/share/kata-containers/vmlinuz-${_kata_kernel_ver}.container"
    ln -sf "vmlinuz-${_kata_kernel_ver}.container" vmlinuz.container
  fi
  popd
}
