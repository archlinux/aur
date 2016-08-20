# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgbase=unicorn
pkgname=('unicorn' 'python-unicorn' 'python2-unicorn')
pkgver=0.9
pkgrel=4
pkgdesc='Lightweight, multi-platform, multi-architecture CPU emulator framework based on QEMU'
url='http://www.unicorn-engine.org'
arch=('i686' 'x86_64')
license=('GPL2')
makedepends=('pkg-config' 'glib2' 'python' 'python2')
checkdepends=('cmocka')
options=('staticlibs' '!emptydirs')
source=(${pkgbase}-${pkgver}.tar.gz::https://github.com/unicorn-engine/unicorn/archive/${pkgver}.tar.gz)
sha512sums=('c69bb03b7ba4ebec9aef23b80d1ffe33a30de958a74136ef5933b5fa10a2b2ffddd716fdb1881b78dfdcc5a53fece15c368c661b12d20f80dbf955a66930eb0b')

prepare() {
  cd ${pkgbase}-${pkgver}
  sed 's|libdir=$(LIBDIR)|libdir=$(PREFIX)/$(LIBDIRARCH)|g' -i Makefile
  sed 's|includedir=$(INCDIR)|includedir=$(PREFIX)/include|g' -i Makefile
  sed 's|ifeq ($(UNICORN_DEBUG),yes)|ifneq ($(UNICORN_DEBUG),yes)|g' -i Makefile
  sed 's|-O3|-O2|g' -i Makefile qemu/configure
  sed 's|-g ||g' -i qemu/configure
  sed 's|UNICORN_DEBUG ?= yes|UNICORN_DEBUG ?= no|g' -i config.mk
  cp -ra bindings/python{,2}
  sed -r 's|(python)$|\12|' -i bindings/python2/*.py
}

build() {
  cd ${pkgbase}-${pkgver}
  make UNICORN_QEMU_FLAGS="--python=/usr/bin/python2"
  (cd bindings/python
    python setup.py build
  )
  (cd bindings/python2
    python2 setup.py build
  )
}

check() {
  cd ${pkgbase}-${pkgver}
  make test
}

package_unicorn() {
  depends=('glib2')
  cd ${pkgbase}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -Dm 644 samples/*.c -t "${pkgdir}/usr/share/doc/${pkgname}/samples"
}

package_python-unicorn() {
  depends=('python' 'unicorn')
  cd ${pkgbase}-${pkgver}/bindings/python
  python setup.py install --root="${pkgdir}" -O1 --skip-build
  install -Dm 644 sample* shellcode.py -t "${pkgdir}/usr/share/doc/${pkgname}/samples"
}

package_python2-unicorn() {
  depends=('python2' 'unicorn')
  cd ${pkgbase}-${pkgver}/bindings/python2
  python2 setup.py install --root="${pkgdir}" -O1 --skip-build
  install -Dm 644 sample* shellcode.py -t "${pkgdir}/usr/share/doc/${pkgname}/samples"
}

# vim: ts=2 sw=2 et:
