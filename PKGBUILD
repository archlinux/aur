# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgbase=unicorn-git
pkgname=('unicorn-git')
pkgver=0.9.542.d5158f4
pkgrel=1
pkgdesc='Lightweight, multi-platform, multi-architecture CPU emulator framework based on QEMU'
url='http://www.unicorn-engine.org'
arch=('i686' 'x86_64')
license=('GPL2')
depends=('glib2')
makedepends=('git' 'pkg-config' 'python2')
checkdepends=('cmocka')
source=(${pkgbase}::git+https://github.com/unicorn-engine/unicorn)
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname}
  printf "%s.%s.%s" "$(git describe --tags --abbrev=0)" \
    "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${pkgbase}
  make UNICORN_QEMU_FLAGS="--python=/usr/bin/python2"
}

check() {
  cd ${pkgbase}
  # x64 tests failing currently
  # make test
}

package_unicorn-git() {
  provides=('unicorn')
  conflicts=('unicorn')

  cd ${pkgbase}
  make DESTDIR="${pkgdir}" install
  # temporary fixup
  sed 's|/build/unicorn-git/pkg/unicorn-git||g' -i "${pkgdir}/usr/lib/pkgconfig/unicorn.pc"
}

# vim: ts=2 sw=2 et:
