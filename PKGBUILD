# Maintainer: vitamin1980 <vitamin.novgorod @ yandex.ru>

pkgname=moxa-uport11x0-git
pkgver=1.3.11
pkgrel=1
pkgdesc='Moxa UPort 11x0 USB to Serial Hub driver'
url='http://www.moxa.com/product/usb_to_serial_converters.htm'
arch=('i686' 'x86_64')
license=('GPL')
depends=('linux')
makedepends=('linux-headers' 'make' 'git')
conflicts=('moxa-uport11x0-git-dkms')
source=("https://github.com/ellysh/mxu11x0.git"
        "install"
        "mxu11x0.conf" )
sha256sums=('SKIP'
            'eedaf97118ded07bd09be79706c358fbcac53c63f2a93de9b1d3ec6c63fce2ff'
            'a80410b68b562c731e80419eb77849766c0acaf4882d84dfe5d865221d3f3a76')

_kernmajor="$(pacman -Q linux | awk '{print $2}' | cut -d - -f1 | cut -d . -f1,2)"
_extramodules="extramodules-${_kernmajor}-ARCH"
_kernver=$(pacman -Q linux | cut -d " " -f2)-"ARCH"

install=install

build() {
  git clone https://github.com/ellysh/mxu11x0.git
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