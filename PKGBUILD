# Maintainer: Jonathan Liu <net147@gmail.com>
pkgname=snd-usb-audio-lowlatency-dkms
_basepkgname=snd-usb-audio-lowlatency
pkgver=4.18.9
_srcname=linux-${pkgver%.*}
pkgrel=2
pkgdesc="snd-usb-audio kernel module modified for low latency"
arch=('any')
url="https://www.kernel.org/"
license=('GPL2')
depends=('dkms')
install="${pkgname}.install"
source=(
  "https://cdn.kernel.org/pub/linux/kernel/v4.x/${_srcname}.tar.xz"
  "https://cdn.kernel.org/pub/linux/kernel/v4.x/patch-${pkgver}.xz"
  "${pkgname}.install"
  'dkms.conf'
  'parameters.patch'
  'snd-usb-audio.conf'
)
validpgpkeys=(
  'ABAF11C65A2970B130ABE3C479BE3E4300411886'  # Linus Torvalds
  '647F28654894E3BD457199BE38DBBDC86092693E'  # Greg Kroah-Hartman
)
sha256sums=('19d8bcf49ef530cd4e364a45b4a22fa70714b70349c8100e7308488e26f1eaf1'
            'd819e109cb892859f9ffbb4987678076e1535b9e60c12b6512d3847da43e528b'
            'b2b40e2640986d0d965ff243d892d6d4d36cdadd930f4e83efffcbd8cbcf75ca'
            '69f325c3af92c4098c9d118b2eab7de76eba691677864f714697bce5f47005e2'
            '7c9b89931e4edc595dda38f8c6116dc45d10d191885c52aba3d9d8efdc26d261'
            '346e8ae33ac878530f5a9538424f006f0f6017a5d26852cd917d209eb1ab3add')

prepare() {
  cd "${_srcname}"
  patch -Np1 -i ../patch-${pkgver}
  patch -Np1 -i ../parameters.patch
}

package() {
  cd "${_srcname}"
  install -Dm644 ../dkms.conf "${pkgdir}/usr/src/${_basepkgname}-${pkgver}/dkms.conf"
  sed -e "s/@PKGVER@/${pkgver}/" -i "${pkgdir}/usr/src/${_basepkgname}-${pkgver}/dkms.conf"
  cp -a sound/usb/* "${pkgdir}/usr/src/${_basepkgname}-${pkgver}/"
  install -Dm644 ../snd-usb-audio.conf "${pkgdir}/usr/lib/modprobe.d/snd-usb-audio.conf"
}

# vim:set ts=2 sw=2 et:
