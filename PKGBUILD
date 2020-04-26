# $Id$
# Maintainer: zer0def <zer0def@github>
# Contributor: Kaushal M <kshlmster cat gmail dog com>
# Contributor: Stefan Zwanenburg <stefan cat zwanenburg dog info>

pkgbase=kata-containers-bin
pkgname=(
  kata-runtime-bin
  kata-proxy-bin
  kata-shim-bin
  kata-containers-image
  kata-linux-container
)
#pkgver="1.10.3"
pkgver="1.11.0~rc0"
_pkgver=${pkgver/\~/-}
pkgrel=1
pkgdesc="Lightweight virtual machines for containers (binary version)"
arch=(x86_64)
url="https://katacontainers.io"
license=('Apache')

_bin_pkg_root="/opt/kata"  # `/usr` for f30 packages, `/opt/kata` for static packages

if [ "${_bin_pkg_root}" = "/opt/kata" ]; then
  pkgname+=(kata-containers-static)
  source=("https://github.com/kata-containers/runtime/releases/download/${_pkgver}/kata-static-${_pkgver}-${CARCH}.tar.xz")
  sha256sums=(80ba7cfb6f82bbccbcb9cc08f3a83d2def0638efe7cbbeb5d0101cbe8dbcc105)
else
  _kata_kernel_ver="4.19.86.60"
  _default_suffix="-7.1"  # f30 package build revision
  #_image_suffix="-7.1"
  #_ksm_suffix="-7.1"
  _kernel_suffix="-8.1"
  #_proxy_suffix="-7.1"
  #_runtime_suffix="-7.1"
  #_shim_suffix="-7.1"

  pkgname+=(kata-ksm-throttler-bin)
  source=(
    "https://download.opensuse.org/repositories/home:/katacontainers:/releases:/${CARCH}:/stable-${pkgver%.*}/Fedora_30/${CARCH}/kata-containers-image-${pkgver}${_image_suffix:-${_default_suffix}}.${CARCH}.rpm"
    "https://download.opensuse.org/repositories/home:/katacontainers:/releases:/${CARCH}:/stable-${pkgver%.*}/Fedora_30/${CARCH}/kata-ksm-throttler-${pkgver}${_ksm_suffix:-${_default_suffix}}.${CARCH}.rpm"
    "https://download.opensuse.org/repositories/home:/katacontainers:/releases:/${CARCH}:/stable-${pkgver%.*}/Fedora_30/${CARCH}/kata-linux-container-${_kata_kernel_ver}${_kernel_suffix:-${_default_suffix}}.${CARCH}.rpm"
    "https://download.opensuse.org/repositories/home:/katacontainers:/releases:/${CARCH}:/stable-${pkgver%.*}/Fedora_30/${CARCH}/kata-proxy-bin-${pkgver}${_proxy_suffix:-${_default_suffix}}.${CARCH}.rpm"
    "https://download.opensuse.org/repositories/home:/katacontainers:/releases:/${CARCH}:/stable-${pkgver%.*}/Fedora_30/${CARCH}/kata-runtime-${pkgver}${_runtime_suffix:-${_default_suffix}}.${CARCH}.rpm"
    "https://download.opensuse.org/repositories/home:/katacontainers:/releases:/${CARCH}:/stable-${pkgver%.*}/Fedora_30/${CARCH}/kata-shim-bin-${pkgver}${_shim_suffix:-${_default_suffix}}.${CARCH}.rpm"
  )
  sha256sums=(
    66ce95ee36da94ae330ed537c343229f9d82ed8cd9564ddda7ec51d90fa878da
    729c24e3b4c896eed217f9fc030f950bdfe34a0878a2fef0272996066cc9fad7
    e966993a62e2db1db0fec0a4cb0c7e03b573a9a38202e27687d75ba3da53a444
    809248be471cf22e5f03b912e4f7e5c5187417ac5d54b7bccde906c1f8a73d6e
    2bff27c88388f1fc11284102788165220c691927c2b5526a0d4aa9b4646ae92c
    0265cc14f5d8bed96880cabf0469aef1de66ec0f0b1b2af6084fe87141e525e2
  )
fi

package_kata-runtime-bin() {
  depends=(qemu-headless kata-proxy kata-shim kata-ksm-throttler kata-containers-image kata-linux-container)
  optdepends=(
    #'firecracker<0.20.0'
    #'cloud-hypervisor<0.5.0'
    'firecracker<0.22.0'
    'cloud-hypervisor<0.6.0'
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

package_kata-ksm-throttler-bin() {
  conflicts=('kata-ksm-throttler')
  provides=('kata-ksm-throttler')
  install -D -m 0644 -t ${pkgdir}/usr/lib/systemd/system ${srcdir}/usr/lib/systemd/system/kata-{ksm,vc}-throttler.service
  sed -i 's/libexec/lib/' ${pkgdir}/usr/lib/systemd/system/kata-{ksm,vc}-throttler.service
  install -D -m 0755 {${srcdir}/usr/libexec,${pkgdir}/usr/lib}/kata-ksm-throttler/kata-ksm-throttler
  install -D -m 0755 {${srcdir}/usr/libexec,${pkgdir}/usr/lib}/kata-ksm-throttler/trigger/virtcontainers/vc
  install -d -m 0755 ${pkgdir}/var/lib/vc/firecracker ${pkgdir}/var/lib/vc/sbs ${pkgdir}/var/lib/vc/uuid
}

package_kata-containers-static(){
  cp -dr --no-preserve='ownership' "${srcdir}/opt" "${pkgdir}/opt" || return 0
}
