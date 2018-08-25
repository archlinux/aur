# Maintainer: Jonathan Liu <net147@gmail.com>
pkgname=snd-usb-audio-lowlatency-dkms
_basepkgname=snd-usb-audio-lowlatency
pkgver=4.18.4
_srcname=linux-${pkgver%.*}
pkgrel=1
pkgdesc="snd-usb-audio kernel module modified for low latency"
arch=('any')
url="https://www.kernel.org/"
license=('GPL2')
depends=('dkms')
source=(
  "https://cdn.kernel.org/pub/linux/kernel/v4.x/${_srcname}.tar.xz"
  "https://cdn.kernel.org/pub/linux/kernel/v4.x/patch-${pkgver}.xz"
  'dkms.conf'
  'lowlatency.patch'
)
validpgpkeys=(
  'ABAF11C65A2970B130ABE3C479BE3E4300411886'  # Linus Torvalds
  '647F28654894E3BD457199BE38DBBDC86092693E'  # Greg Kroah-Hartman
)
sha256sums=('19d8bcf49ef530cd4e364a45b4a22fa70714b70349c8100e7308488e26f1eaf1'
            'cc22261cd9651dc2a05ad817a5b5fd3c63076ca86abfade7097915e7ba0b3bd6'
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
