# Maintainer: Xiao Xiong <xiongxiao126 {at} gmail {dot} com>
pkgname=astrorama-sourcextractor++
_pkgname=SourceXtractorPlusPlus
pkgver=1.0.3
pkgrel=3
pkgdesc="The next generation SExtractor"
url="https://github.com/astrorama/SourceXtractorPlusPlus"
arch=('x86_64')
license=('LGPL-3.0-only')
depends=(
  'astrorama-alexandria=2.32.0'
  astrorama-elements
  boost-libs
  ccfits
  fftw
  gcc-libs
  gsl
  levmar
  log4cpp
  ncurses
  onnxruntime
  python
  python-astropy
  readline
  wcslib
)
makedepends=(boost cmake)
checkdepends=(gtest)
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/astrorama/SourceXtractorPlusPlus/archive/$pkgver.tar.gz"
  0001-fix_build.patch
  0002-remove_TestImage.patch
)
sha256sums=(
  '29741e3e0034a70c0ba1b698113a89faef28a22f0a18910c4845e87ebbfb58cb'
  'e4531d623147ad42e9d1bfb084edb6a2a984b87fa5717bd67d0ae64f5a573dfd'
  'cee2bfc897aad09f4c18ed6baca21515ca01da569431e333c01887304ddd63b0'
)

prepare() {
  cd $_pkgname-$pkgver

  patch -Np1 -i ../0001-fix_build.patch
  # Adapted from Fedora packaging by Alejandro Álvarez Ayllón.
  patch -Np1 -i ../0002-remove_TestImage.patch
  rm -r SEBenchmarks
}

build() {
  cd "$_pkgname-$pkgver"

  export CMAKE_PROJECT_PATH=/opt/astrorama/lib/cmake/ElementsProject
  export CMAKE_PREFIX_PATH=$CMAKE_PROJECT_PATH

  cmake -B build -DCMAKE_INSTALL_PREFIX=/opt/astrorama -DPYTHON_EXPLICIT_VERSION=3 -DUSE_SPHINX=OFF -Wno-dev
  make -C build
}

check() {
  cd "$_pkgname-$pkgver"

  make -C build test
}

package() {
  cd "$_pkgname-$pkgver"

  make -C build DESTDIR="$pkgdir" install
  mkdir -p "$pkgdir/usr/bin"
  ln -sf /opt/astrorama/bin/sourcextractor++ "$pkgdir/usr/bin/sourcextractor++"
}
