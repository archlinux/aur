# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=libbluray-git
pkgver=1.3.4.0.gbb5bc108
pkgrel=1
pkgdesc='Library to access Blu-Ray disks for video playback. (GIT version)'
arch=('x86_64')
license=('LGPL2.1')
url='https://www.videolan.org/developers/libbluray.html'
depends=(
  'libxml2'
  'fontconfig'
  'freetype2'
  'libudfread'
)
makedepends=(
  'git'
  'apache-ant'
  'java-environment'
)
optdepends=(
  'libaacs: Enable AACS decryption'
  'java-runtime: BD-J library'
)
provides=('libbluray')
conflicts=('libbluray')
source=('git+https://code.videolan.org/videolan/libbluray.git')
sha256sums=('SKIP')

pkgver() {
  cd libbluray
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  mkdir -p build

  sed -e 's|java_version_asm=1.5|java_version_asm=1.8|g' \
      -e 's|java_version_bdj=1.4|java_version_bdj=1.8|g' \
      -i libbluray/Makefile.am
}

build() {
  cd libbluray
  ./bootstrap
  cd "${srcdir}/build"
  ../libbluray/configure \
    --prefix=/usr \
    --disable-static

  make
}

package() {
  depends+=(
    'libxml2.so'
    'libfontconfig.so'
    'libfreetype.so'
    'libudfread.so'
  )

  make -C build DESTDIR="${pkgdir}" install
}
