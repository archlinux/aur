# Maintainer: zer0def <zer0def@github>
pkgbase=linux-kata
pkgname=(
  linux-kata
  linux-kata-btrfs
)
_kata_version="${KATA_VERSION:-2.3.0}"
_kernel_version="${KERNEL_VERSION:-5.15.5}"
pkgver="${_kernel_version}~${_kata_version}"
pkgrel=1
pkgdesc="Kata Containers container kernel image"
arch=('x86_64')
url="https://katacontainers.io/"
license=('GPL2')
validpgpkeys=('647F28654894E3BD457199BE38DBBDC86092693E')
makedepends=('bc')

source=(
  "https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-${_kernel_version}.tar.xz"
  "https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-${_kernel_version}.tar.sign"
  "kata-containers-${_kata_version}.tar.gz::https://github.com/kata-containers/kata-containers/archive/${_kata_version}.tar.gz"
  "btrfs.config"

  # https://lkml.org/lkml/2021/1/23/75
  "0001-config-preemption.diff"  # 5.4
)
sha512sums=(
  "${KERNEL_SHA512:-7b9a78c734a24e8b67f93c8de65fb57cce498f18f4ce6a5c4cff0b834407dbf66cda6834118e67cfef3101979f2df78a7cc45854d943ffecee60a990783497df}"
  "SKIP"
  "${KATA_SHA512:-d84846565b77d63bd718e99085deef4b5fffe5aedd3f158936b71bf81fb7edd52119ba608f90249d62952ef75e093d62cdaaad344a7cb3b4403aa085c50373a2}"
  "ed3011a9fee8dd2fb16a004305b23e6b79158afcfe6d88ccdf471b177a8fbe4a9da92924e437284de83a69cebdf5cca2312b614906c404c0d22692aeca491510"

  "76c27fe0e2b84a9ae0d4b0e2a96ef0c07777811991b4aae21c88494b91fa2837fb67be335cebf4874e5e3235b5ba4641ec4544f9e055765e2dcf399d9d875e8c"
)
b2sums=(
  "${KERNEL_B2:-2921b549a44ff4202ab96d35d6b7ce99bef914db5c1dba066fb7c4b146ef987d1aed53d0773fbe07cd6bb3b964d40b6f3f8c47f6a04149ea1c64e2f8f87343bb}"
  "SKIP"
  "${KATA_B2:-2bec0d4d227d2969857efab31d75c4c1d8f656701b5065aabe2d0c84348ae4418e6c5bb261dee264a0bd762851b7a2d11ef58ae06e4aa6389a6bef61a6099abc}"
  "803eb3483722e7eab50102b8d0f9dc1ea7f38781d1f61e5998137469e019cb49d944a30c97f465c5b03916322955fcf29629af27ac47f2e19210bee3d63c488e"

  "919319ddcaac3f7c5b1c1998fced9920f3e7e9d4660c83e380495fc3a14d5f4e82736ac9435fdb78512576f1d90f80b1ad017529f2b42e013b844ed3ec4bc99f"
)
b3sums=(
  "${KERNEL_B3:-05105402eeeb437ae5f3cebe262cfa2c3b2e2ca567b3587dc772997e184108a8}"
  "SKIP"
  "${KATA_B3:-80c3cb1b17e96ead8cdc3ac89775ede649a21bbbaf9703caacbb2c6f2d86b3d9}"
  "b10616d6501651063718fbc34e008e1ddae777b1588712d50b85306af4a3b417"

  "96abca9aaa451d5b243ac1cd8f5697958ad0ec070e004b5f8f9e54497faab8d0"
)

case "${CARCH}" in
  x86_64)     _KARCH=x86_64;;
  aarch64)    _KARCH=arm64;;
  s390|s390x) _KARCH=s390;;
  ppc64le)    _KARCH=powerpc;;
esac

