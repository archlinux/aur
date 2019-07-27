# Maintainer: Frans-Willem Hardijzer <fw@hardijzer.nl>
pkgbase=linux-surface-jakeday-bin
pkgname=(linux-surface-jakeday-bin linux-surface-jakeday-bin-headers)
pkgver=5.1.15
pkgrel=1
_releasenum=8
pkgdesc="Kernel release for Microsoft Surface devices from https://github.com/jakeday/linux-surface/. Copied binary from jakedays release."
makedepends=('git')
arch=('any')
url="https://github.com/jakeday/linux-surface/"
license=('custom')
options=(!strip)
source=(
  "https://github.com/jakeday/linux-surface/releases/download/${pkgver}-${pkgrel}/linux-image-${pkgver}-surface-linux-surface_${pkgver}-surface-linux-surface-${_releasenum}_amd64.deb"
  "https://github.com/jakeday/linux-surface/releases/download/${pkgver}-${pkgrel}/linux-headers-${pkgver}-surface-linux-surface_${pkgver}-surface-linux-surface-${_releasenum}_amd64.deb"
  "linux.preset"
  "60-linux.hook"
  "90-linux.hook"
)
noextract=(
  "linux-image-${pkgver}-surface-linux-surface_${pkgver}-surface-linux-surface-${_releasenum}_amd64.deb"
  "linux-headers-${pkgver}-surface-linux-surface_${pkgver}-surface-linux-surface-${_releasenum}_amd64.deb"
)
md5sums=('538ea973edaba6c45a940f9a1aa898e3'
         '9ad44592c98b277e49705cf9e4d3583b'
         'a329f9581060d555dc7358483de9760a'
         'ce6c81ad1ad1f8b333fd6077d47abdaf'
         'b448c99f0ea9aaee9b13784958a98fd0')

prepare() {
  cd "${srcdir}/"
  mkdir -p kernel-deb
  cd kernel-deb
  ar x "${srcdir}/linux-image-${pkgver}-surface-linux-surface_${pkgver}-surface-linux-surface-${_releasenum}_amd64.deb"
  tar -xf data.tar.xz

  cd "${srcdir}/"
  mkdir -p header-deb
  cd header-deb
  ar x "${srcdir}/linux-headers-${pkgver}-surface-linux-surface_${pkgver}-surface-linux-surface-${_releasenum}_amd64.deb"
  tar -xf data.tar.xz
}

package_linux-surface-jakeday-bin() {
  install -d "${pkgdir}/boot"
  install -Dm644 "${srcdir}/kernel-deb/boot/vmlinuz-${pkgver}-surface-linux-surface" "${pkgdir}/boot/vmlinuz-linux-surface-linux-surface"
  install -d "${pkgdir}/etc/mkinitcpio.d"
  local _extramodules="extramodules-surface-linux-surface"
  local _kernver=${pkgver}-surface-linux-surface
  local _subst="
    s|%PKGBASE%|linux-surface-linux-surface|g
    s|%KERNVER%|${pkgver}-surface-linux-surface|g
    s|%EXTRAMODULES%|${_extramodules}|g
  "

  install -d "${pkgdir}/usr/lib/modules/"
  cp -r "${srcdir}/kernel-deb/lib/modules/${_kernver}" "${pkgdir}/usr/lib/modules/"
  install -Dm644 "${srcdir}/kernel-deb/boot/vmlinuz-${pkgver}-surface-linux-surface" "${pkgdir}/usr/lib/modules/${_kernver}/vmlinuz"
  _olddir="$(pwd)"
  cd "${pkgdir}/usr/lib/modules/${_kernver}/"
  echo "Compressing modules"
  find -name "*.ko" -print0 | xargs -0 -n1 -P 4 xz -z
  echo "Done compressing modules"
  cd "${_olddir}"
  ln -s "../${_extramodules}" "${pkgdir}/usr/lib/modules/${_kernver}/extramodules"

  install -d $"${pkgdir}/usr/lib/modules/${_extramodules}"
  echo "${_kernver}" |
    install -Dm644 /dev/stdin "${pkgdir}/usr/lib/modules/${_extramodules}/version"

  sed "${_subst}" "${srcdir}/linux.preset" |
    install -Dm644 /dev/stdin "${pkgdir}/etc/mkinitcpio.d/linux-surface-linux-surface.preset"

  sed "${_subst}" "${srcdir}/60-linux.hook" |
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/libalpm/hooks/60-${pkgbase}.hook"
  sed "${_subst}" "${srcdir}/90-linux.hook" |
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/libalpm/hooks/90-${pkgbase}.hook"

  depmod -b "${pkgdir}/usr" -F "${srcdir}/kernel-deb/boot/System.map-${_kernver}" "${_kernver}"
}

package_linux-surface-jakeday-bin-headers() {
  local _kernver=${pkgver}-surface-linux-surface
  install -d "${pkgdir}/usr/lib/modules/"
  install -d "${pkgdir}/usr/lib/modules/${_kernver}"
  cp -r "${srcdir}/header-deb/usr/src/linux-headers-${_kernver}" "${pkgdir}/usr/lib/modules/${_kernver}/build"
  # Remove all non-x86 architectures
  for remove_arch in $(ls "${pkgdir}/usr/lib/modules/${_kernver}/build/arch/" | grep -v "x86\|Kconfig")
  do
    rm -rf "${pkgdir}/usr/lib/modules/${_kernver}/build/arch/${remove_arch}"
  done
}
