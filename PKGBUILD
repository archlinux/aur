# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: carstene1ns <arch.carsten@teibes.de>

pkgname=lib32-ladspa
pkgver=1.13
pkgrel=6
pkgdesc="Linux Audio Developer's Simple Plugin API"
arch=('x86_64')
url='http://www.ladspa.org/'
license=('LGPL')
depends=('ladspa' 'lib32-gcc-libs' 'lib32-glibc')
makedepends=('gcc-multilib')
source=("https://github.com/OpenMandrivaAssociation/ladspa/raw/master/ladspa_sdk_${pkgver}.tgz"
        'fallback-ladspa-path.patch'
        'fix-memleak-in-plugin-scanning.patch')
sha256sums=('b5ed3f4f253a0f6c1b7a1f4b8cf62376ca9f51d999650dd822650c43852d306b'
            'e1b2dfbb522e9b897048df140e90c972ab383ede849a3b25a472d206eeb5a7c5'
            '27be471df55951fa1cc53089631b167e2654436fc5b3a5773f357cb9f9e29005')

prepare() {
  cd ladspa_sdk/src

  patch -Np2 -i ../../fallback-ladspa-path.patch
  patch -Np1 -i ../../fix-memleak-in-plugin-scanning.patch

  sed -e "s/mkdirhier/mkdir -p/;
          s#-O3#${CFLAGS} ${LDFLAGS/,--as-needed/}#" \
      -i makefile
}

build() {
  cd ladspa_sdk/src


  make \
    CC='gcc -m32' \
    CPP='g++ -m32' \
    LD='ld -m elf_i386' \
    targets
}

package() {
  cd ladspa_sdk/src

  make \
    INSTALL_PLUGINS_DIR="${pkgdir}"/usr/lib32/ladspa/ \
    INSTALL_INCLUDE_DIR="${pkgdir}"/usr/include/ \
    INSTALL_BINARY_DIR="${pkgdir}"/usr/bin/ \
    install
  rm -rf "${pkgdir}"/usr/{bin,include}
}

# vim: ts=2 sw=2 et:
