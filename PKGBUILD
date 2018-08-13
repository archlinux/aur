# Maintainer: Jonathan Liu <net147@gmail.com>
pkgname=snd-usb-audio-lowlatency-dkms
_basepkgname=snd-usb-audio-lowlatency
_srcname=linux-4.17
pkgver=4.17.14
pkgrel=3
pkgdesc="snd-usb-audio kernel module modified for low latency"
arch=('any')
url="https://www.kernel.org/"
license=('GPL2')
depends=('dkms')
source=(
  "https://www.kernel.org/pub/linux/kernel/v4.x/${_srcname}.tar.xz"
  "https://www.kernel.org/pub/linux/kernel/v4.x/patch-${pkgver}.xz"
  'dkms.conf'
  'lowlatency.patch'
)
validpgpkeys=(
  'ABAF11C65A2970B130ABE3C479BE3E4300411886'  # Linus Torvalds
  '647F28654894E3BD457199BE38DBBDC86092693E'  # Greg Kroah-Hartman
)
sha256sums=('9faa1dd896eaea961dc6e886697c0b3301277102e5bc976b2758f9a62d3ccd13'
            'bf4d95df98dc6197024bc2a7c8a8ef5fd3b21495298c7a7a5dbd63c159ea9f17'
            '69f325c3af92c4098c9d118b2eab7de76eba691677864f714697bce5f47005e2'
            'c2b7784899d184b142c5969c1be17cc949f11f4e59fbe5b1a8ffe062a1c4a88f')

prepare() {
  cd "${_srcname}"
  patch -Np1 -i ../patch-${pkgver}
  patch -Np1 -i ../lowlatency.patch
}

package() {
  cd "${_srcname}"
  install -Dm644 ../dkms.conf "${pkgdir}/usr/src/${_basepkgname}-${pkgver}/dkms.conf"
  sed -e "s/@PKGVER@/${pkgver}/" -i "${pkgdir}/usr/src/${_basepkgname}-${pkgver}/dkms.conf"
  cp -a sound/usb/* "${pkgdir}/usr/src/${_basepkgname}-${pkgver}/"
}

# vim:set ts=2 sw=2 et:
