# Maintainer: zer0def <zer0def@github>
# Contributor: Kaushal M <kshlmster cat gmail dog com>
# Contributor: Stefan Zwanenburg <stefan cat zwanenburg dog info>
pkgbase=kata-containers-guest
pkgname=(
  kata-agent
  kata-linux-container
  kata-containers-image
)
pkgver=1.12.1
_pkgver=${pkgver/\~/-}
pkgrel=1
pkgdesc="Lightweight virtual machines for containers (guest components)"
arch=('x86_64')
url="https://katacontainers.io/"
license=('Apache')
makedepends=(
  'go'
  #'yq2-bin'  # quietly pulled by Kata's codebase to read versions.yaml from repo
  'mkinitcpio'  # initrd build
  'pacman' 'udisks2'  # rootless image build
)

_gh_org="github.com/kata-containers"
_kata_kernel_ver="${KATA_KERNEL_VER:-5.4.60}"

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
  "1a9b84d5f0a5228a6660c88af01e28c608923156cbed55dea78263ecf243a79c3ee383aa0feaa26f83ef9255ebab1f01c2b61c1d027f7101a0ae2d820463586c"
  "c596150773be53e1a9796086d39912c407954a05d3b05d60d74f9c2cc3be61c99c43065e2a818aca0045b37bee332efd0c92f7a00354845154095c61c934ec95"
  "5cad6504b78b08f5bd8ad8e5d0099c288c8e6d21ed32e70176bf4c5bfe55092716d3915b9da7f104ab9d63f81f363a90b853fc3b745c909252174cc90435bc3f"

  "${KATA_KERNEL_SUM_SHA512:-fb9ebada932c17d0adbc099a1df31a7d97afe3be694665b1f8171e7159bda84a36a435ceecfdce6d492d8e5075ed4253c68029dcdf952e75a3fe7ee36646327b}"
  "SKIP"

  "182a249aecbab33b8704e9567e96d33b535ee59e6d2f52f0c30fbc3d12813f60192886539cc745933caaf59268925d78db9e0b6b427321e2bac932ebde77d62e"
  "0250e52251986f36cfb9e378d848f755caaf5253daa8ff7d87172f2622754c1eb4180b338a497e3fbeb880e232eef19d5e512f5a8e610e7a6eb468f210849a08"
  "6f476297d9001eef9a0665689f752cf5124907522cfc87240df16488379a5c7c9820a6e33a576dbf7f75c4fdfa7cab7a0e395b05c9339069dedbdaac42fb6c04"

  "65d368df7fe4546d5c825e30c5c831cb4b4f759fb1352b7715d40b750968b3ba54139f64cd1133a3b599d179d88d8181bd61eb34b1f5868b5606e53de6552c41"
)
b2sums=(
  "0d72ce69d0c9de920f3b11d3180627b2e65a1760d6830cfd4812339f7b6d16452f33506996f2ef67cdeffe1269f297b0f22a49a36c5b7078f31849f6b9cd2e37"
  "40af9fb14a5b42a88378be0c04b693876f508710e84d9f0e043c0fcd8cff66ff64a82f1202a2b9df65047175f0824b7950a491a7e3ad33077f364c1688a07f4c"
  "2ca8e265eb38bb3c3095e7317637ca6db8ebac2a9174c9a56eb531eae960345ca82b58327a83f8ffbdd84dd8c6ec159cb391d216cd3e26f726f8b822ad021d6a"

  "${KATA_KERNEL_SUM_B2:-1f6296eb9be00329b1eb015eafb4a965c575ded58b8618cfc0af3d15072c424afbbc029fad4d65e0af3bccc5963c4304c14b4a9d4763cfaec9b4596834a0f9b0}"
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

  #install -dm0755 "${srcdir}/bin"
  #ln -sf "$(command -v yq)" "${srcdir}/bin/yq"

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
  install=kata-containers-guest.install
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
