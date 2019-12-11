# $Id$
# Maintainer: zer0def <zer0def@github>
# Contributor: Kaushal M <kshlmster cat gmail dog com>
# Contributor: Stefan Zwanenburg <stefan cat zwanenburg dog info>

pkgbase=kata-containers
pkgname=(kata-runtime kata-proxy kata-shim kata-ksm-throttler kata-containers-image kata-linux-container)
pkgver="1.9.3"
pkgrel=1
pkgdesc="Lightweight virtual machines for containers"
arch=(x86_64)
url="https://katacontainers.io"
license=('Apache')

__dlbase="https://download.opensuse.org/repositories/home:/katacontainers:/releases:/${CARCH}:/stable-${pkgver%.*}/Fedora_30/${CARCH}"
__linux_container_ver="4.19.75.54"
__default_suffix="-8.1"
#__runtime_suffix="-7.1"
#__proxy_suffix="-7.1"
#__shim_suffix="-7.1"
#__ksm_throttler_suffix="-7.1"
#__img_suffix="-7.1"
__img_sha="dfec5d93dc"
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
  '35693291fad2a02b2da3c20c6b65d54a3978e72f00ac0d529c80353a8a6c05bc'
  '5c73509718b28fc39a0b36d3327158b6e96ba5ec93e84635c88404bc3945c2db'
  '87b1508af6ab12a4c45c663ecfd46e78b3e5395c6977565e9a6ffc74e2230d65'
  'dc84d6ea9c5548b9553b485186926648f0200f407b4489258881ecef9330803d'
  '5ba3fbd5b94927dc59ab1621e51b12e401951b11773fa965fbd5fd84d4da0b7a'
  '487112757a6b1683af853e878bb10b56fa8d424320bc6b506aaac49aac0c06e8'
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
  install -d -m 0755 ${pkgdir}/var/lib/vc/{firecracker,sbs,uuid}
}

package_kata-containers-image() {
  install -D -m 0664 {${srcdir},${pkgdir}}/usr/share/kata-containers/kata-containers-image_clearlinux_${pkgver}_agent_${__img_sha}.img
  ln -sf kata-containers-image_clearlinux_${pkgver}_agent_${__img_sha}.img ${pkgdir}/usr/share/kata-containers/kata-containers.img
  install -D -m 0664 {${srcdir},${pkgdir}}/usr/share/kata-containers/kata-containers-initrd_alpine_${pkgver}_agent_${__img_sha}.initrd
  ln -sf kata-containers-initrd_alpine_${pkgver}_agent_${__img_sha}.initrd ${pkgdir}/usr/share/kata-containers/kata-containers-initrd.img
}

package_kata-linux-container() {
  for i in vmlinu{x,z}; do
    install -D -m 0644 {${srcdir},${pkgdir}}/usr/share/kata-containers/${i}-${__linux_container_ver}${__linux_container_suffix:-${__default_suffix}}.container
    ln -sf ${i}-${__linux_container_ver}${__linux_container_suffix:-${__default_suffix}}.container ${pkgdir}/usr/share/kata-containers/${i}.container
  done
}
