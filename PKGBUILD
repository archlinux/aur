# Maintainer: Andrew Kotsyuba <avallach2000@gmail.com>

_pkgbase=digimend-kernel-drivers
_dkmsbase=digimend
pkgname=digimend-kernel-drivers-dkms
pkgver=10
pkgrel=1
pkgdesc='Linux kernel modules (DKMS) for non-Wacom USB graphics tablets'
arch=('any')
url='https://digimend.github.io'
license=('GPL2')
depends=('dkms' 'systemd' 'xf86-input-wacom')
conflicts=("${pkgname}-git")
source=(
    "${pkgname}-v${pkgver}.tar.gz::https://github.com/DIGImend/${_pkgbase}/archive/refs/tags/v${pkgver}.tar.gz"
    "Makefile"
)
sha256sums=(
    '3f4c1e2f66b2c1b12a0895dfdf0fe567381ea92cfe7d62ab4645242dd4e98152'
    'dfc2907a31ce4d0d0f2afdbb089f0b23debafde96fa038ef58fd3fe63aa6d379'
)
install="${pkgname}.install"

package() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"

  install -Dm 0755 digimend-debug   "${pkgdir}/usr/bin/digimend-debug"
  install -Dm 0755 hid-rebind       "${pkgdir}/usr/bin/hid-rebind"

  install -Dm 0644 xorg.conf        "${pkgdir}/etc/X11/xorg.conf.d/50-digimend.conf"
  install -Dm 0644 depmod.conf      "${pkgdir}/etc/depmod.d/digimend.conf"
  install -Dm 0644 udev.rules       "${pkgdir}/etc/udev/rules.d/90-hid-rebind.rules"

  install -dm 0755 "${pkgdir}/usr/src/${_dkmsbase}-${pkgver}"
  install -dm 0755 "${pkgdir}/usr/src/${_dkmsbase}-${pkgver}/usbhid"
      
  install -Dm 0644 dkms.conf        "${pkgdir}/usr/src/${_dkmsbase}-${pkgver}/dkms.conf"

  for f in {usbhid/,}*.[ch] ; do
    install -Dm 0644 "$f" "${pkgdir}/usr/src/${_dkmsbase}-${pkgver}/${f}"
  done

  install -Dm 0644 "${srcdir}/Makefile" "${pkgdir}/usr/src/${_dkmsbase}-${pkgver}/Makefile"
}
