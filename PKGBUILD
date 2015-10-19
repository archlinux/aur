# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgbase=unicorn-git
pkgname=('unicorn-git')
pkgver=0.9.569.b0a1131
pkgrel=1
pkgdesc='Lightweight, multi-platform, multi-architecture CPU emulator framework based on QEMU'
url='http://www.unicorn-engine.org'
arch=('i686' 'x86_64')
license=('GPL2')
depends=('glib2')
makedepends=('git' 'pkg-config' 'python2')
checkdepends=('cmocka')
source=(${pkgbase}::git+https://github.com/unicorn-engine/unicorn
        fix-soname-ld-library-path.patch)
sha512sums=('SKIP'
            '55e8c4fd1b4e4ccac2d8aefca967ea320c5834f517d0503abc2bd3899cb48531973bd99c07c7a387ab596708a5990f4836cb99ae8ba210c54e499bc8d080fba2')

pkgver() {
  cd ${pkgname}
  printf "%s.%s.%s" "$(git describe --tags --abbrev=0)" \
    "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${pkgbase}
  sed 's|libdir=$(LIBDIR)|libdir=$(PREFIX)/$(LIBDIRARCH)|g' -i Makefile
  sed 's|includedir=$(INCDIR)|includedir=$(PREFIX)/include|g' -i Makefile
  sed 's|-O3|-O2|g' -i Makefile qemu/configure
  sed 's|-g ||g' -i qemu/configure
  sed 's|UNICORN_DEBUG ?= yes|UNICORN_DEBUG ?= no|g' -i config.mk
  patch -Np1 < "${srcdir}/fix-soname-ld-library-path.patch"
}

build() {
  cd ${pkgbase}
  make UNICORN_QEMU_FLAGS="--python=/usr/bin/python2"
}

check() {
  cd ${pkgbase}
  make test
}

package_unicorn-git() {
  provides=('unicorn')
  conflicts=('unicorn')

  cd ${pkgbase}
  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
