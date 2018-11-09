# Maintainer: Laurent Carlier <lordheavym@gmail.com>
# Contributor: Luca Bennati <lucak3 AT gmail DOT com>
# Contributor: Glaucous <glakke1 at gmail dot com>

pkgname=lib32-apitrace
pkgver=7.1
pkgrel=3
pkgdesc="Graphics API Tracing (32-bit)"
arch=('x86_64')
url="https://github.com/apitrace/apitrace"
license=('custom')
makedepends=('cmake' 'lib32-mesa-libgl' 'lib32-procps-ng' 'python2' 'gcc-multilib')
source=("apitrace-$pkgver.tar.gz::https://github.com/apitrace/apitrace/archive/${pkgver}.tar.gz")
md5sums=('c5d44dece1e1ca7c63f8b8efbd06ac5a')

build() {
  cd "${srcdir}/apitrace-${pkgver}"

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cmake . -Bbuild -DCMAKE_INSTALL_PREFIX=/usr -DPYTHON_EXECUTABLE='/usr/bin/python2.7' \
    -DLIB_SUFFIX=32 -DENABLE_GUI="no"
  make -C build
}

package() {
  depends=('python2' 'lib32-libgl' 'lib32-procps-ng' 'apitrace')

  cd "${srcdir}/apitrace-${pkgver}"
  
  make  -C build DESTDIR="${pkgdir}/" install

  mv -v ${pkgdir}"/usr/bin/apitrace" ${pkgdir}"/usr/bin/apitrace32"
  rm -r ${pkgdir}/usr/share/doc
  rm ${pkgdir}/usr/bin/*retrace
  
  install -m755 -d ${pkgdir}"/usr/share/licenses/apitrace"
  ln -s apitrace "$pkgdir/usr/share/licenses/apitrace/"${pkgname}
}

