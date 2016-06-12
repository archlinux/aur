# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Mike Sampson <mike at sambodata dot com>
# Contributor: Dmitry A. Ilyashevich <dmitry.ilyashevich@gmail.com>

pkgbase=distorm-git
pkgname=('distorm-git' 'python-distorm-git' 'python2-distorm-git')
pkgver=3.3.4.146.1637726
pkgrel=1
pkgdesc='Powerful disassembler library for x86/AMD64'
url='https://github.com/gdabah/distorm'
arch=('i686' 'x86_64')
license=('BSD')
makedepends=('python' 'python2' 'glibc' 'git')
options=('staticlibs')
source=(${pkgbase}::git+https://github.com/gdabah/distorm)
sha512sums=('SKIP')

pkgver() {
  cd ${pkgbase}
  printf "%s.%s.%s" "$(git describe --tags --abbrev=0|sed -r 's|v?(.+)|\1|')" \
    "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cp -ra ${pkgbase}{,-py2}
  sed -e '1i#!/usr/bin/env python' -i ${pkgbase}/python/distorm3/sample.py
  sed -e '1i#!/usr/bin/env python2' -i ${pkgbase}-py2/python/distorm3/sample.py
}

build() {
  (cd ${pkgbase}
    make -C make/linux
    python setup.py build
  )
  (cd ${pkgbase}-py2
    python2 setup.py build
  )
}

package_distorm-git() {
  depends=('glibc')
  provides=('distorm')
  conflicts=('distorm')
  cd ${pkgbase}
  make -C make/linux PREFIX=/usr DESTDIR="${pkgdir}" install
  install -Dm 644 include/*.h -t "${pkgdir}/usr/include"
  install -Dm 644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python-distorm-git() {
  depends=('python')
  provides=('python-distorm')
  conflicts=('python-distorm')
  cd ${pkgbase}
  python setup.py install --root="${pkgdir}" -O1 --skip-build
  install -Dm 755 python/distorm3/sample.py "${pkgdir}/usr/bin/disasm"
  install -Dm 644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-distorm-git() {
  depends=('python2')
  provides=('python2-distorm')
  conflicts=('python2-distorm')
  cd ${pkgbase}-py2
  python2 setup.py install --root="${pkgdir}" -O1 --skip-build
  install -Dm 755 python/distorm3/sample.py "${pkgdir}/usr/bin/disasm"
  install -Dm 644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  mv "${pkgdir}/usr/bin/disasm"{,-py2}
}

# vim: ts=2 sw=2 et:
