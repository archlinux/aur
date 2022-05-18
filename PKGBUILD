# Maintainer: Huki <gk7huki@gmail.com>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Markus Martin <markus@archwyrm.net>

pkgname=lib32-alure
_pkgbasename=alure
pkgver=1.2
pkgrel=8
pkgdesc='Utility library to help manage common tasks with OpenAL applications (32-bit)'
arch=('x86_64')
url='https://kcat.tomasu.net/alure.html'
license=('MIT')
depends=('lib32-openal' $_pkgbasename)
makedepends=('cmake' 'lib32-libsndfile' 'lib32-libvorbis' 'lib32-flac'
             'lib32-mpg123' 'lib32-dumb' 'lib32-fluidsynth')
optdepends=('lib32-libsndfile: for uncompressed audio support'
            'lib32-libvorbis: for OGG Vorbis support'
            'lib32-flac: for FLAC support'
            'lib32-mpg123: for MPEG support'
            'lib32-dumb: for IT, XM, S3M and MOD support'
            'lib32-fluidsynth: for SoundFont 2 support')
source=("https://kcat.tomasu.net/alure-releases/${_pkgbasename}-${pkgver}.tar.bz2"
        build.patch
        dumb-2.patch)
md5sums=('3088aba074ad02d95ea51e705053b9f5'
         '6a8dfd62ccae920d393b4202736aba46'
         'f6569e1fee4015a9e0a68df37798c8aa')

prepare() {
  cd ${_pkgbasename}-${pkgver}
  patch -p1 -i ../build.patch
  patch -p1 -i ../dumb-2.patch # Fix build with dumb 2 (Gentoo)
}

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd ${_pkgbasename}-${pkgver}

  # Workaround for recent gcc build issue
  CXXFLAGS="$CXXFLAGS -ffat-lto-objects"

  cmake . -DCMAKE_INSTALL_PREFIX=/usr -DLIB_SUFFIX=32 -DDUMB=OFF
  # Fix build with fluidsynth 2.4
  find -name build.make | xargs sed -e 's|\;| |g' -i
  make
}

package() {
  cd ${_pkgbasename}-${pkgver}

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{share,include,bin}

  mkdir -p "$pkgdir/usr/share/licenses"
  ln -s $_pkgbasename "$pkgdir/usr/share/licenses/$pkgname"
}
