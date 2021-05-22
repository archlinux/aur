# $Id$
# Maintainer: zer0def <zer0def@github>
# Contributor: Kaushal M <kshlmster cat gmail dog com>
# Contributor: Stefan Zwanenburg <stefan cat zwanenburg dog info>

pkgbase=kata1-containers-bin
pkgname=(
  kata1-runtime-bin
  kata1-proxy-bin
  kata1-shim-bin
  kata1-containers-image-bin
  linux-kata1-bin
)
epoch=2
pkgver="1.12.1"
_pkgver=${pkgver/\~/-}
pkgrel=6
pkgdesc="Lightweight virtual machines for containers (binary version)"
arch=(x86_64)
url="https://katacontainers.io"
license=('Apache')

#pkgname+=(kata1-containers-static)
source=("https://github.com/kata-containers/runtime/releases/download/${_pkgver}/kata-static-${_pkgver}-${CARCH}.tar.xz")
sha512sums=(4c81be66e2b310ef767f0c90b548f85f89f5521be9fd53c50a95e81750dfbff666595ef48ba9cece2cccc33c7fafb74db0589b4a10069abf2f8d172bda8516ae)
b2sums=(902dd17f7bd4d955155c7d0f377905e15d1e2e02b358acb511dbccd83f950e91989f3dbb36cb30866a950ed57127d50e8fa2da21ffefd7f95a9f98e3fc7e4da4)

package_kata1-runtime-bin() {
  depends=(kata1-proxy-bin kata1-shim-bin)
  optdepends=(
    'kata1-containers-image: Disk and initrd images for booting Kata VMs'
    'kata1-ksm-throttler'
    'linux-kata: Kernel images for booting Kata VMs'
    'qemu-headless: QEMU-hypervised Kata VMs'
    'cloud-hypervisor: Cloud-Hypervisor-based Kata VMs'  # testing with 15.0 worked, current qemu works, too
    'firecracker<0.22.0: Firecracker-based Kata VMs'
  )
  conflicts=('kata1-runtime' 'kata2-runtime' 'kata-runtime')
  provides=('kata1-runtime' 'kata-runtime')
  install=kata-runtime.install

  install -D -m 0755 -t "${pkgdir}/usr/bin" \
    "${srcdir}/opt/kata/bin/containerd-shim-kata-v2" \
    "${srcdir}/opt/kata/bin/kata-runtime" \
    "${srcdir}/opt/kata/bin/kata-collect-data.sh"
  install -D -m 0755 \
    "${srcdir}/opt/kata/libexec/kata-containers/kata-netmon" \
    "${pkgdir}/usr/lib/kata-containers/kata-netmon"
  install -D -m 0644 \
    "${srcdir}/opt/kata/share/bash-completion/completions/kata-runtime" \
    "${pkgdir}/usr/share/bash-completion/completions/kata-runtime"
  install -D -m 0644 -t "${pkgdir}/usr/share/defaults/kata-containers" \
    ${srcdir}/opt/kata/share/defaults/kata-containers/*.toml

  sed -i \
    -e "s;/opt/kata;/usr;" \
    -e 's/libexec/lib/' \
    -e 's/kata-qemu/qemu/' \
    -e 's/qemu-lite/qemu/' \
    -e 's/qemu-vanilla/qemu/' \
    ${pkgdir}/usr/share/defaults/kata-containers/*.toml \
    "${pkgdir}/usr/bin/kata-collect-data.sh"
}

package_kata1-proxy-bin() {
  conflicts=('kata1-proxy')
  provides=('kata1-proxy')
  install -D -m 0755 \
    "${srcdir}/opt/kata/libexec/kata-containers/kata-proxy" \
    "${pkgdir}/usr/lib/kata-containers/kata-proxy"
}

package_kata1-shim-bin() {
  conflicts=('kata1-shim')
  provides=('kata1-shim')
  install -D -m 0755 \
    "${srcdir}/opt/kata/libexec/kata-containers/kata-shim" \
    "${pkgdir}/usr/lib/kata-containers/kata-shim"
}

package_kata1-containers-image-bin(){
  conflicts=('kata1-containers-image')
  provides=('kata1-containers-image')
  install -Dm644 -t "${pkgdir}/usr/share/kata-containers/" \
    ${srcdir}/opt/kata/share/kata-containers/kata-containers-image_clearlinux_${_pkgver}_agent_*.img \
    ${srcdir}/opt/kata/share/kata-containers/kata-containers-initrd_alpine_${_pkgver}_agent_*.initrd
  cd "${pkgdir}/usr/share/kata-containers/"
  ln -s kata-containers-image_clearlinux_${_pkgver}_agent_*.img kata-containers.img
  ln -s kata-containers-initrd_alpine_${_pkgver}_agent_*.initrd kata-containers-initrd.img
}

package_linux-kata1-bin(){
  provides=('linux-kata' 'kata-linux-container' 'kata1-linux-container')
  conflicts=('linux-kata' 'kata-linux-container' 'kata1-linux-container' 'kata2-linux-container')
  install -Dm644 -t "${pkgdir}/usr/share/kata-containers/" \
    ${srcdir}/opt/kata/share/kata-containers/vmlinux-* \
    ${srcdir}/opt/kata/share/kata-containers/vmlinuz-*
  [ "/opt/kata" = "/opt/kata" ] && install -Dm644 -t "${pkgdir}/usr/share/kata-containers/" \
    ${srcdir}/opt/kata/share/kata-containers/config-*
  cd "${pkgdir}/usr/share/kata-containers/"
  ln -sf vmlinux-virtio-fs-* vmlinux-virtiofs.container
  ln -sf vmlinuz-virtio-fs-* vmlinuz-virtiofs.container
  # bash-specific behavior?
  ln -s vmlinux-[0-9].[0-9]* vmlinux.container
  ln -s vmlinuz-[0-9].[0-9]* vmlinuz.container
}

package_kata1-ksm-throttler-bin() {
  conflicts=('kata1-ksm-throttler')
  provides=('kata1-ksm-throttler')
  install -D -m 0644 -t "${pkgdir}/usr/lib/systemd/system" \
    "${srcdir}/usr/lib/systemd/system/kata-ksm-throttler.service" \
    "${srcdir}/usr/lib/systemd/system/kata-vc-throttler.service"
  sed -i 's/libexec/lib/' \
    "${pkgdir}/usr/lib/systemd/system/kata-ksm-throttler.service" \
    "${pkgdir}/usr/lib/systemd/system/kata-vc-throttler.service"
  install -D -m 0755 \
    "${srcdir}/usr/libexec/kata-ksm-throttler/kata-ksm-throttler" \
    "${pkgdir}/usr/lib/kata-ksm-throttler/kata-ksm-throttler"
  install -D -m 0755 \
    "${srcdir}/usr/libexec/kata-ksm-throttler/trigger/virtcontainers/vc" \
    "${pkgdir}/usr/lib/kata-ksm-throttler/trigger/virtcontainers/vc"
  install -d -m 0755 \
    "${pkgdir}/var/lib/vc/firecracker" \
    "${pkgdir}/var/lib/vc/sbs" \
    "${pkgdir}/var/lib/vc/uuid"
}

package_kata1-containers-static(){
  cp -dr --no-preserve='ownership' "${srcdir}/opt" "${pkgdir}/opt"
}
