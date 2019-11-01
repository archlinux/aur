# Maintainer: Dimitris Kiziridis <ragouel@outlook.com>

pkgname=('rednukem-git')
pkgver=r256.19f24f3
pkgrel=1
pkgdesc="Redneck Rampage and Duke Nukem 3D port based on EDuke32."
arch=('i686' 'x86_64')
url="https://github.com/nukeykt/NRedneck/"
license=('GPL' 'custom: BUILD')
depends=('sdl2_mixer' 'libgl' 'libvpx' 'flac' 'gtk2')
makedepends=('mesa' 'glu')
makedepends_i686=('nasm')
optdepends=('')
install=rednukem.install
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir"/NRedneck
  ( 
    set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$srcdir"/NRedneck
  # add cxxflags, set revision
  make PACKAGE_REPOSITORY=1 PRETTY_OUTPUT=0
}

package() {
  cd "$srcdir"/NRedneck
  # install binaries, buildlicense, icon and desktop files
  install -d "$pkgdir"/usr/bin
  install -m755 rednukem "$pkgdir"/usr/bin/
  install -Dm644 package/common/buildlic.txt "$pkgdir"/usr/share/licenses/$pkgname/buildlic.txt
  install -Dm644 ../../rednukem.png "$pkgdir"/usr/share/pixmaps/rednukem.png
  install -Dm644 ../../rednukem.desktop "$pkgdir"/usr/share/applications/rednukem.desktop
}
