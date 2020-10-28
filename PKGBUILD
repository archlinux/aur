pkgname=ecwolf-unofficial-git
_pkgname=ecwolf
pkgver=1.3.3.r365.g0fc332d
pkgrel=1
pkgdesc='Advanced source port of "Wolfenstein 3D" (development version with fixed sound and installation)'
arch=('i686' 'x86_64')
url="http://maniacsvault.net/ecwolf"
license=('GPL' 'custom: ID')
provides=('ecwolf')
conflicts=('ecwolf-git')
depends=('libvorbis' 'flac' 'opusfile' 'libmodplug' 'fluidsynth' 'libjpeg' 'sdl2' 'sdl2_net')
makedepends=('git' 'cmake' 'sdl' 'sdl2')
source=("git+https://bitbucket.org/ecwolf/ecwolf")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  echo "Building ecwolf..."
  export LDFLAGS="-lvorbisfile -lopusfile -lFLAC  -lmodplug -lfluidsynth $LDFLAGS"
  cmake -B build ecwolf -DGPL=ON
  make -C build
}

package() {
  cd build
  # binaries
  mkdir -p $pkgdir/usr/bin
  ln -s /usr/share/ecwolf/ecwolf "$pkgdir"/usr/bin/ecwolf
  install -Dm755 ecwolf "$pkgdir"/usr/share/ecwolf/ecwolf
  # data
  install -Dm644 ecwolf.pk3 "$pkgdir"/usr/share/ecwolf/ecwolf.pk3
  cd ../ecwolf
  # doc
  install -d "$pkgdir"/usr/share/doc/$pkgname
  install -Dm644 README.* "$pkgdir"/usr/share/doc/$pkgname
  # license
  install -Dm644 docs/license-id.txt "$pkgdir"/usr/share/licenses/$pkgname/license-id.txt
}
