# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgbase=keystone-git
pkgname=('keystone-git' 'python-keystone-git' 'python2-keystone-git')
pkgver=0.9.1.r151.gd49b6fa
pkgrel=1
pkgdesc='Lightweight multi-platform, multi-architecture assembler framework'
url='http://www.keystone-engine.org/'
arch=('x86_64')
license=('GPL2')
makedepends=('git' 'cmake' 'gcc-libs' 'python' 'python2')
options=('staticlibs' '!emptydirs')
source=(${pkgbase}::git+https://github.com/keystone-engine/keystone)
sha512sums=('SKIP')

pkgver() {
  cd ${pkgbase}
  git describe --always --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd ${pkgbase}
  mkdir -p build-shared build-static
}

build() {
  cd ${pkgbase}
  (cd build-shared
    cmake -DCMAKE_INSTALL_PREFIX=/usr \
      -DCMAKE_INSTALL_LIBDIR=lib \
      -DCMAKE_INSTALL_RPATH= \
      -DBUILD_SHARED_LIBS=ON \
      -G "Unix Makefiles" ..
    make
  )
  (cd build-static
    cmake -DCMAKE_INSTALL_PREFIX=/usr \
      -DCMAKE_INSTALL_LIBDIR=lib \
      -DCMAKE_INSTALL_RPATH= \
      -DBUILD_SHARED_LIBS=OFF \
      -G "Unix Makefiles" ..
    make
  )
  (cd bindings
    python2 const_generator.py python
    python2 const_generator.py ruby
  )
  (cd bindings/python
    python setup.py build
    python2 setup.py build
  )
}

package_keystone-git() {
  depends=('gcc-libs')
  provides=('keystone' 'libkeystone.so')
  conflicts=('keystone')
  cd ${pkgbase}
  make -C build-static DESTDIR="${pkgdir}" install
  make -C build-shared DESTDIR="${pkgdir}" install
  install -Dm 644 samples/* -t "${pkgdir}/usr/share/doc/${pkgname}/samples"
}

package_python-keystone-git() {
  depends=('python' 'keystone')
  license=('BSD')
  provides=('python-keystone')
  conflicts=('python-keystone')
  cd ${pkgbase}/bindings/python
  python setup.py install --root="${pkgdir}" -O1 --skip-build
  install -Dm 755 sample.py -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE.TXT -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_python2-keystone-git() {
  depends=('python2' 'keystone')
  license=('BSD')
  provides=('python2-keystone')
  conflicts=('python2-keystone')
  cd ${pkgbase}/bindings/python
  python2 setup.py install --root="${pkgdir}" -O1 --skip-build
  install -Dm 755 sample.py -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE.TXT -t "${pkgdir}/usr/share/licenses/${pkgname}"
  sed 's|python|python2|' -i "${pkgdir}/usr/share/doc/python2-keystone-git/sample.py"
}

# vim: ts=2 sw=2 et:
