# Maintainer: McModder <mcmodder@mcmodder.ru>

pkgname=openttd-git
pkgver=26406.c482f05616
pkgrel=1
pkgdesc='An engine for running Transport Tycoon Deluxe (latest GIT build)'
arch=('i686' 'x86_64')
url='http://openttd.org'
license=('GPL')
depends=('libpng' 'sdl2' 'icu' 'fontconfig' 'lzo' 'hicolor-icon-theme' 'desktop-file-utils' 'xz' 'fluidsynth')
optdepends=('openttd-opengfx: free graphics'
            'openttd-opensfx: free soundset')
makedepends=('git' 'cmake' 'ninja')

source=("$pkgname::git+https://github.com/OpenTTD/OpenTTD.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname}
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cmake -B build \
        -G Ninja \
        -S "${pkgname}" \
        -DBINARY_NAME="${pkgname}" \
        -DCMAKE_INSTALL_BINDIR="bin" \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -DCMAKE_INSTALL_DATADIR="/usr/share" \
        -DPERSONAL_DIR=".${pkgname}"

  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}
