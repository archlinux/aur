# Maintainer: Chuan Ji <chuan@jichu4n.com>

pkgname=jfbview-git
pkgver=r327.25a9e8b
pkgrel=1
pkgdesc="PDF and image viewer for the Linux framebuffer"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/jichu4n/jfbview"
license=('Apache')
makedepends=('cmake' 'mesa' 'glu' 'libxi' 'libxrandr')
depends=('ncurses' 'imlib2')
conflicts=('jfbpdf' 'jfbview')
replaces=('jfbpdf' 'jfbview')
source=(
  "git+${url}.git"
  'mupdf-1.16.1-freeglut-fg_gl2-gcc-10.patch'
)
sha512sums=(
  'SKIP'
  '069c8150402fc463def14ff5690ecfe8a376579ad8319bf79f90823a04799bef1bfa25e79b759a0e027595a114bd3cf48f613541eeb2eec2c85e31d2105062f6'
)
_pkgname='jfbview'

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  git submodule update --init --recursive
  patch -d vendor/mupdf --forward --strip=1 --input="${srcdir}/mupdf-1.16.1-freeglut-fg_gl2-gcc-10.patch"
}

build(){
  cd "${srcdir}/${_pkgname}"
  cmake -H. -Bbuild \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package(){
  cd "${srcdir}/${_pkgname}/build"
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
