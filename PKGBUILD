# Maintainer: Huki <gk7huki@gmail.com>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Markus Martin <markus@archwyrm.net>

pkgname=lib32-alure
_pkgbasename=alure
pkgver=1.2
pkgrel=5
pkgdesc='Utility library to help manage common tasks with OpenAL applications (32-bit)'
arch=('x86_64')
url='http://kcat.strangesoft.net/alure.html'
license=('MIT')
depends=('lib32-openal' $_pkgbasename)
makedepends=('cmake' 'lib32-libsndfile' 'lib32-libvorbis' 'lib32-flac'
             'lib32-mpg123' 'lib32-fluidsynth')
optdepends=('lib32-libsndfile: for uncompressed audio support'
            'lib32-libvorbis: for OGG Vorbis support'
            'lib32-flac: for FLAC support'
            'lib32-mpg123: for MPEG support'
            'lib32-fluidsynth: for SoundFont 2 support')
source=("http://kcat.strangesoft.net/alure-releases/${_pkgbasename}-${pkgver}.tar.bz2"
        build.patch)
md5sums=('3088aba074ad02d95ea51e705053b9f5'
         '6a8dfd62ccae920d393b4202736aba46')

prepare() {
  cd $_pkgbasename-$pkgver
  patch -p1 -i ../build.patch
}

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  cmake . -DCMAKE_INSTALL_PREFIX=/usr -DLIB_SUFFIX=32 -DDUMB=OFF
  make
}

package() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"

  make DESTDIR="${pkgdir}" install
  rm -rf "$pkgdir"/usr/{share,include,bin}

  mkdir -p "$pkgdir/usr/share/licenses"
  ln -s $_pkgbasename "$pkgdir/usr/share/licenses/$pkgname"
}
