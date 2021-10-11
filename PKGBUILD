# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: carstene1ns <arch.carsten@teibes.de>

_name=ladspa
pkgname=lib32-ladspa
pkgver=1.17
pkgrel=1
pkgdesc="Linux Audio Developer's Simple Plugin API"
arch=('x86_64')
url="https://www.ladspa.org/"
license=('LGPL2.1')
depends=("${_name}=${pkgver}" 'lib32-gcc-libs')
makedepends=('gcc-multilib' 'lib32-libsndfile')
source=("https://ladspa.org/download/${_name}_sdk_${pkgver}.tgz"
        'fix-memleak-in-plugin-scanning.patch')
sha512sums=('37f94aa52b5a2f8709528989dea289eb01342f3bcb9e85d0f4829ddd9d90b2934a113db11100f09375a50f6612122b78156fec916f2c78a22406253d5cb394c7'
            'e80a575e6afe42f9d0ac1234a7832a29fb9362c7ab7b2d6b14cc3e6da6a9ba67af886cf09f1c0b78c161205084f705049fb4dc22fe2795efaeb7d94da90dc93e')
b2sums=('cfb80e8ced314d5cc62fcb7f0b82e58f572503f2a732b2bb8a58343e8f69e417c0b0a2919bbb40629567fb331bf60a7f0c6f186db47e5b2651725b039526cdbb'
        'b2235b41d9638cceb93a41452f1f0b710bc3f9264fe735972099244dfc8d98d354c7d15084d79b0bdfc4fa3f437f9368f81aa0ebdb7e39df5900fbbf172927c2')

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
