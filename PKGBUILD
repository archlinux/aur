# Maintainer: zer0def <zer0def@github>
pkgbase=linux-kata
pkgname=(
  linux-kata
  linux-kata-btrfs
)
pkgver="${KATA_KERNEL_VER:-5.10.63}"
pkgrel=1
pkgdesc="Kata Containers container kernel image"
arch=('x86_64')
url="https://katacontainers.io/"
license=('GPL2')
validpgpkeys=('647F28654894E3BD457199BE38DBBDC86092693E')
makedepends=('bc')

_kata_version="2.2.0"
source=(
  "https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-${pkgver}.tar.xz"
  "https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-${pkgver}.tar.sign"
  "kata-containers-${_kata_version}.tar.gz::https://github.com/kata-containers/kata-containers/archive/${_kata_version}.tar.gz"
  "btrfs.config"

  # https://lkml.org/lkml/2021/1/23/75
  "0001-config-preemption.diff"  # 5.4
)
sha512sums=(
  "${KATA_KERNEL_SUM_SHA512:-330e826692a0df414b635f004e48723e59e719007ec20103f8a8ac5576e7c7b7a47de8e0278cbbbb26389a7b3c0e3b7e1037f4b3f8d0c2cd0a7b9415f9f1e907}"
  "SKIP"
  "fa1702a932ab9e787b3e23368a0302e1c0bacff510030ab699ca9c8291052d5c650772da0003ae7e448476a2201be739bb80496eb52e9771f9964cf370c46319"
  "ed3011a9fee8dd2fb16a004305b23e6b79158afcfe6d88ccdf471b177a8fbe4a9da92924e437284de83a69cebdf5cca2312b614906c404c0d22692aeca491510"

  "76c27fe0e2b84a9ae0d4b0e2a96ef0c07777811991b4aae21c88494b91fa2837fb67be335cebf4874e5e3235b5ba4641ec4544f9e055765e2dcf399d9d875e8c"
)
b2sums=(
  "${KATA_KERNEL_SUM_B2:-936bad82df5cfb15d336333d02c3c6e7302e0234bb9534851b6980173bde10c19ff861ab7abc3f123cf3cbc7a471148d5bf48be07c0bd241e86e70e4694727d2}"
  "SKIP"
  "e4f95fcc923fa911d506568b4339b136eadf6702f98bc522c458c6debc30499d3cd7ff86adfff633e5e427493363a8b9f4a335f77ced4b92285ee95618ded819"
  "803eb3483722e7eab50102b8d0f9dc1ea7f38781d1f61e5998137469e019cb49d944a30c97f465c5b03916322955fcf29629af27ac47f2e19210bee3d63c488e"

  "919319ddcaac3f7c5b1c1998fced9920f3e7e9d4660c83e380495fc3a14d5f4e82736ac9435fdb78512576f1d90f80b1ad017529f2b42e013b844ed3ec4bc99f"
)
b3sums=(
  "${KATA_KERNEL_SUM_B3:-9d957e0bd66119610d97fd7916246ebcf8139a05e27793b7e2338e91ed0ba456}"
  "SKIP"
  "4be7acd2df478a03e3dc27aa0d4b50ce521f6f3140e1a97b13bcd8eb7114ee07"
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

  cp -a "${srcdir}/linux-${pkgver}" "${srcdir}/linux-${pkgver}-${suffix}"
  pushd "${srcdir}/linux-${pkgver}-${suffix}"
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
  pushd "${srcdir}/linux-${pkgver}-${1}"
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

  install -D -m 0644 "${_path}/arch/${_KARCH}/boot/bzImage" "${pkgdir}/usr/share/kata-containers/vmlinux-${pkgver}${suffix}.container"
  #install -D -m 0644 "${_path}/vmlinux" "${pkgdir}/usr/share/kata-containers/vmlinux-${pkgver}${suffix}.container"
  ln -sf "vmlinux-${pkgver}${suffix}.container" "vmlinux${suffix}.container"
  if [ "${_KARCH}" = "powerpc" ]; then
    ln -sf "vmlinux-${pkgver}${suffix}.container" "vmlinuz-${pkgver}${suffix}.container"
    ln -sf "vmlinuz-${pkgver}${suffix}.container" "vmlinuz${suffix}.container"
  else
    # param out bzImage for other archs?
    install -D -m 0644 "${_path}/arch/${_KARCH}/boot/bzImage" "${pkgdir}/usr/share/kata-containers/vmlinuz-${pkgver}${suffix}.container"
    ln -sf "vmlinuz-${pkgver}${suffix}.container" "vmlinuz${suffix}.container"
  fi
  popd
}

package_linux-kata(){
  provides=('kata1-linux-container' 'kata2-linux-container' 'kata-linux-container')
  conflicts=('kata1-linux-container' 'kata2-linux-container' 'kata-linux-container')
  _package_linux_kata '' "${srcdir}/linux-${pkgver}-vanilla"
}

package_linux-kata-btrfs(){
  provides=('linux-kata' 'kata1-linux-container' 'kata2-linux-container' 'kata-linux-container')
  _package_linux_kata btrfs "${srcdir}/linux-${pkgver}-btrfs"
}
