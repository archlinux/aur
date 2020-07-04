# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: jfperini <@jfperini>

pkgname=eviacam
pkgver=2.1.4
pkgrel=6
pkgdesc='A mouse replacement software that moves the pointer as you move your head'
arch=('x86_64')
url='https://eviacam.crea-si.com'
license=('GPL3')
depends=('opencv'
         'wxgtk'
         'wxgtk3')
provides=('eviacam')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/cmauri/eviacam/archive/v${pkgver}.tar.gz"
        '0001-Patch-for-new-opencv-4.2.patch')
sha256sums=('0ed868e6f3f32fa48002ebc7cfbd58e1a0035ff954bb09adc4bc27cd3928cceb'
            'SKIP')

prepare() {
  cd "${pkgname}-${pkgver}"
  patch --forward --strip=1 --input=../0001-Patch-for-new-opencv-4.2.patch
  # Dirty fix: 'cvCreateCameraCapture doesn't support legacy API anymore' issue
  sed -i '252s@1@0@' "${srcdir}/${pkgname}-${pkgver}"/src/viacamcontroller.cpp
}

build() {
  cd "${pkgname}-${pkgver}"
  ./autogen.sh
  ./configure --prefix=/usr --with-wx-config=/usr/bin/wx-config-gtk3
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
# vim: ts=2 sw=2 et: