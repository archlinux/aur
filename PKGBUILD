# $Id$
# Maintainer: zer0def <zer0def@github>
# Contributor: Kaushal M <kshlmster cat gmail dog com>
# Contributor: Stefan Zwanenburg <stefan cat zwanenburg dog info>

pkgbase=kata-containers-bin
pkgname=(
  kata-runtime-bin
  kata-proxy-bin
  kata-shim-bin
  kata-containers-image-bin
  kata-linux-container-bin
)
pkgver="1.11.3"
_pkgver=${pkgver/\~/-}
pkgrel=1
pkgdesc="Lightweight virtual machines for containers (binary version)"
arch=(x86_64)
url="https://katacontainers.io"
license=('Apache')

_bin_pkg_root="/usr"  # `/usr` for f30 packages, `/opt/kata` for static packages

if [ "${_bin_pkg_root}" = "/opt/kata" ]; then
  pkgname+=(kata-containers-static)
  source=("https://github.com/kata-containers/runtime/releases/download/${_pkgver}/kata-static-${_pkgver}-${CARCH}.tar.xz")
  sha256sums=(6a2f67fca6f896502a6b3ba8b7518cabff26cb4448e0f529cbefe4039909758f)
else
  _kata_kernel_ver="5.4.32.75"
  _default_suffix="-7.1"  # f30 package build revision
  #_image_suffix="-6.1"
  #_ksm_suffix="-6.1"
  #_kernel_suffix="-6.1"
  #_proxy_suffix="-6.1"
  #_runtime_suffix="-6.1"
  #_shim_suffix="-6.1"

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
    0f791db850f54da333b0a106f5ed205c3ac00176b3d7b4c6be546cceff1aa04d
    1e108b6e233a0d34d8a130b75828644ff6a0d345eba05e0ded90121aa3371138
    45d210b29d6d11b9d9c62f55ec5b323a431016e6c872a24d5bf3e991fcd03ef0
    41e0661d9004d246b79b13f5854e93222b1415e2e50258477864ce4b73fd7ba9
    d0af42580d0c37cf0adefbb395f6b40b0ea134fdc8a7cdb925971c36649d2760
    7adbd10bde3aee469087250ccab7b48f2cdb3e291872f76a2469f8ff917191e3
  )
fi

package_kata-runtime-bin() {
  depends=(qemu-headless kata-proxy kata-shim kata-ksm-throttler kata-containers-image kata-linux-container)
  optdepends=(
    'cloud-hypervisor<0.8.0'
    'firecracker<0.22.0'
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

package_kata-containers-image-bin(){
  conflicts=('kata-containers-image')
  provides=('kata-containers-image')
  install -Dm644 -t "${pkgdir}/usr/share/kata-containers/" \
    ${srcdir}${_bin_pkg_root}/share/kata-containers/kata-containers-image_clearlinux_${_pkgver}_agent_*.img \
    ${srcdir}${_bin_pkg_root}/share/kata-containers/kata-containers-initrd_alpine_${_pkgver}_agent_*.initrd
  cd "${pkgdir}/usr/share/kata-containers/"
  ln -s kata-containers-image_clearlinux_${_pkgver}_agent_*.img kata-containers.img
  ln -s kata-containers-initrd_alpine_${_pkgver}_agent_*.initrd kata-containers-initrd.img
}

package_kata-linux-container-bin(){
  conflicts=('kata-linux-container')
  provides=('kata-linux-container')
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
  cp -dr --no-preserve='ownership' "${srcdir}/opt" "${pkgdir}/opt"
}
