# $Id$
# Maintainer: zer0def <zer0def@github>
# Contributor: Kaushal M <kshlmster cat gmail dog com>
# Contributor: Stefan Zwanenburg <stefan cat zwanenburg dog info>

pkgbase=kata-containers-bin
pkgname=(kata-runtime-bin kata-proxy-bin kata-shim-bin kata-ksm-throttler-bin kata-containers-image kata-linux-container)
pkgver="1.10.0~rc0"
_pkgver=${pkgver/\~/-}
pkgrel=4
pkgdesc="Lightweight virtual machines for containers (binary version)"
arch=(x86_64)
url="https://katacontainers.io"
license=('Apache')
source=(
  "https://download.opensuse.org/repositories/home:/katacontainers:/releases:/${CARCH}:/stable-${pkgver%.*}/Fedora_30/${CARCH}/kata-ksm-throttler-${pkgver}-3.1.${CARCH}.rpm"
  "https://github.com/kata-containers/runtime/releases/download/${_pkgver}/kata-static-${_pkgver}-${CARCH}.tar.xz"
)
sha256sums=(
  'a947effca82fd01f944418c94fb712684fafc65d4edf1aa3683617d0c80a15c1'
  '619c413c63c9e03837a433112f9432adf1bef69224b352ada2bdd0100f5a5a53'
)

package_kata-runtime-bin() {
  depends=(qemu-headless kata-proxy=${pkgver} kata-shim=${pkgver} kata-ksm-throttler=${pkgver} kata-containers-image=${pkgver} kata-linux-container=${pkgver})
  optdepends=(
    'firecracker<0.20.0'
    'cloud-hypervisor<0.5.0'
    #'acrn'
  )
  conflicts=('kata-runtime')
  provides=('kata-runtime')
  install=kata-runtime.install

  install -D -m 0755 -t ${pkgdir}/usr/bin ${srcdir}/opt/kata/bin/{containerd-shim-kata-v2,kata-runtime,kata-collect-data.sh}
  install -D -m 0755 {${srcdir}/opt/kata/libexec,${pkgdir}/usr/lib}/kata-containers/kata-netmon
  install -D -m 0644 {${srcdir}/opt/kata,${pkgdir}/usr}/share/bash-completion/completions/kata-runtime
  install -D -m 0644 -t ${pkgdir}/usr/share/defaults/kata-containers ${srcdir}/opt/kata/share/defaults/kata-containers/*.toml

  sed -i 's/libexec/lib/' ${pkgdir}/usr/share/defaults/kata-containers/*.toml ${pkgdir}/usr/bin/kata-collect-data.sh
  sed -i -e 's/qemu-lite/qemu/' -e 's/qemu-vanilla/qemu/' ${pkgdir}/usr/share/defaults/kata-containers/configuration.toml ${pkgdir}/usr/bin/kata-collect-data.sh
}

package_kata-proxy-bin() {
  conflicts=('kata-proxy')
  provides=('kata-proxy')
  install -D -m 0755 {${srcdir}/opt/kata/libexec,${pkgdir}/usr/lib}/kata-containers/kata-proxy
}

package_kata-shim-bin() {
  conflicts=('kata-shim')
  provides=('kata-shim')
  install -D -m 0755 {${srcdir}/opt/kata/libexec,${pkgdir}/usr/lib}/kata-containers/kata-shim
}

package_kata-ksm-throttler-bin() {
  conflicts=('kata-ksm-throttler')
  provides=('kata-ksm-throttler')
  install -D -m 0644 -t ${pkgdir}/usr/lib/systemd/system ${srcdir}/usr/lib/systemd/system/kata-{ksm,vc}-throttler.service
  sed -i 's/libexec/lib/' ${pkgdir}/usr/lib/systemd/system/kata-{ksm,vc}-throttler.service
  install -D -m 0755 {${srcdir}/usr/libexec,${pkgdir}/usr/lib}/kata-ksm-throttler/kata-ksm-throttler
  install -D -m 0755 {${srcdir}/usr/libexec,${pkgdir}/usr/lib}/kata-ksm-throttler/trigger/virtcontainers/vc
  install -d -m 0755 ${pkgdir}/var/lib/vc/{firecracker,sbs,uuid}
}

package_kata-containers-image(){
  install -Dm644 -t "${pkgdir}/usr/share/kata-containers/" \
    ${srcdir}/opt/kata/share/kata-containers/kata-containers-image_clearlinux_${_pkgver}_agent_*.img \
    ${srcdir}/opt/kata/share/kata-containers/kata-containers-initrd_alpine_${_pkgver}_agent_*.initrd
  cd "${pkgdir}/usr/share/kata-containers/"
  ln -s kata-containers-image_clearlinux_${_pkgver}_agent_*.img kata-containers.img
  ln -s kata-containers-initrd_alpine_${_pkgver}_agent_*.initrd kata-containers-initrd.img
}

package_kata-linux-container(){
  install -Dm644 -t "${pkgdir}/usr/share/kata-containers/" \
    ${srcdir}/opt/kata/share/kata-containers/config-* \
    ${srcdir}/opt/kata/share/kata-containers/vmlinux-* \
    ${srcdir}/opt/kata/share/kata-containers/vmlinuz-*
  cd "${pkgdir}/usr/share/kata-containers/"
  ln -sf vmlinux-virtio-fs-* vmlinux-virtiofs.container
  ln -sf vmlinuz-virtio-fs-* vmlinuz-virtiofs.container
  # bash-specific behavior?
  ln -s vmlinux-[0-9].[0-9]* vmlinux.container
  ln -s vmlinuz-[0-9].[0-9]* vmlinuz.container
}
