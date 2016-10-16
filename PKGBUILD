# Maintainer: Doug Newgard <scimmia at archlinux dot info>
# Contributor: twa022 <twa022 at gmail dot com>

pkgname=ewebkit
pkgver=1.18
pkgrel=1
pkgdesc="WebKit ported to the Enlightenment Foundation Libraries"
arch=('i686' 'x86_64')
url="http://ewebkit.org/"
license=('custom')
depends=('atk' 'efl' 'enchant' 'harfbuzz-icu' 'hyphen' 'libsoup' 'libxslt')
makedepends=('cmake' 'gperf' 'python' 'ruby')
source=("https://download.enlightenment.org/rel/libs/webkit-efl/$pkgname-$pkgver.tar.xz"
        "fix-missing-header.patch")
sha256sums=('02088758f67fb8e7031bd16e6d871bb4225e62e6de37a2ab408346ab0c45fd72'
            '7507216f5a21325602bbb950247f99fb2755a02ceb4bca0ab3a8ebb24403793a')

prepare() {
  mkdir build
  cd $pkgname

  # Fix missing header
  patch -Np1 -i ../fix-missing-header.patch

  # Turn off -Werror, causes too many build failures for things we don't care about
  sed -i '/-Werror/d' Source/cmake/WebKitHelpers.cmake
}

build() {
  cd build
  export LDFLAGS="$LDFLAGS -lpthread"
  cmake ../$pkgname \
    -DPORT=Efl \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_SKIP_RPATH=ON \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=/usr/lib \
    -DLIBEXEC_INSTALL_DIR=/usr/lib/$pkgname \
    -DENABLE_GEOLOCATION=OFF \
    -DENABLE_SPEECH_SYNTHESIS=OFF
  make -j8
}

package() {
  cd build
  make DESTDIR="$pkgdir" install

  install -m755 -d "$pkgdir/usr/share/licenses/$pkgname"
  cd "$srcdir/$pkgname/Source"
  for f in $(find -name 'COPYING*' -or -name 'LICENSE*'); do
    echo $f >> "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    cat $f >> "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    echo "" >> "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  done
}