_prepare(){
  # ref: https://github.com/kata-containers/packaging/tree/master/kernel
  local suffix="${1}"; shift

  cp -a "${srcdir}/linux-${_kernel_version}" "${srcdir}/linux-${_kernel_version}-${suffix}"
  pushd "${srcdir}/linux-${_kernel_version}-${suffix}"
  #for p in $(find "${srcdir}/kata-containers-${_kata_version}/obs-packaging/linux-container/patches" -type f -name "*.patch"); do
  #  patch -p1 <"${p}"
  #done

  #patch -p1 <"${srcdir}/0001-config-preemption.diff"

  # kernel config prep from upstream ("${srcdir}/kata-containers-${_kata_version}/obs-packaging/linux-container/kata-linux-container.spec-template")
  make -s mrproper
  rm -f .config

  local _KCONFIG="$(find "${srcdir}/kata-containers-${_kata_version}/kernel/configs" -type f -name "${_KARCH}_kata_kvm_${pkgver%.*}.x")"
  if [ -z "${_KCONFIG}" ]; then
    KCONFIG_CONFIG=.config ARCH=${_KARCH} scripts/kconfig/merge_config.sh -r -n "${srcdir}/kata-containers-${_kata_version}/tools/packaging/kernel/configs/fragments/common/"*.conf "${srcdir}/kata-containers-${_kata_version}/tools/packaging/kernel/configs/fragments/${_KARCH}/"*.conf
  else
    install -D -m 0644 "${_KCONFIG}" .config
  fi
  [ -z "${@}" ] || cat "${@}" >> .config
  make -s ARCH="${_KARCH}" oldconfig
  popd
}

prepare(){
  _prepare vanilla
  _prepare btrfs "${srcdir}/btrfs.config"
}

_build(){
  pushd "${srcdir}/linux-${_kernel_version}-${1}"
  make -s ARCH="${_KARCH}"
  popd
}

build(){
  _build vanilla
  _build btrfs
}

_package_linux_kata(){
  local suffix="${1:+-${1}}" _path="${2}"
  install -dm0755 "${pkgdir}/usr/share/kata-containers"
  pushd "${pkgdir}/usr/share/kata-containers"

  install -D -m 0644 "${_path}/arch/${_KARCH}/boot/bzImage" "${pkgdir}/usr/share/kata-containers/vmlinux-${_kernel_version}${suffix}.container"
  #install -D -m 0644 "${_path}/vmlinux" "${pkgdir}/usr/share/kata-containers/vmlinux-${_kernel_version}${suffix}.container"
  ln -sf "vmlinux-${_kernel_version}${suffix}.container" "vmlinux${suffix}.container"
  if [ "${_KARCH}" = "powerpc" ]; then
    ln -sf "vmlinux-${_kernel_version}${suffix}.container" "vmlinuz-${_kernel_version}${suffix}.container"
    ln -sf "vmlinuz-${_kernel_version}${suffix}.container" "vmlinuz${suffix}.container"
  else
    # param out bzImage for other archs?
    install -D -m 0644 "${_path}/arch/${_KARCH}/boot/bzImage" "${pkgdir}/usr/share/kata-containers/vmlinuz-${_kernel_version}${suffix}.container"
    ln -sf "vmlinuz-${_kernel_version}${suffix}.container" "vmlinuz${suffix}.container"
  fi
  popd
}

package_linux-kata(){
  provides=('kata1-linux-container' 'kata2-linux-container' 'kata-linux-container')
  conflicts=('kata1-linux-container' 'kata2-linux-container' 'kata-linux-container')
  _package_linux_kata '' "${srcdir}/linux-${_kernel_version}-vanilla"
}

package_linux-kata-btrfs(){
  provides=('linux-kata' 'kata1-linux-container' 'kata2-linux-container' 'kata-linux-container')
  _package_linux_kata btrfs "${srcdir}/linux-${_kernel_version}-btrfs"
}
