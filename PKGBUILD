# Maintainer: McModder <mcmodder@mcmodder.ru>

pkgname=openttd-git
pkgver=25061.1893aef64
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
  # http://site.icu-project.org/download/61#TOC-Migration-Issues
  CXXFLAGS+=' -DU_USING_ICU_NAMESPACE=1'

  cmake -B build \
        -S "$pkgname" \
        -DCMAKE_INSTALL_BINDIR="bin" \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -DPERSONAL_DIR=".${pkgname}" \
        -DGLOBAL_DIR="/usr/share/${pkgname}" \
        -DCMAKE_INSTALL_DATADIR="share" \
        -DCMAKE_INSTALL_DOCDIR="share/doc/${pkgname}" \
        -DBINARY_NAME="${pkgname}"
  make -C build
}

package() {
  make -C build install DESTDIR="$pkgdir"
}
