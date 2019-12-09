# $Id$
# Maintainer: zer0def <zer0def@github>
# Contributor: Kaushal M <kshlmster@gmail.com>

pkgbase=kata-containers
pkgname=(kata-runtime kata-proxy kata-shim kata-ksm-throttler kata-containers-image kata-linux-container)
pkgver="1.9.2"
pkgrel=3
pkgdesc="Lightweight virtual machines for containers"
arch=(x86_64)
url="https://katacontainers.io"
license=('Apache')

__dlbase="https://download.opensuse.org/repositories/home:/katacontainers:/releases:/${CARCH}:/stable-${pkgver%.*}/Fedora_30/${CARCH}"
__linux_container_ver="4.19.75.54"
__default_suffix="-7.1"
#__runtime_suffix="-7.1"
#__proxy_suffix="-7.1"
#__shim_suffix="-7.1"
#__ksm_throttler_suffix="-7.1"
#__img_suffix="-7.1"
#__linux_container_suffix="-7.1"

source=(
  "${__dlbase}/kata-runtime-${pkgver}${__runtime_suffix:-${__default_suffix}}.${CARCH}.rpm"
  "${__dlbase}/kata-proxy-bin-${pkgver}${__proxy_suffix:-${__default_suffix}}.${CARCH}.rpm"
  "${__dlbase}/kata-shim-bin-${pkgver}${__shim_suffix:-${__default_suffix}}.${CARCH}.rpm"
  "${__dlbase}/kata-ksm-throttler-${pkgver}${__ksm_throttler_suffix:-${__default_suffix}}.${CARCH}.rpm"
  "${__dlbase}/kata-containers-image-${pkgver}${__img_suffix:-${__default_suffix}}.${CARCH}.rpm"
  "${__dlbase}/kata-linux-container-${__linux_container_ver}${__linux_container_suffix:-${__default_suffix}}.${CARCH}.rpm"
)

sha256sums=(
  'b5f47b9d905d4d265b6ded744a0413b1a5b1c24b4adec66449095afa5ab8e6ee'
  '772500f64cfb7cd046e4d46c440e00bab665a276bf4d2cfea6016a7141ae5434'
  '60615672c1aa926fafc591abd0a78302b7b78fea2f0e6f2dd810746dd5bc8b6b'
  '96c49d80cbcf5575534cf8bd9e6fcff6c4f5667be729521d313fe172bae37bce'
  '7b7529b8b92e63c0a1c00a2273688299e8d8001dce9820d3ad9b73e06d293476'
  'a78fcecac7afb9e7c2e81bc84a73287f9ff471ba7300978aacb0a6b88598494f'
)

package_kata-runtime() {
  depends=(qemu kata-proxy=${pkgver} kata-shim=${pkgver} kata-ksm-throttler=${pkgver} kata-containers-image=${pkgver} kata-linux-container=${pkgver})
  optdepends=('firecracker<0.19.0') # `acrn` some day?
  install=kata-runtime.install

  install -D -m 0755 -t ${pkgdir}/usr/bin ${srcdir}/usr/bin/{containerd-shim-kata-v2,kata-runtime,kata-collect-data.sh}
  install -D -m 0755 {${srcdir}/usr/libexec,${pkgdir}/usr/lib}/kata-containers/kata-netmon
  install -D -m 0644 {${srcdir},${pkgdir}}/usr/share/bash-completion/completions/kata-runtime
  install -D -m 0644 -t ${pkgdir}/usr/share/defaults/kata-containers ${srcdir}/usr/share/defaults/kata-containers/*.toml

  sed -i -e 's/libexec/lib/' ${pkgdir}/usr/share/defaults/kata-containers/*.toml ${pkgdir}/usr/bin/kata-collect-data.sh
  sed -i -e 's/qemu-lite/qemu/' -e 's/qemu-vanilla/qemu/' ${pkgdir}/usr/share/defaults/kata-containers/configuration.toml ${pkgdir}/usr/bin/kata-collect-data.sh
}

package_kata-proxy() {
  install -D -m 0755 {${srcdir}/usr/libexec,${pkgdir}/usr/lib}/kata-containers/kata-proxy
}

package_kata-shim() {
  install -D -m 0755 {${srcdir}/usr/libexec,${pkgdir}/usr/lib}/kata-containers/kata-shim
}

package_kata-ksm-throttler() {
  install -D -m 0644 -t ${pkgdir}/usr/lib/systemd/system ${srcdir}/usr/lib/systemd/system/kata-{ksm,vc}-throttler.service
  sed -i 's/libexec/lib/' ${pkgdir}/usr/lib/systemd/system/kata-{ksm,vc}-throttler.service
  install -D -m 0755 {${srcdir}/usr/libexec,${pkgdir}/usr/lib}/kata-ksm-throttler/kata-ksm-throttler
  install -D -m 0755 {${srcdir}/usr/libexec,${pkgdir}/usr/lib}/kata-ksm-throttler/trigger/virtcontainers/vc
  install -d -m 0755 ${pkgdir}/var/lib/vc/{sbs,uuid}
}

package_kata-containers-image() {
  install -D -m 0664 {${srcdir},${pkgdir}}/usr/share/kata-containers/kata-containers-image_clearlinux_${pkgver}_agent_ba81eb84dd.img
  ln -sf kata-containers-image_clearlinux_${pkgver}_agent_ba81eb84dd.img ${pkgdir}/usr/share/kata-containers/kata-containers.img
  install -D -m 0664 {${srcdir},${pkgdir}}/usr/share/kata-containers/kata-containers-initrd_alpine_${pkgver}_agent_ba81eb84dd.initrd
  ln -sf kata-containers-initrd_alpine_${pkgver}_agent_ba81eb84dd.initrd ${pkgdir}/usr/share/kata-containers/kata-containers-initrd.img
}

package_kata-linux-container() {
  for i in vmlinu{x,z}; do
    install -D -m 0644 {${srcdir},${pkgdir}}/usr/share/kata-containers/${i}-${__linux_container_ver}${__linux_container_suffix:-${__default_suffix}}.container
    ln -sf ${i}-${__linux_container_ver}${__linux_container_suffix:-${__default_suffix}}.container ${pkgdir}/usr/share/kata-containers/${i}.container
  done
}
