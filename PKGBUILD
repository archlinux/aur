# $Id$
# Maintainer: zer0def <zer0def@github>
# Contributor: Kaushal M <kshlmster cat gmail dog com>
# Contributor: Stefan Zwanenburg <stefan cat zwanenburg dog info>

pkgbase=kata2-containers-bin
pkgname=(
  kata2-runtime-bin
  kata2-containers-image-bin
  kata2-linux-container-bin
)
pkgver="2.0.1"
_pkgver=${pkgver/\~/-}
pkgrel=1
pkgdesc="Lightweight virtual machines for containers (binary version)"
arch=(x86_64)
url="https://katacontainers.io"
license=('Apache')

_bin_pkg_root="/opt/kata"  # `/usr` for f30 packages, `/opt/kata` for static packages

if [ "${_bin_pkg_root}" = "/opt/kata" ]; then
  #pkgname+=(kata2-containers-static)
  source=("https://github.com/kata-containers/kata-containers/releases/download/${_pkgver}/kata-static-${_pkgver}-${CARCH}.tar.xz")
  sha512sums=(6b35e67aaead7e12e1950a7124fdf94f3638888e201b67f9651189f295335d05dbd4fd72cb091bf44c06e7ed36e0436b2ccf046f14187c558c3782240db75b10)
  b2sums=(b4e53777954a456b7950d02b00e379eabb6e347ef526ab9dac8ef307c598e5dfbda1968285789008ce1150de1a5f3cbe968eb39d54c09e1fd4189f998497ef0a)
else
  _kata_kernel_ver="5.4.32.76"
  _default_suffix="-8.1"  # f30 package build revision
  #_image_suffix="-6.1"
  #_ksm_suffix="-6.1"
  _kernel_suffix="-9.1"
  #_proxy_suffix="-6.1"
  #_runtime_suffix="-6.1"
  #_shim_suffix="-6.1"

  source=(
    "https://download.opensuse.org/repositories/home:/katacontainers:/releases:/${CARCH}:/stable-${pkgver%.*}/Fedora_30/${CARCH}/kata-containers-image-${pkgver}${_image_suffix:-${_default_suffix}}.${CARCH}.rpm"
    "https://download.opensuse.org/repositories/home:/katacontainers:/releases:/${CARCH}:/stable-${pkgver%.*}/Fedora_30/${CARCH}/kata-linux-container-${_kata_kernel_ver}${_kernel_suffix:-${_default_suffix}}.${CARCH}.rpm"
    "https://download.opensuse.org/repositories/home:/katacontainers:/releases:/${CARCH}:/stable-${pkgver%.*}/Fedora_30/${CARCH}/kata-proxy-bin-${pkgver}${_proxy_suffix:-${_default_suffix}}.${CARCH}.rpm"
    "https://download.opensuse.org/repositories/home:/katacontainers:/releases:/${CARCH}:/stable-${pkgver%.*}/Fedora_30/${CARCH}/kata-runtime-${pkgver}${_runtime_suffix:-${_default_suffix}}.${CARCH}.rpm"
    "https://download.opensuse.org/repositories/home:/katacontainers:/releases:/${CARCH}:/stable-${pkgver%.*}/Fedora_30/${CARCH}/kata-shim-bin-${pkgver}${_shim_suffix:-${_default_suffix}}.${CARCH}.rpm"
  )
  sha512sums=(
    70aaad6efc468baa2ef05f971b4c755f9035d83e2ac4dcdf3b53ff95c58a8fa5063d2427a585e8657801b78d290b0362480d05c987b093f69c969566dff99036
    618f8272360f2f5685f1bd3bc1a05df42a4229387cda9ca7b2ca6846a9974eee4d1f85fd46b62f8d65a014f64f257922601f65d5a489e83d6220af1426e2e137
    4a7b3650d3747633f44dcb3c6a7d6258c2aa70e169c10f7e686b5772c467eb0bb69f91370c4546d11a81311fe0d69428c7f4db75e0c665e2673f6282e1abeb71
    37ed3a0799f3d54d8917125a9713c297256cb952c3e53314ff51ace2b8eaa0093e16596dfd0448a101bc555697d4c5a750c7d789d19016dce04e15beb051bbaa
    1d37f6ff64a7d2cbb097b4157da3200559bf6ca301727a4af1f04c87c739626c17a9e558acd54dc58a83656ec83cf0ffa8c5f70d6ed1d4f316fe662717d76902
  )
  b2sums=(
    fed5a77db2301cac9f60ed6094456911d941644eeb65eb83fb4b1b240638f9c5e8f6b29f73f5533b66b83299106109b490607f1a0302ba29e8d50e78a46761f9
    694ba5743566052bfe26629ceb040c252b966e03b8231fd63b5287121f7a4a4825948e6723142a92705dad84968cfc8c37d10dbca8a3b90c16798d2708d13706
    19bddd80d61aed3723abae649c0ea3de8deba49a544ead288ccc41efb73c173b54b7cbaf50358ec673b267ff04c099f9556a26db2a56f42edefbe252471a4865
    58bfbc87ae6f48938138b05008dc855beb7df208bf80ca0c30a7f4b6e9d17ff035b8bf0f15e06e0cf7dcd668b44756945939c9d1b3622443274e4229e2316e84
    ff2b46172c09a458180b4addb0ce2dc512a568a61ae5c29fc3d75a07ae75c513e2a8a2355cdae5992c6e5c433421ea93b943a5be68391f796439790bb3402aed
  )
