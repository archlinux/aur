# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Eric Belanger <eric@archlinux.org>

pkgname=pingus-git
pkgver=0.7.6.r421.gad462706e
pkgrel=1
pkgdesc="A Lemmings clone, i.e. a level-based puzzle game (development version)"
arch=('i686' 'x86_64')
url="http://pingus.seul.org"
license=('GPL')
conflicts=('pingus')
provides=('pingus')
depends=('sdl2_image' 'sdl2_mixer' 'libgl' 'jsoncpp' 'boost-libs' 'libpng')
makedepends=('git' 'cmake' 'boost' 'mesa')
optdepends=("cwiid: to play with your wiimote (requires rebuild)")
source=("git+https://github.com/Pingus/pingus.git"
        "git+https://github.com/logmich/logmich.git"
        "git+https://github.com/tinygettext/tinygettext.git"
        "git+https://github.com/google/googletest"
        "git+https://github.com/Grumbel/uitest.git"
        "git+https://github.com/lispparser/sexp-cpp.git"
        "pingus.desktop")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'c00aef6d6f95449955e1367a5912e211f09dc345bb154084d0f13137e2089dce')

pkgver() {
  cd pingus
  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

prepare() {
  rm -rf build
  mkdir build

  cd pingus
  git submodule init
  git config submodule.external/logmich.url "$srcdir"/logmich
  git config submodule.external/tinygettext.url "$srcdir"/tinygettext
  git config submodule.external/googletest.url "$srcdir"/googletest
  git config submodule.external/uitest.url "$srcdir"/uitest
  git config submodule.external/sexp-cpp.url "$srcdir"/sexp-cpp
  git submodule update
  sed '/find_package(Boost/s@ signals@@' -i CMakeLists.txt || die 
}

build() {
  cd build
  cmake ../pingus -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make install DESTDIR="$pkgdir/"

  # .desktop entry
  install -Dm644 ../pingus.desktop "$pkgdir"/usr/share/applications/pingus.desktop
  install -Dm644 ../pingus/data/images/core/editor/actions.png "$pkgdir"/usr/share/pixmaps/pingus.png
}
