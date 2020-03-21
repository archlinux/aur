# $Id$
# Maintainer: zer0def <zer0def@github>
# Contributor: Kaushal M <kshlmster cat gmail dog com>
# Contributor: Stefan Zwanenburg <stefan cat zwanenburg dog info>

pkgbase=kata-containers-bin
pkgname=(kata-runtime-bin kata-proxy-bin kata-shim-bin kata-ksm-throttler-bin kata-containers-image kata-linux-container kata-containers-static)
pkgver="1.10.2"
_pkgver=${pkgver/\~/-}
pkgrel=1
pkgdesc="Lightweight virtual machines for containers (binary version)"
arch=(x86_64)
url="https://katacontainers.io"
license=('Apache')

_kata_kernel_ver="4.19.86.60"
_bin_pkg_root="/usr"  # `/usr` for f30 packages, `/opt/kata` for static packages
_default_suffix="-6.1"  # f30 package build revision

#_image_suffix="-6.1"
#_ksm_suffix="-6.1"
_kernel_suffix="-7.1"
#_proxy_suffix="-6.1"
#_runtime_suffix="-6.1"
#_shim_suffix="-6.1"

source=(
  #"https://github.com/kata-containers/runtime/releases/download/${_pkgver}/kata-static-${_pkgver}-${CARCH}.tar.xz"
  "https://download.opensuse.org/repositories/home:/katacontainers:/releases:/${CARCH}:/stable-${pkgver%.*}/Fedora_30/${CARCH}/kata-containers-image-${pkgver}${_image_suffix:-${_default_suffix}}.${CARCH}.rpm"
  "https://download.opensuse.org/repositories/home:/katacontainers:/releases:/${CARCH}:/stable-${pkgver%.*}/Fedora_30/${CARCH}/kata-ksm-throttler-${pkgver}${_ksm_suffix:-${_default_suffix}}.${CARCH}.rpm"
  "https://download.opensuse.org/repositories/home:/katacontainers:/releases:/${CARCH}:/stable-${pkgver%.*}/Fedora_30/${CARCH}/kata-linux-container-${_kata_kernel_ver}${_kernel_suffix:-${_default_suffix}}.${CARCH}.rpm"
  "https://download.opensuse.org/repositories/home:/katacontainers:/releases:/${CARCH}:/stable-${pkgver%.*}/Fedora_30/${CARCH}/kata-proxy-bin-${pkgver}${_proxy_suffix:-${_default_suffix}}.${CARCH}.rpm"
  "https://download.opensuse.org/repositories/home:/katacontainers:/releases:/${CARCH}:/stable-${pkgver%.*}/Fedora_30/${CARCH}/kata-runtime-${pkgver}${_runtime_suffix:-${_default_suffix}}.${CARCH}.rpm"
  "https://download.opensuse.org/repositories/home:/katacontainers:/releases:/${CARCH}:/stable-${pkgver%.*}/Fedora_30/${CARCH}/kata-shim-bin-${pkgver}${_shim_suffix:-${_default_suffix}}.${CARCH}.rpm"
)
sha256sums=(
  #ade88ae5a50365c3f677b99ec79c816291bc1bef676070d1125b10d81f92cf49
  71620cd68476d6fae63a2cdf56157110eca1ece30411bb16eb1cca6807bb56d8
  32be5a944997907700ff0b4450b31214f4348169f7f7caad8b90562ceebcf5ee
  cd8977a03ef7b5a1dce5cdd45c317a17d03c6c0a908daa249f636e4c996e5fad
  e88cb367e81bcf87b8d96be18dd419b09e8597b9e577f2e648a9f3f72eef59ed
  1d89ba67580f087538438e66faea43c6658b09345ee61326352c8a0bbe2b7bc3
  c6dd9ccb1217da8d960b6874f7e48757ddf6a16330ae84539bab145b7b8be976
)


