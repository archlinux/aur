# Maintainer: McModder <mcmodder@mcmodder.ru>

pkgname=openttd-git
pkgver=24263.8ef3d8f58
pkgrel=1
pkgdesc='An engine for running Transport Tycoon Deluxe (latest GIT build)'
arch=('i686' 'x86_64')
url='http://openttd.org'
license=('GPL')
depends=('libpng' 'sdl2' 'icu' 'fontconfig' 'lzo' 'hicolor-icon-theme' 'desktop-file-utils' 'xz' 'fluidsynth')
optdepends=('openttd-opengfx: free graphics'
            'openttd-opensfx: free soundset')
makedepends=('git' 'cmake')

source=("$pkgname::git+https://github.com/OpenTTD/OpenTTD.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname}
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$srcdir/$pkgname"

  mkdir -p build
  cd build

  # http://site.icu-project.org/download/61#TOC-Migration-Issues
  CXXFLAGS+=' -DU_USING_ICU_NAMESPACE=1'

  cmake -DCMAKE_INSTALL_PREFIX="/usr" \
        -DPERSONAL_DIR=".${pkgname}" \
        -DGLOBAL_DIR="/usr/share/${pkgname}" \
        ..
  make
}

package() {
  cd "$srcdir/$pkgname/build"

  make install DESTDIR="$pkgdir"

  ## temporary fix
  ## TODO: Delete when DATA_DESTINATION_DIR, DOCS_DESTINATION_DIR, MAN_DESTINATION_DIR and binary name will be configurable
  cd "$pkgdir"
  mv usr/share/games/openttd usr/share/openttd-git
  mv usr/share/doc/openttd usr/share/doc/openttd-git
  mv usr/share/man/openttd usr/share/man/openttd-git
  mv usr/share/man/openttd-git/openttd.6 usr/share/man/openttd-git/openttd-git.6
  mv usr/bin/openttd usr/bin/openttd-git
  rm -r usr/share/games
}
