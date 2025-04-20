# Maintainer: Antonio Leal <antonioleal@yahoo.com>
pkgname=xace
_pkgname=xAce
pkgver=0.5
pkgrel=1
license=('GPL-2.0-or-later')
depends=('glibc' 'bash' 'libx11' 'libxext' )
pkgdesc='A Jupiter Ace emulator for Linux'
arch=("x86_64")
url='https://lawrencewoodman.github.io/xAce/'
source=("https://github.com/LawrenceWoodman/xAce/archive/v${pkgver}/xAce-${pkgver}.tar.gz")
sha256sums=('88cd59ce646d8bd2ef3be156bb013896558e90877442fc9cdca837ffdf5fbd40')
options=(!debug)

prepare() {
  mv ${_pkgname}-${pkgver} ${pkgname}-${pkgver}
  cd ${pkgname}-${pkgver}
  patch CMakeLists.txt ../../CMakeLists.txt.patch
  patch src/CMakeLists.txt ../../srcCMakeLists.txt.patch
  patch src/tape.c ../../tape.c.patch
  patch src/xmain.c ../../xmain.c.patch
}

build() {
  cd ${pkgname}-${pkgver}
  LDFLAGS="-z itb -z shstk -Wl,-z,now" cmake . \
    -DCMAKE_C_FLAGS="-O2 -fPIC -Wno-implicit-function-declaration -Wno-implicit-int -Wno-dev -w" \
    -DCMAKE_CXX_FLAGS_RELEASE="-O2 -fPIC -Wno-implicit-function-declaration -Wno-implicit-int -Wno-dev -w" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_MODULE_LINKER_FLAGS_RELEASE="-pthread" \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5
  make
}

package() {
  cd ${pkgname}-${pkgver}
  mkdir -p ${pkgdir}/usr/bin
  install -D -m0755 ../../xace-launcher ${pkgdir}/usr/bin/xace-launcher

  mkdir -p ${pkgdir}/usr/lib/xace
  cp ace.rom ${pkgdir}/usr/lib/xace
  install -D -m0755 src/xace ${pkgdir}/usr/lib/xace/xace

  mkdir -p ${pkgdir}/usr/share/pixmaps
  cp ../../xAce.png ${pkgdir}/usr/share/pixmaps/xAce.png
  mkdir -p ${pkgdir}/usr/share/applications
  cp ../../xAce.desktop ${pkgdir}/usr/share/applications
  mkdir -p ${pkgdir}/usr/share/doc/${pkgname}-${pkgver}
  cp -a \
    COPYING CHANGELOG.md README boldcomp.email.txt \
    ${pkgdir}/usr/share/doc/${pkgname}-${pkgver}
}