fi

package_kata2-runtime-bin() {
  depends=(qemu-headless kata2-containers-image kata2-linux-container)
  optdepends=(
    'cloud-hypervisor<0.11.0'
    'firecracker<0.22.0'
  )
  conflicts=('kata2-runtime' 'kata-runtime')
  provides=('kata2-runtime')
  install=kata2-runtime.install

  install -D -m 0755 -t ${pkgdir}/usr/bin \
    ${srcdir}${_bin_pkg_root}/bin/containerd-shim-kata-v2 \
    ${srcdir}${_bin_pkg_root}/bin/kata-runtime \
    ${srcdir}${_bin_pkg_root}/bin/kata-collect-data.sh
  install -D -m 0755 ${srcdir}${_bin_pkg_root}/libexec/kata-containers/kata-netmon ${pkgdir}/usr/lib/kata-containers/kata-netmon
  install -D -m 0644 ${srcdir}${_bin_pkg_root}/share/bash-completion/completions/kata-runtime ${pkgdir}/usr/share/bash-completion/completions/kata-runtime
  install -D -m 0644 -t ${pkgdir}/usr/share/defaults/kata-containers ${srcdir}${_bin_pkg_root}/share/defaults/kata-containers/*.toml
  #install -D -m 0644 ${srcdir}${_bin_pkg_root}/share/kata-qemu/qemu/pvh.bin ${pkgdir}/usr/share/qemu/pvh.bin

  sed -i -e "s;${_bin_pkg_root};/usr;" -e 's/libexec/lib/' -e 's/kata-qemu/qemu/' -e 's/qemu-lite/qemu/' -e 's/qemu-vanilla/qemu/' ${pkgdir}/usr/share/defaults/kata-containers/*.toml ${pkgdir}/usr/bin/kata-collect-data.sh
}

package_kata2-containers-image-bin(){
  conflicts=('kata2-containers-image' 'kata-containers-image')
  provides=('kata2-containers-image')
  install -Dm644 -t "${pkgdir}/usr/share/kata-containers/" \
    ${srcdir}${_bin_pkg_root}/share/kata-containers/kata-containers-image_clearlinux_${_pkgver}_agent_*.img \
    ${srcdir}${_bin_pkg_root}/share/kata-containers/kata-containers-initrd_alpine_${_pkgver}_agent_*.initrd
  cd "${pkgdir}/usr/share/kata-containers/"
  ln -s kata-containers-image_clearlinux_${_pkgver}_agent_*.img kata-containers.img
  ln -s kata-containers-initrd_alpine_${_pkgver}_agent_*.initrd kata-containers-initrd.img
}

package_kata2-linux-container-bin(){
  conflicts=('kata2-linux-container' 'kata-linux-container')
  provides=('kata2-linux-container')
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

package_kata2-containers-static(){
  cp -dr --no-preserve='ownership' "${srcdir}/opt" "${pkgdir}/opt"
}
