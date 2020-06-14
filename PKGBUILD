# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Jiachen Yang <farseerfc@gmail.com>
# Contributor: Llumex03
# Maintainer in Chakra: gnastyle
# Contributor in Chakra: FranzMari from Chakra
# Contributor in Chakra: danyf90 <daniele.formihelli@gmail.com>
# Contributor in Chakra: totoloco <totoloco@gmx.com>

_pkgname=cutegram
pkgname=$_pkgname-git
pkgver=2.9.5+de+51+g59b53fe8
pkgrel=1
pkgdesc="A different telegram client from Aseman team"
arch=('i686' 'x86_64')
url="http://aseman.co/en/products/cutegram/"
license=('GPL')
depends=('libqtelegram-ae' 'telegramqml' 'aseman-qt-tools' 'qt5-declarative')
optdepends=('gst-plugins-good: for audio and notification support'
            'gst-plugins-bad: for audio support')
makedepends=('git')
source=("${pkgname}"::"git+https://github.com/Aseman-Land/Cutegram.git"
        '0001-remove-error-dialog.patch')
sha256sums=('SKIP'
            '13d4d5404fa98509c908db0444e3a4cbde598f85351de9081a986857045e2487')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long | sed 's/\([^-]*-g\)/\1/;s/-/+/g' | sed 's/.stable//g' | sed 's/v//g'
}

prepare() {
  cd "${srcdir}/${pkgname}"

  patch -Np1 -i $srcdir/0001-remove-error-dialog.patch
  # change the heading application
  sed 's,qmlscene,qmlscene-qt5,g' -i cutegram.pro
  mkdir -p build
}

build() {
  cd "${srcdir}/${pkgname}/build"
  qmake-qt5 QMAKE_CFLAGS_ISYSTEM= PREFIX=/usr DEFINES+=WEBENGINE_ASEMAN_WEBGRABBER CONFIG+=binaryMode ..
  make
}

package() {
  cd "${srcdir}/${pkgname}/build"
  make INSTALL_ROOT="${pkgdir}" install
}
