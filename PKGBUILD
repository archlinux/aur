# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgbase=unicorn
pkgname=('unicorn')
pkgver=0.9
pkgrel=2
pkgdesc='Lightweight, multi-platform, multi-architecture CPU emulator framework based on QEMU'
url='http://www.unicorn-engine.org'
arch=('i686' 'x86_64')
license=('GPL2')
depends=('glib2')
makedepends=('pkg-config' 'python2')
checkdepends=('cmocka')
source=(${pkgbase}-${pkgver}.tar.gz::https://github.com/unicorn-engine/${pkgbase}/archive/${pkgver}.tar.gz)
sha512sums=('c69bb03b7ba4ebec9aef23b80d1ffe33a30de958a74136ef5933b5fa10a2b2ffddd716fdb1881b78dfdcc5a53fece15c368c661b12d20f80dbf955a66930eb0b')

prepare() {
  cd ${pkgbase}-${pkgver}
  sed 's|libdir=$(LIBDIR)|libdir=$(PREFIX)/$(LIBDIRARCH)|g' -i Makefile
  sed 's|includedir=$(INCDIR)|includedir=$(PREFIX)/include|g' -i Makefile
  sed 's|ifeq ($(UNICORN_DEBUG),yes)|ifneq ($(UNICORN_DEBUG),yes)|g' -i Makefile
  sed 's|-O3|-O2|g' -i Makefile qemu/configure
  sed 's|-g ||g' -i qemu/configure
  sed 's|UNICORN_DEBUG ?= yes|UNICORN_DEBUG ?= no|g' -i config.mk
}

build() {
  cd ${pkgbase}-${pkgver}
  make UNICORN_QEMU_FLAGS="--python=/usr/bin/python2"
}

check() {
  cd ${pkgbase}-${pkgver}
  make test
}

package_unicorn() {
  cd ${pkgbase}-${pkgver}
  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
