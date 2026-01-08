# Maintainer: Darvin Delgado <dnmodder at gmail dot com>

pkgname=rom-properties-git
pkgver=2.7.r86.g562c9be
pkgrel=1
pkgdesc='This shell extension adds a few nice features to file browsers for managing video game ROM and disc images.'
arch=('x86_64')
url='https://github.com/GerbilSoft/rom-properties'
license=('GPL-2.0-or-later')
depends=('fmt' 'gcc-libs' 'glibc' 'libjpeg-turbo' 'libseccomp' 'nettle' 'pugixml' 'zlib')
optdepends=('zstd' 'lz4' 'lzo')
makedepends=('cmake' 'gettext' 'git' 'glib2-devel' 'lz4' 'lzo' 'pkgconf' 'zstd')
replaces=('rom-properties')
conflicts=('rom-properties')
source=(
  "git+https://github.com/GerbilSoft/rom-properties.git"
  "rom-properties-git.install"
)
sha256sums=(
  'SKIP'
  '07ad7da027ed9c4d82166fb5663b5fbbc5298a11423cbaec90ef76f425296b1b')
install=rom-properties-git.install

pkgver() {
  cd "${pkgname%%-git}"
  git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%%-git}"
  sed -i '1i include(CheckLibraryExists)' extlib/libpng/CMakeLists.txt
}

build() {
  mkdir -p build && cd build

  cmake "../${pkgname%%-git}" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_FLAGS="-Wno-stringop-overread -Wno-error=format-security" \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBEXECDIR="lib/rom-properties" \
    -DENABLE_LTO=ON \
    -DSPLIT_DEBUG=OFF \
    -DUSE_INTERNAL_PNG=ON

  make
}

package() {
  cd "$srcdir/build"

  make DESTDIR="$pkgdir" install
}
