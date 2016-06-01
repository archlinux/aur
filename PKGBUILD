# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgbase=keystone-git
pkgname=('keystone-git' 'python-keystone-git' 'python2-keystone-git')
pkgver=0.9.419.6e33761
pkgrel=1
pkgdesc='Lightweight multi-platform, multi-architecture assembler framework'
url='http://www.keystone-engine.org/'
arch=('i686' 'x86_64')
license=('GPL2')
makedepends=('git' 'cmake' 'gcc-libs' 'python' 'python2')
options=('staticlibs' '!emptydirs')
source=(${pkgbase}::git+https://github.com/keystone-engine/keystone)
sha512sums=('SKIP')

pkgver() {
  cd ${pkgbase}
  printf "%s.%s.%s" "$(git describe --tags --abbrev=0)" \
    "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${pkgbase}
  mkdir build-shared build-static
  (cd build-shared
    cmake -DCMAKE_INSTALL_PREFIX=/usr \
      -DCMAKE_BUILD_TYPE=Release \
      -DBUILD_SHARED_LIBS=ON \
      -DLLVM_TARGETS_TO_BUILD=all \
      -G "Unix Makefiles" ..
  )
  (cd build-static
    cmake -DCMAKE_INSTALL_PREFIX=/usr \
      -DCMAKE_BUILD_TYPE=Release \
      -DBUILD_SHARED_LIBS=OFF \
      -DLLVM_TARGETS_TO_BUILD=all \
      -G "Unix Makefiles" ..
  )
  cp -ra bindings/python{,2}
  sed -r 's|(python)$|\12|' -i bindings/python2/sample.py
}

build() {
  cd ${pkgbase}
  make -C build-shared
  make -C build-static
  (cd bindings/python
    python setup.py build
  )
  (cd bindings/python2
    python2 setup.py build
  )
}

package_keystone-git() {
  depends=('gcc-libs')
  provides=('keystone')
  conflicts=('keystone')
  cd ${pkgbase}
  make -C build-shared DESTDIR="${pkgdir}" install
  make -C build-static DESTDIR="${pkgdir}" install
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
  install -Dm 644 LICENSE.TXT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-keystone-git() {
  depends=('python2' 'keystone')
  license=('BSD')
  provides=('python2-keystone')
  conflicts=('python2-keystone')
  cd ${pkgbase}/bindings/python2
  python2 setup.py install --root="${pkgdir}" -O1 --skip-build
  install -Dm 755 sample.py -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE.TXT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
