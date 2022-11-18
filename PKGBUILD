# Maintainer: Laurent Carlier <lordheavym@gmail.com>
# Contributor: Luca Bennati <lucak3 AT gmail DOT com>
# Contributor: Glaucous <glakke1 at gmail dot com>

pkgname=lib32-apitrace
pkgver=11.1
pkgrel=1
pkgdesc="Graphics API Tracing (32-bit)"
arch=('x86_64')
url="https://github.com/apitrace/apitrace"
license=('custom')
depends=('python' 'lib32-libgl' 'lib32-procps-ng' 'apitrace')
makedepends=('cmake' 'git' 'gcc-multilib')
source=("apitrace-$pkgver::git+https://github.com/apitrace/apitrace.git#tag=${pkgver}")
sha256sums=('SKIP')

prepare() {
  cd apitrace-${pkgver}

  git submodule update --init --depth 1 --recursive
}


build() {
  cd apitrace-${pkgver}

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cmake . -Bbuild -DCMAKE_INSTALL_PREFIX=/usr -DPYTHON_EXECUTABLE='/usr/bin/python2.7' \
    -DLIB_SUFFIX=32 -DENABLE_GUI="no"
  make -C build
}

package() {
  cd apitrace-${pkgver}
  
  make  -C build DESTDIR="${pkgdir}/" install

  mv -v ${pkgdir}"/usr/bin/apitrace" ${pkgdir}"/usr/bin/apitrace32"
  rm -r ${pkgdir}/usr/share/doc
  rm ${pkgdir}/usr/bin/{*retrace,gltrim}
  
  install -m755 -d "${pkgdir}/usr/share/licenses/apitrace"
  ln -s apitrace "$pkgdir/usr/share/licenses/apitrace/"${pkgname}
}

