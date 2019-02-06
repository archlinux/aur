# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: carstene1ns <arch.carsten@teibes.de>
# Contributor: David Runge <dave@sleepmap.de>

_name=ladspa
pkgname=lib32-ladspa
pkgver=1.15
pkgrel=1
pkgdesc="Linux Audio Developer's Simple Plugin API"
arch=('x86_64')
url="https://www.ladspa.org/"
license=('LGPL')
depends=('ladspa' 'lib32-gcc-libs')
makedepends=('gcc-multilib')
source=("https://ladspa.org/download/${_name}_sdk_${pkgver}.tgz"
        'fix-memleak-in-plugin-scanning.patch')
sha256sums=('4229959b09d20c88c8c86f4aa76427843011705df22d9c28b38359fd1829fded'
            '27be471df55951fa1cc53089631b167e2654436fc5b3a5773f357cb9f9e29005')

prepare() {
  mv -v ${_name}_sdk_${pkgver} ${pkgname}-${pkgver}
  cd "${pkgname}-${pkgver}"
  patch -Np0 -i "../fix-memleak-in-plugin-scanning.patch"
  # add LDFLAGS for full RELRO
  sed -e "s#-O2#${CFLAGS} ${LDFLAGS}#" -i src/Makefile
}

build() {
  cd "${pkgname}-${pkgver}/src"
  make \
    CC='gcc -m32' \
    CPP='g++ -m32' \
    LD='ld -m elf_i386' \
    targets
}

package() {
  cd "${pkgname}-${pkgver}/src"
  make INSTALL_PLUGINS_DIR="${pkgdir}/usr/lib32/ladspa/" \
       INSTALL_INCLUDE_DIR="${pkgdir}/usr/include/" \
       INSTALL_BINARY_DIR="${pkgdir}/usr/bin/" install
  rm -rf "${pkgdir}"/usr/{bin,include}
}

# vim: ts=2 sw=2 et:
