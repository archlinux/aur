# Maintainer: Christoph Korn <christoph.korn at posteo dot de>
pkgname=beebeep
_pkgver=691
pkgver=3.0.5
pkgrel=1
pkgdesc="Secure LAN Messenger"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/beebeep/" 
license=('GPL3')
depends=('qt4' 'phonon-qt4' 'libxcb' 'avahi')
makedepends=('qt4' 'phonon-qt4' 'libxcb' 'avahi')

source=("http://netcologne.dl.sourceforge.net/project/${pkgname}/Sources/${pkgname}-code-${pkgver}.zip"
        "phonon.patch"
        "${pkgname}.xpm"
        "${pkgname}.desktop"
        "${pkgname}_script")
md5sums=('92b17a4563c5199983157fa95ae3ac7e'
         'cdf0b999e22d0cc030359cbb95d794dd'
         '08e15ed0d7e938c863e5437984e9c597'
         'e89c5abe353abcbbbb2b9ae9be3e46bc'
         'a282005b0f8ee2dffc42704612ad95fe')

prepare() {
  cd beebeep-code-${_pkgver}
  patch -p1 -i $srcdir/phonon.patch
}

build() {
  cd beebeep-code-${_pkgver}
  cd src && qmake-qt4
  cd ../plugins && qmake-qt4
  cd .. && qmake-qt4
  make
}

package(){
  install -Dm755 "${srcdir}/beebeep-code-${_pkgver}/test/${pkgname}" "${pkgdir}/usr/lib/${pkgname}/${pkgname}"
  mkdir -p "${pkgdir}/usr/lib/${pkgname}"
  cp -a ${srcdir}/beebeep-code-${_pkgver}/test/lib*.so.* ${pkgdir}/usr/lib/${pkgname}/

  install -Dm755 "${srcdir}/${pkgname}_script" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}.xpm" "${pkgdir}/usr/share/pixmaps/${pkgname}.xpm"
  install -Dm755 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}

