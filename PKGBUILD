# Maintainer: Viktor Vasilyev <vitamin.novgorod @ yandex.ru>

pkgname=moxa-uport11x0
pkgver=1.3.11
pkgrel=6
pkgdesc='Moxa UPort 11x0 USB to Serial Hub driver'
url='http://www.moxa.com/product/usb_to_serial_converters.htm'
arch=('i686' 'x86_64')
license=('GPL')
depends=('linux')
makedepends=('linux-headers')
source=("driv_linux_uport1p_v1.3.11_build_13121621.tgz::http://www.moxa.ru/forum/index.php?app=core&module=attach&section=attach&attach_id=1538"
        "install"
        "mxu11x0.conf" )
sha256sums=('d1e873044f311befe5a387816b996387d612bfe6838da8f1d1fc52e447027f2c'
            'eedaf97118ded07bd09be79706c358fbcac53c63f2a93de9b1d3ec6c63fce2ff'
            'a80410b68b562c731e80419eb77849766c0acaf4882d84dfe5d865221d3f3a76')

_kernmajor="$(pacman -Q linux | awk '{print $2}' | cut -d - -f1 | cut -d . -f1,2)"
_extramodules="extramodules-${_kernmajor}-ARCH"
_kernver="$(uname -r)"

install=install

build() {
  cd "${srcdir}/mxu11x0/driver"
  make
}

package() {
  cd "${srcdir}"
  install -Dm644 mxu11x0.conf "${pkgdir}/usr/lib/modules-load.d/mxu11x0.conf"
  cd "${srcdir}/mxu11x0/driver"
  install -Dm644 mxu11x0.ko "${pkgdir}/usr/lib/modules/${_extramodules}/mxu11x0.ko"
  gzip "${pkgdir}/usr/lib/modules/${_extramodules}/mxu11x0.ko"
}