# Contributor: Luca Bennati <lucak3 AT gmail DOT com>
# Maintainer: Glaucous <glakke1 at gmail dot com>

pkgname=lib32-apitrace-git
pkgver=3626.11b6bfa
pkgrel=1
pkgdesc="Graphics API Tracing from git (32-bit)"
arch=('x86_64')
url="https://github.com/apitrace/apitrace"
license=('BSD')
makedepends=('cmake' 'git' 'lib32-mesa' 'lib32-libgl' 'lib32-procps-ng' 'python2' 'gcc-multilib')
provides=('lib32-apitrace')
conflicts=('lib32-apitrace')
source=('apitrace::git+http://github.com/apitrace/apitrace.git#branch=master')
md5sums=(SKIP)

pkgver() {
  cd ${srcdir}/apitrace

  echo $(git rev-list --count master).$(git rev-parse --short master)
#  echo $(cat VERSION).$(git rev-list --count master).$(git rev-parse --short master) | sed 's/^v//;s/-/./g'
}

build() {
  cd ${srcdir}/apitrace

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cmake . -Bbuild -DCMAKE_INSTALL_PREFIX=/usr -DPYTHON_EXECUTABLE='/usr/bin/python2.7' \
    -DLIB_SUFFIX=32 -DENABLE_GUI="no"
  make -C build
}

package() {
  depends=('python2' 'lib32-libgl' 'lib32-procps-ng' 'apitrace-git')

  cd "${srcdir}"/apitrace
  
  make  -C build DESTDIR="${pkgdir}/" install

  mv -v ${pkgdir}"/usr/bin/apitrace" ${pkgdir}"/usr/bin/apitrace32"
  rm -r ${pkgdir}/usr/share/doc
  rm ${pkgdir}/usr/bin/*retrace
  
  install -m755 -d ${pkgdir}"/usr/share/licenses/apitrace"
  ln -s apitrace "$pkgdir/usr/share/licenses/apitrace/"${pkgname}
}

# vim:set ts=2 sw=2 et:

