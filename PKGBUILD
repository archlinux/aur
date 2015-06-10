# Maintainer: Padfoot <padfoot at exemail dot com dot au>
# Contributor: Mr_Men <tetcheve at gmail dot com>
# Contributor: Hasan Gormus aka hsngrms <hsngrms at yandex dot com>
# Contributor: uwinkelvos <uwinkelvos at gmx dot de>

pkgname=nvidiabl
pkgver=0.88
pkgrel=3
pkgdesc="Backlight driver for NVidia graphics adapters"

arch=('x86_64' 
      'i686')
url="https://github.com/guillaumezin/nvidiabl"
license=('GPL')

makedepends=('linux-headers'
             'unzip')
conflicts=('nvidia-bl' 'nvidiablctl')

install=nvidiabl.install
source=(https://github.com/guillaumezin/nvidiabl/archive/master.zip 
        nvidiabl-master.patch)
md5sums=('5fdda33fedcb78320c1581e84b395d39'
         '79e5699da970908d6ec8dba114df87cb')

prepare() {
  cd "${srcdir}/nvidiabl-master/"
  patch -p1 -i "${srcdir}/nvidiabl-master.patch"
}

build() {
  cd "${srcdir}/nvidiabl-master/"
  make
}

package() {
  cd "${srcdir}/nvidiabl-master/"
  _extramodules="extramodules-$(uname -r | cut -f-2 -d'.')-$(uname -r|sed -e 's/.*-//g')"
  _MODPATH="${pkgdir}/usr/lib/modules/${_extramodules}/"
  install -d "${_MODPATH}"
  install -d "${pkgdir}/usr/bin/"

  install -m 644 "${srcdir}/nvidiabl-master/nvidiabl.ko" "${_MODPATH}"
  install -m 644 scripts/usr/local/sbin/nvidiablctl "${pkgdir}/usr/bin/"
}
