# Maintainer: Blair Bonnett <blair.bonnett@gmail.com>

pkgname=displaz-git
pkgdesc='A hackable LIDAR viewer (Git version)'
pkgver=0.4.0.r140.g9d0d77e
pkgrel=1
url='http://c42f.github.io/displaz/'
license=('BSD-3-Clause')
arch=('x86_64')

depends=(
  'glew'
  'libLASlib.so'
  'libglvnd'
  'qt5-base'
)
makedepends=(
 'cmake'
 'git'
 'imath'
)

source=(
  'git+https://github.com/c42f/displaz.git'
  'fix_readme_filename.patch'
)
sha256sums=(
  'SKIP'
  '69a96e6a3361ba110ce6b8b4915bd203f1a152395f56d1bbcdf2de403aef9c9b'
)

pkgver() {
  cd displaz
  git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd displaz
  patch -p0 -i "$srcdir/fix_readme_filename.patch"
}

build() {
  cmake -B build -S displaz \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
		-DLASLIB_INCLUDE_DIRS=/usr/include/LASlib \
        -DDISPLAZ_EMBED_GLEW=False \
        -Wno-dev
  cmake --build build
}

check() {
    ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  cd displaz
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
}
