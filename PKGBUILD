# Maintainer: D. Can Celasun <can[at]dcc[dot]im>

pkgname=ponscripter-sekaiproject
_pkgname=ponscripter
pkgver=v3.0.0
pkgrel=4
pkgdesc="Sekai Project Fork (07th-Mod) of the Ponscripter visual novel engine to take advantage of SDL2 and improve Steam integration"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/07th-mod/ponscripter-fork"
license=('GPL')
depends=('sdl2_mixer' 'sdl2_image' 'freetype2' 'gcc-libs' 'smpeg2')
makedepends=('libmodplug')
source=("${_pkgname}::git+https://github.com/07th-mod/ponscripter-fork.git#tag=${pkgver}")
md5sums=('SKIP')
provides=('ponscripter')
conflicts=('ponscripter')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --tags
}

build() {
  cd "${srcdir}/${_pkgname}/"

  # Doesn't work without this
  cp /usr/include/libmodplug/modplug.h src/extlib/src/SDL2_mixer-2.0.0

  sed -i "36i\#include <unistd.h>" ./src/AnimationInfo.h
  ./configure --prefix=/usr --no-werror \
    --disable-internal-libs \
    --disable-internal-sdl \
    --disable-internal-sdlimage \
    --with-external-sdl-mixer \
    --disable-internal-bz \
    --disable-internal-smpeg
  make
}

package() {
  install -D -m755 "${srcdir}/${_pkgname}/src/ponscr" "${pkgdir}/usr/bin/${_pkgname}"

  install -dm755 "${pkgdir}/usr/share/doc/${pkgname}"
  cd "${srcdir}/${_pkgname}"
  install -m644 BUGS CHANGES INSTALL.md MANUAL README.md TODO "${pkgdir}/usr/share/doc/${pkgname}"
}
