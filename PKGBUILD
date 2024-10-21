# Maintainer Yury Bobylev <bobilev_yury@mail.ru>
# Contributor : Andres Urquijo <alfagalileox@gmail.com>

pkgname=mathgl
pkgver=8.0.2
pkgrel=1
pkgdesc="A library for making high-quality scientific graphics"
arch=('i686' 'x86_64')
url="http://${pkgname}.sourceforge.net"
license=('GPL3')
depends=('giflib' 'texlive-latexrecommended' 'texlive-latexextra' 'hdf5' 'gsl' 'glu' 'qt6-base' 'qt6-5compat' 'libharu' 'libpng' 'freeglut')
makedepends=('cmake' 'gcc' 'make')
source=("https://sourceforge.net/projects/$pkgname/files/$pkgname/$pkgname%208.0/$pkgname-$pkgver.tar.gz" "new_libharu.patch")
sha256sums=('71660995684a6b0a2823f678f6c438ababa474a115246cdf5f9b0b460abfcac1'
            '4b73de3f1f5069a207ed5124d40dd16d09c0d89cedb8605c461545bf19ed68c9')

prepare() {
  cd $pkgname-$pkgver
  patch -Np1 -i ../new_libharu.patch
}


build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
      	[[ -d build ]] && rm -rf build
    	mkdir build && cd build

  cmake .. -DCMAKE_INSTALL_PREFIX=/usr \
           -Denable-all-widgets=OFF \
           -Denable-double=ON \
           -Denable-opengl=ON \
           -Denable-mgltex=ON \
           -Denable-doc-info=ON \
           -Denable-doc-html=ON \
           -Denable-gif=ON \
           -Denable-glut=ON \
           -Denable-hdf5=ON \
           -Denable-pdf=ON \
           -Denable-jpeg=ON \
           -Denable-mgl2=ON \
           -Denable-gsl=ON \
           -Denable-png=ON \
           -Denable-qt6=ON \
           -Denable-qt6asqt=ON
  
  make -j$(nproc)
  cp ../translations/mathgl_en.mo .
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make DESTDIR="${pkgdir}" install
}
