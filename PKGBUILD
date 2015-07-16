# Maintainer: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>
# Contributor: speps <speps at aur dot archlinux dot org>
pkgname=glfw2
pkgver=2.7.9
pkgrel=2
pkgdesc="A free, open source, portable framework for OpenGL application development (LEGACY 2.x)"
arch=('i686' 'x86_64')
url="http://www.glfw.org/"
license=('ZLIB')
depends=('libgl' 'libxrandr' 'glu')
makedepends=('mesa')
source=("http://downloads.sourceforge.net/sourceforge/glfw/glfw-${pkgver}.tar.bz2")
sha512sums=('78f36d85734bc6689bd51f6af96f4f1773a57c62e7b1ff7ac9b88f4c3c6915685cb967350c2eaf94179df0db14973d543498aa490d6f9d6a9d4eddd5d1771201')

prepare() {
  cd "${srcdir}/glfw-${pkgver}"
  sed -i 's/glfw\.so/glfw2.so/g' compile.sh lib/x11/Makefile.x11.in
  sed -i 's/lglfw/&2/' compile.sh
}

build() {
  cd "${srcdir}/glfw-${pkgver}"
  export LFLAGS+="-lrt"
  make x11
}

package() {
  cd "${srcdir}/glfw-${pkgver}"
  make PREFIX="${pkgdir}/usr" x11-dist-install

  # Documentation.
  install -d "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 docs/*.pdf "${pkgdir}/usr/share/doc/${pkgname}"

  # License.
  install -Dm644 COPYING.txt \
    "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"

  # Fix .pc file prefix path
  sed -i "s|${pkgdir}||g" "${pkgdir}/usr/lib/pkgconfig/libglfw.pc"
}