package_kata-runtime-bin() {
  depends=(qemu-headless kata-proxy kata-shim kata-ksm-throttler kata-containers-image kata-linux-container)
  optdepends=(
    'firecracker<0.20.0'
    'cloud-hypervisor<0.5.0'
    #'acrn'
  )
  conflicts=('kata-runtime')
  provides=('kata-runtime')
  install=kata-runtime.install

  install -D -m 0755 -t ${pkgdir}/usr/bin ${srcdir}${_bin_pkg_root}/bin/{containerd-shim-kata-v2,kata-runtime,kata-collect-data.sh}
  install -D -m 0755 {${srcdir}${_bin_pkg_root}/libexec,${pkgdir}/usr/lib}/kata-containers/kata-netmon
  install -D -m 0644 {${srcdir}${_bin_pkg_root},${pkgdir}/usr}/share/bash-completion/completions/kata-runtime
  install -D -m 0644 -t ${pkgdir}/usr/share/defaults/kata-containers ${srcdir}${_bin_pkg_root}/share/defaults/kata-containers/*.toml

  sed -i 's/libexec/lib/' ${pkgdir}/usr/share/defaults/kata-containers/*.toml ${pkgdir}/usr/bin/kata-collect-data.sh
  sed -i -e 's/qemu-lite/qemu/' -e 's/qemu-vanilla/qemu/' ${pkgdir}/usr/share/defaults/kata-containers/configuration.toml ${pkgdir}/usr/bin/kata-collect-data.sh
}

package_kata-proxy-bin() {
  conflicts=('kata-proxy')
  provides=('kata-proxy')
  install -D -m 0755 {${srcdir}${_bin_pkg_root}/libexec,${pkgdir}/usr/lib}/kata-containers/kata-proxy
}

package_kata-shim-bin() {
  conflicts=('kata-shim')
  provides=('kata-shim')
  install -D -m 0755 {${srcdir}${_bin_pkg_root}/libexec,${pkgdir}/usr/lib}/kata-containers/kata-shim
}

package_kata-ksm-throttler-bin() {
  conflicts=('kata-ksm-throttler')
  provides=('kata-ksm-throttler')
  install -D -m 0644 -t ${pkgdir}/usr/lib/systemd/system ${srcdir}/usr/lib/systemd/system/kata-{ksm,vc}-throttler.service
  sed -i 's/libexec/lib/' ${pkgdir}/usr/lib/systemd/system/kata-{ksm,vc}-throttler.service
  install -D -m 0755 {${srcdir}/usr/libexec,${pkgdir}/usr/lib}/kata-ksm-throttler/kata-ksm-throttler
  install -D -m 0755 {${srcdir}/usr/libexec,${pkgdir}/usr/lib}/kata-ksm-throttler/trigger/virtcontainers/vc
  install -d -m 0755 ${pkgdir}/var/lib/vc/firecracker ${pkgdir}/var/lib/vc/sbs ${pkgdir}/var/lib/vc/uuid
}

package_kata-containers-image(){
  install -Dm644 -t "${pkgdir}/usr/share/kata-containers/" \
    ${srcdir}${_bin_pkg_root}/share/kata-containers/kata-containers-image_clearlinux_${_pkgver}_agent_*.img \
    ${srcdir}${_bin_pkg_root}/share/kata-containers/kata-containers-initrd_alpine_${_pkgver}_agent_*.initrd
  cd "${pkgdir}/usr/share/kata-containers/"
  ln -s kata-containers-image_clearlinux_${_pkgver}_agent_*.img kata-containers.img
  ln -s kata-containers-initrd_alpine_${_pkgver}_agent_*.initrd kata-containers-initrd.img
}

package_kata-linux-container(){
  install -Dm644 -t "${pkgdir}/usr/share/kata-containers/" \
    ${srcdir}${_bin_pkg_root}/share/kata-containers/vmlinux-* \
    ${srcdir}${_bin_pkg_root}/share/kata-containers/vmlinuz-*
  [ "${_bin_pkg_root}" = "/opt/kata" ] && install -Dm644 -t "${pkgdir}/usr/share/kata-containers/" \
    ${srcdir}${_bin_pkg_root}/share/kata-containers/config-*
  cd "${pkgdir}/usr/share/kata-containers/"
  ln -sf vmlinux-virtio-fs-* vmlinux-virtiofs.container
  ln -sf vmlinuz-virtio-fs-* vmlinuz-virtiofs.container
  # bash-specific behavior?
  ln -s vmlinux-[0-9].[0-9]* vmlinux.container
  ln -s vmlinuz-[0-9].[0-9]* vmlinuz.container
}

package_kata-containers-static(){
  [ "${_bin_pkg_root}" = "/opt/kata" ] && cp -dr --no-preserve='ownership' "${srcdir}/opt" "${pkgdir}/opt" || return 0
}
