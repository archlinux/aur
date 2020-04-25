
pkgname=duckstation-git
pkgver=0.1.r1239.e6bd658
pkgdesc='A Sony PlayStation (PSX), focusing on playability, speed, and long-term maintainability'
pkgrel=2
arch=('x86_64' 'aarch64')
url="https://github.com/stenzek/duckstation"
license=('GPLv3')
makedepends=('git' 'cmake')
depends=('gtk2' 'sdl2' 'qt5-base')
optdepends=(
)
provides=('duckstation')
conflicts=()

_branch=master
source=("git+https://github.com/stenzek/duckstation.git#branch=${_branch}")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/duckstation"
  printf "%s.r%s.%s" "$(git describe --abbrev=0 --tags)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/duckstation"

  cmake -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "${srcdir}/duckstation"

  install -m 755 -d "${pkgdir}/usr/bin/"
  install -m 755 -t "${pkgdir}/usr/bin/" src/duckstation-sdl/duckstation-sdl src/duckstation-qt/duckstation-qt

  install -m 755 -d "${pkgdir}/usr/share/applications/"
  install -m 644 appimage/duckstation-qt.desktop "${pkgdir}/usr/share/applications/duckstation.desktop"
  sed -e 's/Terminal=true/Terminal=false/' -e 's/Name=DuckStation Qt/Name=DuckStation/' -e 's/Icon=duckstation-qt/Icon=duckstation/' -i "${pkgdir}/usr/share/applications/duckstation.desktop"

  install -m 755 -d "${pkgdir}/usr/share/pixmaps/"
  install -m 644 appimage/icon-64px.png "${pkgdir}/usr/share/pixmaps/duckstation.png"
}
