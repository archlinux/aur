# Maintainer: Frans-Willem Hardijzer <fw@hardijzer.nl>
pkgname=linux-surface-jakeday-bin
pkgver=4.19.23
pkgrel=1
_releasenum=57
pkgdesc="Kernel release for Microsoft Surface devices from https://github.com/jakeday/linux-surface/. Copied binary from jakedays release."
makedepends=('git')
arch=('any')
url="https://github.com/jakeday/linux-surface/"
license=('custom')
options=(!strip)
source=(
  "https://github.com/jakeday/linux-surface/releases/download/${pkgver}-${pkgrel}/linux-image-${pkgver}-surface-linux-surface_${pkgver}-surface-linux-surface-${_releasenum}_amd64.deb"
  "linux.preset"
  "60-linux.hook"
  "90-linux.hook"
)
md5sums=('39b6af3356593e2cda54c0fdb85eafdb'
         'a329f9581060d555dc7358483de9760a'
         'ce6c81ad1ad1f8b333fd6077d47abdaf'
         'b448c99f0ea9aaee9b13784958a98fd0')

prepare() {
  cd "${srcdir}/"
  mkdir -p kernel-deb
  cd kernel-deb
  ar x "${srcdir}/linux-image-${pkgver}-surface-linux-surface_${pkgver}-surface-linux-surface-${_releasenum}_amd64.deb"
  tar -xf data.tar.xz
}

package() {
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
  find -name "*.ko" -exec xz -z {} \;
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
