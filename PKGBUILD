# Maintainer: Raffaele Mancuso <raffaelemancuso532 at gmail dot com>
pkgname=pdf4qt-git
pkgver=1.5.1.0.r16.gba80dbd
pkgrel=1
pkgdesc="Open source PDF editor"
arch=('x86_64')
url="https://jakubmelka.github.io/"
license=('LGPL-3.0-only')
depends=('openssl'
  'libjpeg-turbo'
  'qt6-speech'
  'qt6-svg'
  'qt6-base'
  'openjpeg2'
  'onetbb'
  'lcms2'
  'freetype2'
  'zlib'
  'glibc'
  'gcc-libs'
  'blend2d'
  'hicolor-icon-theme'
)
makedepends=('git'
  'cmake'
  'qt6-declarative'
  'qt6-multimedia'
  'qt6-tools'
)
optdepends=(
  'flite: Text-To-Speech using flite synthesizer',
  'libspeechd: Text-To-Speech using speechd synthesizer'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(
  "$pkgname"::'git+https://github.com/JakubMelka/PDF4QT'
  'CMakeListsMain.patch'
  'FindLCMS2.cmake'
  'FixPluginsDir.patch'
)
sha256sums=(
  'SKIP'
  '0df1f6c6ac3c1025a06c509cd61dca8e6ecda932feed339784cff7d64a16fd1f'
  'fb438faf87211cf3c21c6fa624cedd2ec6af49b03827e1ad230e0202e939a8ec'
  '857271d65f06efe437c1312bb92c40f96afc808a368d6ddcda89a0f4216c613e'
)

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --tags --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$pkgname"
  patch -p1 -i "$srcdir/CMakeListsMain.patch"
  patch -p1 -i "$srcdir/FixPluginsDir.patch"
}

build() {
  cmake -B build \
    -S "$pkgname" \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/' \
    -Wno-dev \
    -DCMAKE_MODULE_PATH="$srcdir" \
    -DPDF4QT_INSTALL_DEPENDENCIES=0 \
    -DPDF4QT_LINUX=1
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
