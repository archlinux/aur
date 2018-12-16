# Maintainer: Fredy García <frealgagu at gmail dot com>
# Contributor: schuay <jakob.gruber@gmail.com>
# Contributor: quantax -- contact via Arch Linux forum or AUR
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>

pkgname=pcsxr
pkgver=1.9.95
pkgrel=1
pkgdesc="A Sony PlayStation (PSX) emulator based on the PCSX-df project"
arch=("i686" "x86_64")
url="http://${pkgname}.codeplex.com"
license=("GPL")
depends=("gtk3" "libarchive" "libcdio" "libnsl" "libxv" "sdl2")
makedepends=("cmake" "intltool" "mesa" "nasm" "valgrind")
conflicts=("pcsx-df")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/frealgagu/PCSX-Reloaded/archive/${pkgver}.tar.gz"
        "${pkgname}-desktop.patch"
        "${pkgname}-fix-undefined-operations.patch"
        "${pkgname}-remove-assertion-64bit.patch"
        "${pkgname}-fix-uncompress2.patch")
sha256sums=("1a132bf4d1875cd2ab90b335620659caa1af2056e7c3d622fb438a0fa90d948d"
            "d433fe75fcb50bc2552838c420637b6ea8a86cb574d8bebe5c18a668cb5f93f4"
            "dab73981e9931b71e04c7fb5119008b6e4d8f14849f2b0db9519644ab4688ed5"
            "8dd49ca7ad7bce8534a14d28bbb3c70b10a8695797519a18ab79de15bf015be1"
            "c4c08c7ff55045ac0fb00179e92ada201eef024db0f144970fc21544de877cf9")

prepare() {
  cd "${srcdir}/PCSX-Reloaded-${pkgver}"
  
  patch -Np1 -i "${srcdir}/${pkgname}-desktop.patch"
  patch -Np1 -i "${srcdir}/${pkgname}-fix-undefined-operations.patch"
  patch -Np1 -i "${srcdir}/${pkgname}-remove-assertion-64bit.patch"
  patch -Np1 -i "${srcdir}/${pkgname}-fix-uncompress2.patch"
  mkdir "${srcdir}/PCSX-Reloaded-${pkgver}/${pkgname}/include"
}

build() {
  cd "${srcdir}/PCSX-Reloaded-${pkgver}/${pkgname}"

  autoreconf -f -i
  intltoolize --force

  ./configure \
    --prefix=/usr \
    --enable-libcdio \
    --enable-opengl
  make
}

package() {
  cd "${srcdir}/PCSX-Reloaded-${pkgver}/${pkgname}"
  make DESTDIR="${pkgdir}" install
}
