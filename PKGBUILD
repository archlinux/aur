# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Jesse Jaara <gmail.com: jesse.jaara>

pkgname=libass-git
pkgver=0.17.0.75.g649a7c2
pkgrel=1
pkgdesc="A portable library for SSA/ASS subtitles rendering. (GIT version)"
arch=('x86_64')
url='https://github.com/libass/libass'
license=('custom::ISC')
depends=(
  'glibc' # libc.so libm.so
  'fontconfig' 'libfontconfig.so'
  'freetype2' 'libfreetype.so'
  'fribidi' 'libfribidi.so'
  'harfbuzz' 'libharfbuzz.so'
  'libunibreak' # libunibreak.so
)
makedepends=(
  'git'
  'nasm'
)
provides=(
  'libass'
  'libass.so'
)
conflicts=('libass')
source=('git+https://github.com/libass/libass.git')
sha256sums=('SKIP')

pkgver() {
  cd libass
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  mkdir -p build
}

build() {
  cd libass
  autoreconf -vfi

  cd "${srcdir}/build"
  ../libass/configure \
    --prefix=/usr

  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
  install -Dm644 libass/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
