# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=uranium
pkgver=2.1.0
pkgrel=1
pkgdesc="A Python framework for building Desktop applications."
url="https://github.com/Ultimaker/Uranium"
arch=('i686' 'x86_64')
license=('GPLv3')
depends=('python' 'qt5-quickcontrols' 'pyqt5-common' 'python-pyqt5' 'python-numpy' 'arcus')
makedepends=('cmake')
source=("https://github.com/Ultimaker/${pkgname}/archive/${pkgver}.tar.gz" qt5.patch scripts.patch Backend.py.patch)
md5sums=('6e0a674a38b4a25c7a6dec859852aa33'
         'e4975dddd0524845b9574b4142274f5a'
         'd1832c5533c1ab6ceffd0a70768ccbd6'
         '3d48bccc0d20475927c1badd81a95e35')

prepare(){
  cd Uranium-${pkgver}
  #patch -Np1 -i ../qt5.patch
  #patch -Np1 -i ../scripts.patch
  #patch -Np1 -i ../Backend.py.patch
}

build() {
  cd Uranium-${pkgver}
  cmake ./ -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd Uranium-${pkgver}
  make DESTDIR="${pkgdir}" install
  SITE_PACKAGES=$(python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())")
  mkdir -p "${pkgdir}${SITE_PACKAGES}"
  mv "${pkgdir}"/usr/lib/python3/dist-packages/* "${pkgdir}${SITE_PACKAGES}"/.
  rm -rf "${pkgdir}"/usr/lib/python3
  #install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
