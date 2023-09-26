pkgname=vpinball
pkgver=10.7.3
pkgrel=1
pkgdesc="An open source pinball table editor and simulator"
arch=('i686' 'x86_64')
url="https://github.com/vpinball/vpinball"
license=('GPL3' 'MAME')
depends=()
makedepends=('cmake' 'freeimage')
provides=('vpinball')
source=("${pkgname}::git+https://github.com/vpinball/vpinball.git#branch=standalone"
	"vpinball.desktop"
	"visualpinball_screen1.jpg")
sha256sums=('SKIP'
            '790026203a8475c3b580e636e83ef08b1245df7f97d7760db600db59c4a23af2'
            'ca5d4a89d1a137eba199ebd91463d3df7fe90fd47ff41c73d6f456d879ab5011')

build() {
  cd ${srcdir}/vpinball/standalone/linux
  ./external.sh

  cd ${srcdir}/vpinball
  [[ -d build ]] && rm -rf build
  cp standalone/cmake/CMakeLists_gl-linux-x64.txt CMakeLists.txt
  cmake -DCMAKE_BUILD_TYPE=Release -B build
  cmake --build build
}

package () {
  cd "${srcdir}/vpinball"
  DESTDIR="$pkgdir" cmake --install build
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/applications"
  mkdir -p "$pkgdir/usr/share/pixmaps"

  ln -s "${pkgdir}/usr/bin/VPinballX_GL" 			"${pkgdir}/usr/bin/VPinballX_GL"
  install -Dm644 "${srcdir}/vpinball.desktop"			"${pkgdir}/usr/share/applications/vpinball.desktop"
  install -Dm644 "${srcdir}/visualpinball_screen1.jpg"		"${pkgdir}/usr/share/pixmaps/visualpinball_screen1.jpg"
}
