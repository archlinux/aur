# Maintainer: Michael Straube <michael.straube@posteo.de>
# Contributor: Sebastian Wolf <fatmike303 at googlemail dot com>

pkgname=chipmachine
pkgver=1.4b3
pkgrel=4
pkgdesc='Demoscene/Retro Music Player'
arch=('x86_64')
url='https://github.com/sasq64/chipmachine'
license=('MIT')
depends=('mpg123' 'glew' 'glfw' 'curl' 'fftw')
makedepends=('cmake' 'vim' 'gendesk')
source=("chipmachine-v1.4b3.tar.gz::https://github.com/sasq64/chipmachine/archive/v1.4b3.tar.gz"
        "apone-chipmachine-v1.4b3.tar.gz::https://github.com/sasq64/apone/archive/chipmachine-v1.4b3.tar.gz"
        "apone-chipmachine-v1.4b3-datadir.patch")
sha256sums=('b01f123e157d72eee4f4d3784f82b1ab0cc5b4d968067b0af50163321d3f5cb4'
            'e411d6515064bb2c952a95aad6bcfc70c1f6b58f40d7874f671ef26185911156'
            'd31e25b31467e02fa0ef636217dad64db4ad1f58420ac51ce8ad98bbdeda7da2')

prepare() {
  cd $pkgname-$pkgver
  gendesk -f -n --pkgname="$pkgname" --pkgdesc="$pkgdesc" --categories="AudioVideo"
  mv ../apone-chipmachine-v1.4b3 apone
  patch -p0 -i ../apone-chipmachine-v1.4b3-datadir.patch
  sed -i '/link_directories(\/usr\/local\/lib)/d' CMakeLists.txt  # remove insecure rpath
  mkdir -p ../build
}

build() {
  cd build
  cmake ../$pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 ../build/chipmachine "$pkgdir"/usr/bin/chipmachine
#  install -Dm755 ../build/cm "$pkgdir"/usr/bin/cm
  install -d "$pkgdir"/usr/share/chipmachine
  cp -r data lua "$pkgdir"/usr/share/chipmachine/
  install -Dm644 chipmachine.desktop "$pkgdir"/usr/share/applications/chipmachine.desktop
  install -Dm644 note.png "$pkgdir"/usr/share/pixmaps/chipmachine.png
  install -Dm644 apone/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
