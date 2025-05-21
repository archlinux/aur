# Maintainer: exu <aur _a_ frm01 _d_ net>
# Contributor: Andrew Kotsyuba <avallach2000@gmail.com>

_pkgbase=digimend-kernel-drivers
_dkmsbase=digimend
pkgname=digimend-kernel-drivers-dkms
pkgver=13
pkgrel=2
pkgdesc='Linux kernel modules (DKMS) for non-Wacom USB graphics tablets'
arch=('any')
url='https://digimend.github.io'
license=('GPL2')
depends=('dkms' 'systemd' 'xf86-input-wacom')
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/DIGImend/${_pkgbase}/archive/refs/tags/v${pkgver}.tar.gz"
  "${pkgname}-update-to-linux-6.12.patch::https://patch-diff.githubusercontent.com/raw/DIGImend/digimend-kernel-drivers/pull/707.patch"
  "Makefile")
sha256sums=('ee3fcd2eaa32bee4e5ce742c81e31d7290893772c3931d1888b32fe34ec0f3c8'
            '59d6438f5e6d19aa013d54014c4eefc7a6608ab9bc54de5f716d98a7e0d94b67'
            'bacc8a6b0c5fdbc95b9ef6072c9db6afc56958c0f8e539d4338b8895377355fe')
install="${pkgname}.install"

prepare() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  patch -Np1 -i ../${pkgname}-update-to-linux-6.12.patch
}

package() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"

  install -Dm 0755 digimend-debug "${pkgdir}/usr/bin/digimend-debug"
  install -Dm 0755 hid-rebind "${pkgdir}/usr/bin/hid-rebind"

  install -Dm 0644 xorg.conf "${pkgdir}/etc/X11/xorg.conf.d/50-digimend.conf"
  install -Dm 0644 depmod.conf "${pkgdir}/etc/depmod.d/digimend.conf"
  install -Dm 0644 udev.rules "${pkgdir}/etc/udev/rules.d/90-hid-rebind.rules"

  install -dm 0755 "${pkgdir}/usr/src/${_dkmsbase}-${pkgver}"
  install -dm 0755 "${pkgdir}/usr/src/${_dkmsbase}-${pkgver}/usbhid"

  install -Dm 0644 dkms.conf "${pkgdir}/usr/src/${_dkmsbase}-${pkgver}/dkms.conf"

  for f in {usbhid/,}*.[ch]; do
    install -Dm 0644 "$f" "${pkgdir}/usr/src/${_dkmsbase}-${pkgver}/${f}"
  done

  install -Dm 0644 "${srcdir}/Makefile" "${pkgdir}/usr/src/${_dkmsbase}-${pkgver}/Makefile"
}
