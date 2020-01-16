# $Id$
# Maintainer: zer0def <zer0def@github>
# Contributor: Kaushal M <kshlmster cat gmail dog com>
# Contributor: Stefan Zwanenburg <stefan cat zwanenburg dog info>

pkgbase=kata-containers-bin
pkgname=(kata-runtime-bin kata-proxy-bin kata-shim-bin kata-ksm-throttler-bin kata-containers-image kata-linux-container kata-containers-static)
pkgver="1.10.0"
_pkgver=${pkgver/\~/-}
pkgrel=2
pkgdesc="Lightweight virtual machines for containers (binary version)"
arch=(x86_64)
url="https://katacontainers.io"
license=('Apache')

_default_suffix="-4.1"  # f30 package build revision
_kata_kernel_ver="4.19.86.60"
_bin_pkg_root="/opt/kata"  # `/usr` for f30 packages, `/opt/kata` for static packages

source=(
  "https://github.com/kata-containers/runtime/releases/download/${_pkgver}/kata-static-${_pkgver}-${CARCH}.tar.xz"
  #"https://download.opensuse.org/repositories/home:/katacontainers:/releases:/${CARCH}:/stable-${pkgver%.*}/Fedora_30/${CARCH}/kata-containers-image-${pkgver}${_default_suffix}.${CARCH}.rpm"
  "https://download.opensuse.org/repositories/home:/katacontainers:/releases:/${CARCH}:/stable-${pkgver%.*}/Fedora_30/${CARCH}/kata-ksm-throttler-${pkgver}${_default_suffix}.${CARCH}.rpm"
  #"https://download.opensuse.org/repositories/home:/katacontainers:/releases:/${CARCH}:/stable-${pkgver%.*}/Fedora_30/${CARCH}/kata-linux-container-${_kata_kernel_ver}${_default_suffix}.${CARCH}.rpm"
  #"https://download.opensuse.org/repositories/home:/katacontainers:/releases:/${CARCH}:/stable-${pkgver%.*}/Fedora_30/${CARCH}/kata-proxy-bin-${pkgver}${_default_suffix}.${CARCH}.rpm"
  #"https://download.opensuse.org/repositories/home:/katacontainers:/releases:/${CARCH}:/stable-${pkgver%.*}/Fedora_30/${CARCH}/kata-runtime-${pkgver}${_default_suffix}.${CARCH}.rpm"
  #"https://download.opensuse.org/repositories/home:/katacontainers:/releases:/${CARCH}:/stable-${pkgver%.*}/Fedora_30/${CARCH}/kata-shim-bin-${pkgver}${_default_suffix}.${CARCH}.rpm"
)
sha256sums=(
  'aa3cf95adc7bb476085d2cf47cb4ec1875fc59a477b8c47741244498985f60f3'
  #'0f49409c3d92ec61a7af737622b1e6cde2e3cb76133bf54fafe8335d8342af45'
  '811e333bf837cc8d67977705c1a5968b0f7b58760cf8756ecbf63cdc776e3095'
  #'d9fa74e78c62cc078c31a551feab22861e8c30da5e6b58d3ad81db1e03f73dc4'
  #'ea0061c4c48d058597345c3c98bc0219204cb8544774885f8f13f2040d0c00dc'
  #'a17ff2f49436f6a89099d94ac7086a37bceeb46ea80cf440ca5a9bfa1b44aa5e'
  #'a3b856b313db073bbcb7a3195bfad5c4570c365613638bbcf3ed1fc2e7f8622a'
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
    ${srcdir}${_bin_pkg_root}/share/kata-containers/vmlinuz-* \
    ${srcdir}${_bin_pkg_root}/share/kata-containers/config-*
  cd "${pkgdir}/usr/share/kata-containers/"
  ln -sf vmlinux-virtio-fs-* vmlinux-virtiofs.container
  ln -sf vmlinuz-virtio-fs-* vmlinuz-virtiofs.container
  # bash-specific behavior?
  ln -s vmlinux-[0-9].[0-9]* vmlinux.container
  ln -s vmlinuz-[0-9].[0-9]* vmlinuz.container
}

package_kata-containers-static(){
  cp -dr --no-preserve='ownership' "${srcdir}/opt" "${pkgdir}/opt"
}
