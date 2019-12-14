# $Id$
# Maintainer: zer0def <zer0def@github>
# Contributor: Kaushal M <kshlmster cat gmail dog com>
# Contributor: Stefan Zwanenburg <stefan cat zwanenburg dog info>

pkgbase=kata-containers
pkgname=(kata-runtime kata-proxy kata-shim kata-ksm-throttler kata-containers-image kata-linux-container)
pkgver="1.10.0~rc0"
pkgrel=1
pkgdesc="Lightweight virtual machines for containers"
arch=(x86_64)
url="https://katacontainers.io"
license=('Apache')

__dlbase="https://download.opensuse.org/repositories/home:/katacontainers:/releases:/${CARCH}:/stable-${pkgver%.*}/Fedora_30/${CARCH}"
__linux_container_ver="4.19.86.59"
__default_suffix="-3.1"
#__runtime_suffix="-7.1"
#__proxy_suffix="-7.1"
#__shim_suffix="-7.1"
#__ksm_throttler_suffix="-7.1"
#__img_suffix="-7.1"
__img_sha="8a4d901772"
#__linux_container_suffix="-7.1"

source=(
  "${__dlbase}/kata-runtime-${pkgver}${__runtime_suffix:-${__default_suffix}}.${CARCH}.rpm"
  "${__dlbase}/kata-proxy-bin-${pkgver}${__proxy_suffix:-${__default_suffix}}.${CARCH}.rpm"
  "${__dlbase}/kata-shim-bin-${pkgver}${__shim_suffix:-${__default_suffix}}.${CARCH}.rpm"
  "${__dlbase}/kata-ksm-throttler-${pkgver}${__ksm_throttler_suffix:-${__default_suffix}}.${CARCH}.rpm"
  "${__dlbase}/kata-containers-image-${pkgver}${__img_suffix:-${__default_suffix}}.${CARCH}.rpm"
  "${__dlbase}/kata-linux-container-${__linux_container_ver}${__linux_container_suffix:-${__default_suffix}}.${CARCH}.rpm"
)

# sha256sum kata-{runtime,{proxy,shim}-bin,ksm-throttler,containers-image,linux-container}-*.rpm | awk '{print $1}' | xargs -n1 -I{} -- echo "'{}'"
sha256sums=(
  '5ba7a425d583a26860085bf3812b258b13f87495ccc769b12a9bbe289cbd1364'
  '9e986dc42483509e69f7fd6e22dd6e00fc1aa6c60890aeb4fb9e0552ed9bcce7'
  '512d515b6744aa7fbe91be7c388b4066c0443a3521649d2c44f43af9abc97ffc'
  'a947effca82fd01f944418c94fb712684fafc65d4edf1aa3683617d0c80a15c1'
  'e4938b9782e56adb91790f7082d56bd8a3dee6008642bbae987bceebaf3d5361'
  'd8c8c4dab6d304c67aa93028e6f5fe9152820aea4ae8c16810e28d77972eabfb'
)

package_kata-runtime() {
  depends=(qemu kata-proxy=${pkgver} kata-shim=${pkgver} kata-ksm-throttler=${pkgver} kata-containers-image=${pkgver} kata-linux-container=${pkgver})
  optdepends=(
    'firecracker'
    #'cloud-hypervisor'
    #'acrn'
  )
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
  install -D -m 0664 {${srcdir},${pkgdir}}/usr/share/kata-containers/kata-containers-image_clearlinux_${pkgver/\~/-}_agent_${__img_sha}.img
  ln -sf kata-containers-image_clearlinux_${pkgver/\~/-}_agent_${__img_sha}.img ${pkgdir}/usr/share/kata-containers/kata-containers.img
  install -D -m 0664 {${srcdir},${pkgdir}}/usr/share/kata-containers/kata-containers-initrd_alpine_${pkgver/\~/-}_agent_${__img_sha}.initrd
  ln -sf kata-containers-initrd_alpine_${pkgver/\~/-}_agent_${__img_sha}.initrd ${pkgdir}/usr/share/kata-containers/kata-containers-initrd.img
}

package_kata-linux-container() {
  for i in vmlinu{x,z}; do
    install -D -m 0644 {${srcdir},${pkgdir}}/usr/share/kata-containers/${i}-${__linux_container_ver}${__linux_container_suffix:-${__default_suffix}}.container
    ln -sf ${i}-${__linux_container_ver}${__linux_container_suffix:-${__default_suffix}}.container ${pkgdir}/usr/share/kata-containers/${i}.container
  done
}
