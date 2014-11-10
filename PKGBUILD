# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Eric Belanger <eric@archlinux.org>

pkgname=pingus-git
pkgver=0.7.6.r80.g6a1153a
pkgrel=1
pkgdesc="A Lemmings clone, i.e. a level-based puzzle game (development version)"
arch=('i686' 'x86_64')
url="http://pingus.seul.org"
license=('GPL')
depends=('sdl_image' 'sdl_mixer' 'libgl' 'boost-libs' 'libpng')
makedepends=('git' 'scons' 'coreutils' 'boost' 'mesa' 'glu')
optdepends=("cwiid: to play with your wiimote (requires rebuild)")
source=("git+https://code.google.com/p/pingus/"
        "pingus.desktop")
sha256sums=('SKIP'
            'c00aef6d6f95449955e1367a5912e211f09dc345bb154084d0f13137e2089dce')

pkgver() {
  cd pingus

  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

prepare() {
  # manpage must be in man6, not man1
  sed "s|/man1/|/man6/|g" -i pingus/Makefile
}

build() {
  cd pingus

  # add our build flags... yes, this looks ugly :/
  scons CPPFLAGS="\"$CPPFLAGS\"" CXXFLAGS="\"$CXXFLAGS\"" LINKFLAGS="\"$LDFLAGS\"" -j$(nproc)
}

package() {
  cd pingus

  make install DESTDIR="$pkgdir/" PREFIX="/usr"
  # .desktop entry
  install -Dm644 ../pingus.desktop "$pkgdir"/usr/share/applications/pingus.desktop
  install -Dm644 data/images/core/editor/actions.png "$pkgdir"/usr/share/pixmaps/pingus.png
}
