# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Chocobo1 <chocobo1 AT archlinux DOT net>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Nicky726 <nicky726@gmail.com>
# Contributor: Tom Killian <tom@archlinux.org>
# Contributor: Rémy Oudompheng <remyoudompheng@gmail.com>

pkgname=lib32-libtheora-git
pkgver=1.1.1
pkgrel=12
pkgdesc='An open video codec developed by the Xiph.org'
arch=(x86_64)
url=https://www.xiph.org
license=(BSD)
depends=(
  lib32-libogg
  libtheora
)
makedepends=(
  git
  lib32-libvorbis
)
provides=(lib32-libtheora)
conflicts=(lib32-libtheora)
source=("git+https://gitlab.xiph.org/xiph/theora.git")
sha256sums=(SKIP)

pkgver() {
  cd theora
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd theora

  sed 's/AC_DEFINE(\[OC_X86_64_ASM\]/#AC_DEFINE(\[OC_X86_64_ASM\]/
       s/AM_CONFIG_HEADER/AC_CONFIG_HEADERS/' -i configure.ac
}

build() {
  cd theora

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./autogen.sh \
  ./configure \
    --prefix='/usr' \
    --libdir='/usr/lib32' \
    --disable-examples \
    --disable-static
  make
}

package() {
  cd theora

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{include,share}

  install -dm 755 "${pkgdir}"/usr/share/licenses
  ln -s libtheora "${pkgdir}"/usr/share/licenses/lib32-libtheora
}

# vim: ts=2 sw=2 et:
