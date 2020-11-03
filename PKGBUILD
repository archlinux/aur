# Maintainer: zer0def <zer0def@github>
# Contributor: Kaushal M <kshlmster cat gmail dog com>
# Contributor: Stefan Zwanenburg <stefan cat zwanenburg dog info>
pkgbase=kata-containers-guest
pkgname=(
  kata-agent
  kata-linux-container
  kata-containers-image
)
pkgver=1.11.4
_pkgver=${pkgver/\~/-}
pkgrel=4
pkgdesc="Lightweight virtual machines for containers (guest components)"
arch=('x86_64')
url="https://katacontainers.io/"
license=('Apache')
makedepends=(
  'go<2:1.15'  # thanks Intel, love you big time: https://github.com/kata-containers/runtime/issues/2982
  'yq2-bin'  # quietly pulled by Kata's codebase to read versions.yaml from repo
  'mkinitcpio'  # initrd build
  'pacman' 'udisks2'  # rootless image build
)

_gh_org="github.com/kata-containers"
_kata_kernel_ver="${KATA_KERNEL_VER:-5.4.32}"

source=(
  "agent-${_pkgver}.tar.gz::https://${_gh_org}/agent/archive/${_pkgver}.tar.gz"
  "osbuilder-${_pkgver}.tar.gz::https://${_gh_org}/osbuilder/archive/${_pkgver}.tar.gz"
  "packaging-${_pkgver}.tar.gz::https://${_gh_org}/packaging/archive/${_pkgver}.tar.gz"

  "https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-${_kata_kernel_ver}.tar.xz"
  "https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-${_kata_kernel_ver}.tar.sign"

  # mknitcpio-busybox
  "mkinitcpio-agent.conf"
  "install_kata-agent.tpl"
  "image_builder.sh"  # image build

  # mknitpcio-systemd
  "install_sd-kata-agent.tpl"
)
sha512sums=(
  "e0af374e279899a010ab66ed4fd4caff33c91d2cc19711f5e51302041cd49e69a71909d71092042bf0c4070acbbc5421f5c6cca49c55a4c332c060e745cf5a0c"
  "b8f8998229e2f12491cf6f9262cf8889353e83c58e93010ca3f328f77b61f89fb33d9209b21a1babae406f60b915011edb0832b803dd31b32115dfffa1b2edb1"
  "867f8fbf9c589535a10696a14c26aa6b9b3c6344690105489d55ed1287bdbd56909eb8052a22b4be98e8eb697fc57021212780ff41e478438c71a5c20d7446ad"

  "${KATA_KERNEL_SUM_SHA512:-197f292fa541031071b8ed64880a3d4251fa65059747cbdf3900b8f934d17f681b506ca5f70132899bdef343d2d249a7902215d2ea04af5410599f1e50d6cbac}"
  "SKIP"

  "182a249aecbab33b8704e9567e96d33b535ee59e6d2f52f0c30fbc3d12813f60192886539cc745933caaf59268925d78db9e0b6b427321e2bac932ebde77d62e"
  "0250e52251986f36cfb9e378d848f755caaf5253daa8ff7d87172f2622754c1eb4180b338a497e3fbeb880e232eef19d5e512f5a8e610e7a6eb468f210849a08"
  "6f476297d9001eef9a0665689f752cf5124907522cfc87240df16488379a5c7c9820a6e33a576dbf7f75c4fdfa7cab7a0e395b05c9339069dedbdaac42fb6c04"

  "65d368df7fe4546d5c825e30c5c831cb4b4f759fb1352b7715d40b750968b3ba54139f64cd1133a3b599d179d88d8181bd61eb34b1f5868b5606e53de6552c41"
)
b2sums=(
  "94e996c463f0c5517bc6d97af2cb0f1dbadccd7e5f2ef5c45ea15d1deb5af65770371f25a0b9421ba70fa50a0b8c22c7d5a443173515ad4c5db30c1fa72cd395"
  "6c30855fc7d5298dbe8c6b7e294edbf840e123083fecfa3d73d91e741dcca70af6ca0c10672eb6fa24dd886b3ebddccefcff943b4c816ce65c2f05588947660e"
  "6194835f2526a7b16e5b8ca97fb831fdfb78a951dec51c8640c8cff6efd5186ed051e717ff748af7913bdf339f5a69e1b5c9aff2d70c732a4876481ac6fb59ea"

  "${KATA_KERNEL_SUM_B2:-0ac78d1eb97ce4689ccdab01fb1475d07f29a90251b44b05fcf030d2f9aa644ac9dbb1315c7fe1eb991ef1435b7f17669e2b4f66187e3404599a0f136d2b1a50}"
  "SKIP"

  "43c81141a65fd14b60ae72c5b98168bec531990903cc7c8b224b416c71d1d05c1cf3f73891954604e0b0c6f48c52a3a41a8e9e78874a79e72b14282373108e8b"
  "9abf2208af353019ba177d8a48ba613401742cd21258a79c5d9cb8518a51f4f22a41dc386b71f2d6521d03f6ff65d8710dc59d1ca9c7c1dc5f94061c7374286c"
  "1745aa5d5df0af2452381de163e3964511172e045c13736a062bb2c932e3306250d24992b2bdbc534ced188b35d3b1f4958a5680c99356afd3097d11c84aee31"

  "c9d90683b134dcbf656adcb5bebad02a9a02ec68a1497bbab16cdec7d626ab020f56a40f00bfddf06000452e20d5a58d53ed59d0be49451daf9019fe1f203a58"
)
validpgpkeys=(
  647F28654894E3BD457199BE38DBBDC86092693E  # kernel
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

  # agent-based initrd
  BINSRC="${srcdir}/src/${_gh_org}/agent/kata-agent" envsubst <"${srcdir}/install_kata-agent.tpl" >"${srcdir}/install_kata-agent"
  install -Dm0644 "${srcdir}/install_kata-agent" "${srcdir}/initcpio-agent/install/kata-agent"

  # systemd-based initrd
  SRCDIR="${srcdir}/src/${_gh_org}/agent" envsubst <"${srcdir}/install_sd-kata-agent.tpl" >"${srcdir}/install_sd-kata-agent"
  install -Dm0644 "${srcdir}/install_sd-kata-agent" "${srcdir}/initcpio-systemd/install/sd-kata-agent"

  install -m0755 "${srcdir}/image_builder.sh" "${srcdir}/osbuilder-${_pkgver}/image-builder/image_builder.sh"
}

