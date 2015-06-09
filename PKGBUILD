# Maintainer: Maxime Gauduin <alucryd@gmail.com>
# Contributor: Nicky726 <nicky726@gmail.com>
# Contributor: Tom Killian <tom@archlinux.org>
# Contributor: Rémy Oudompheng <remyoudompheng@gmail.com>

pkgname=lib32-libtheora
pkgver=1.1.1
pkgrel=10
pkgdesc='An open video codec developed by the Xiph.org'
arch=('x86_64')
url='http://www.xiph.org'
license=('BSD')
depends=('lib32-libogg' 'libtheora')
makedepends=('gcc-multilib' 'lib32-libvorbis')
source=("http://downloads.xiph.org/releases/theora/libtheora-${pkgver}.tar.bz2")
sha256sums=('b6ae1ee2fa3d42ac489287d3ec34c5885730b1296f0801ae577a35193d3affbc')

prepare() {
  cd libtheora-${pkgver}

  sed -i 's|AC_DEFINE(\[OC_X86_64_ASM\]|#AC_DEFINE(\[OC_X86_64_ASM\]|
          s|AM_CONFIG_HEADER|AC_CONFIG_HEADERS|' configure.ac
}

build() {
  cd libtheora-${pkgver}

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./autogen.sh \
    --prefix='/usr' \
    --libdir='/usr/lib32' \
    --with-pic \
    --disable-examples \
    --disable-static
  make
}

package() {
  cd libtheora-${pkgver}

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{include,share}

# License
  install -dm 755 "${pkgdir}"/usr/share/licenses
  ln -s libtheora "${pkgdir}"/usr/share/licenses/lib32-libtheora
}

# vim: ts=2 sw=2 et:
