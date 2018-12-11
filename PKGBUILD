# Maintainer: Andrew Whatson <whatson@gmail.com>

_pkgbase=faudio
_pkgname=lib32-${_pkgbase}
_gitname=FAudio
pkgname=${_pkgname}-git
pkgver=r988.911edc7
pkgrel=1
pkgdesc="Accuracy-focused XAudio reimplementation for open platforms"
arch=('x86_64')
url='https://github.com/FNA-XNA/FAudio'
license=('custom')
provides=("${_pkgname}")
depends=("${_pkgbase}" 'lib32-sdl2' 'lib32-ffmpeg')
makedepends=('git' 'cmake')
source=('git+https://github.com/FNA-XNA/FAudio'
        'faudio.pc'
        'force-lib32-sdl2.patch')
sha256sums=('SKIP'
            '371d1dfdfa335a354f41376807848ba0cc448890d6da60d0b5c9478033b7e54c'
            '18de1716de0c71dfbb17c9f0bc7137592f25fa040b185011221bbce91734983e')

pkgver() {
  cd "$srcdir/${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${_gitname}"

  patch -p1 -i ../force-lib32-sdl2.patch

  mkdir -p build
  cd build

  export CFLAGS="${CFLAGS} -m32"

  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr" \
    -DCMAKE_INSTALL_LIBDIR=lib32 \
    -DCMAKE_INSTALL_INCLUDEDIR=include/FAudio \
    -DFFMPEG=ON \
    -DFFmpeg_LIBRARY_DIRS=/usr/lib32

  make
}

package() {
  cd "$srcdir/${_gitname}/build"

  make install

  rm -r "${pkgdir}/usr/include"

  mkdir -p "${pkgdir}/usr/share/licenses"
  ln -s "${_pkgbase}" "${pkgdir}/usr/share/licenses/${_pkgname}"

  install -D -m644 -t "${pkgdir}/usr/lib32/pkgconfig" ../../faudio.pc
}