_kata_image_build(){
  install -dm0755 "${srcdir}/pkgcache" "${srcdir}/alpmdb" "${srcdir}/rootfs"
  fakeroot -- pacman -r "${srcdir}/rootfs" -b "${srcdir}/alpmdb" --cachedir "${srcdir}/pkgcache" --noconfirm -Sy systemd chrony iptables kmod libseccomp
  pushd "${srcdir}/rootfs/sbin"
  ln -sf ../lib/systemd/systemd init
  popd

  install -Dm0755 "${srcdir}/src/${_gh_org}/agent/kata-agent" "${srcdir}/rootfs/usr/bin/kata-agent"
  install -Dm0644 "${srcdir}/src/${_gh_org}/agent/kata-containers.target" "${srcdir}/rootfs/usr/lib/systemd/system/kata-containers.target"
  sed -e 's#@bindir@#/usr/bin#' -e 's#@kata-agent@#kata-agent#' "${srcdir}/src/${_gh_org}/agent/kata-agent.service.in" >"${srcdir}/rootfs/usr/lib/systemd/system/kata-agent.service"

  # rootfs image (builds filesystem with uid:gid of building system user! beware!)
  cd "${srcdir}/osbuilder-${_pkgver}/image-builder"
  ./image_builder.sh -f ext4 "${srcdir}/rootfs"
}

build(){
  cd "${srcdir}/src/${_gh_org}/agent"
  GOPATH="${srcdir}" LDFLAGS="" make

  cd "${srcdir}/linux-${_kata_kernel_ver}"
  make -s ARCH="${_KARCH}"

  mkinitcpio -c "${srcdir}/mkinitcpio-agent.conf" -g "${srcdir}/initrd-arch-agent.img" -D "${srcdir}/initcpio-agent"
  #mkinitcpio -c "${srcdir}/mkinitcpio-systemd.conf" -g "${srcdir}/initrd-arch-systemd.img" -D "${srcdir}/initcpio-systemd"
  _kata_image_build
}

package_kata-agent(){
  cd "${srcdir}/src/${_gh_org}/agent"
  GOPATH="${srcdir}" make install DESTDIR="${pkgdir}" BINDIR="/usr/bin" PKGLIBEXECDIR="/usr/lib/kata-containers" LIBEXECDIR="/usr/lib"
}

package_kata-containers-image(){
  local -r _img_filename="kata-containers-${_pkgver%%~*}-arch-systemd-image.img" _initrd_filename="kata-containers-${_pkgver%%~*}-arch-agent-initrd.img"
  install -Dm 0644 "${srcdir}/osbuilder-${_pkgver}/image-builder/kata-containers.img" "${pkgdir}/usr/share/kata-containers/${_img_filename}"
  install -Dm 0644 "${srcdir}/initrd-arch-agent.img" "${pkgdir}/usr/share/kata-containers/${_initrd_filename}"
  pushd "${pkgdir}/usr/share/kata-containers"
  ln -sf "${_img_filename}" "kata-containers-arch.img"
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
