# Maintainer: Antonio Leal <antonioleal@yahoo.com>
pkgname=canace
pkgver=20130224_c135151
_tarball=c13515135345daf50bc8f6e4c3ddc4d6bcd01443
pkgrel=1
license=('GPL-2.0-or-later')
depends=('tcl' 'tk' 'sdl12-compat' 'glibc')
pkgdesc='A Jupiter Ace emulator for Linux'
arch=("x86_64")
url='https://github.com/LawrenceWoodman/CanAce'
source=("https://github.com/LawrenceWoodman/CanAce/archive/c13515135345daf50bc8f6e4c3ddc4d6bcd01443/CanAce-${_tarball}.tar.gz"
  "https://github.com/lawrencewoodman/xdgbasedir_tcl/archive/v0.3/xdgbasedir_tcl-0.3.tar.gz" )
sha256sums=('ad665d5698841f0bfbe316cba76e5f76e238d245e7ec13bf06f756005297c7e0'
  '1e8c80bcece4a24862893c4da3f365b8f8d60b11366477fbea28cb3925535178')
options=(!debug)

prepare() {
  mv CanAce-${_tarball} ${pkgname}-${pkgver}
  cd ${pkgname}-${pkgver}
  patch src/CMakeLists.txt ../../srcCMakeLists.txt.patch
  patch src/canace.tcl ../../canace.tcl.patch
  patch src/tkwin.c ../../tkwin.c.patch
  patch -R src/z80.h ../../z80.h.patch
}

build() {
  cd ${pkgname}-${pkgver}
  LDFLAGS="-z itb -z shstk -Wl,-z,now" cmake . \
          -DCMAKE_C_FLAGS="-O2 -fPIC -Wno-implicit-function-declaration -Wno-implicit-int -Wno-dev" \
          -DCMAKE_CXX_FLAGS_RELEASE="-O2 -fPIC -Wno-implicit-function-declaration -Wno-implicit-int -Wno-dev" \
          -DCMAKE_BUILD_TYPE=Release \
          -DCMAKE_MODULE_LINKER_FLAGS_RELEASE="-pthread" \
          -DCMAKE_POLICY_VERSION_MINIMUM=3.5
  make
}

package() {
  cd ${pkgname}-${pkgver}
  XDGPATH=`echo "foreach dir [split [::tcl::tm::path list]] {puts \\$dir}" | tclsh | tail -n1`
  mkdir -p ${pkgdir}/usr/bin
  install -D -m0755 src/canace ${pkgdir}/usr/bin/canace
  mkdir -p ${pkgdir}/usr/share/canace
  cp ace.rom ${pkgdir}/usr/share/canace
  mkdir -p ${pkgdir}${XDGPATH}
  mv ${srcdir}/xdgbasedir_tcl-0.3/xdgbasedir-0.3.tm ${pkgdir}${XDGPATH}
  mkdir -p ${pkgdir}/usr/share/pixmaps
  cp ../../CanAce.png ${pkgdir}/usr/share/pixmaps/CanAce.png
  mkdir -p ${pkgdir}/usr/share/applications
  cp ../../CanAce.desktop ${pkgdir}/usr/share/applications
  mkdir -p ${pkgdir}/usr/share/doc/${pkgname}-${pkgver}
  cp -a \
    COPYING CHANGELOG.md README.md boldcomp.email.txt \
    ${pkgdir}/usr/share/doc/${pkgname}-${pkgver}
}
