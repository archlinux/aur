# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=openskyscraper
pkgname=${_pkgname}-git
epoch=5
pkgver=r353+64766c8
pkgrel=1
pkgdesc="Simtower clone"
arch=('i686' 'x86_64')
#url="https://github.com/fabianschuiki/OpenSkyscraper"
url="https://github.com/imvuong/OpenSkyscraper"
license=('GPL')
depends=('libgl' 'sfml' 'libmspack' 'librocket')
makedepends=('cmake' 'git' 'unzip' 'imagemagick')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/imvuong/OpenSkyscraper"
        'SimTower_-_The_Vertical_Empire.zip::http://files.abandonia.com/download.php?game=SimTower+-+The+Vertical+Empire&secure=af938dbb075eeb94c87e771c1ae6be14&td=1544286020'
        'openskyscraper.png::http://www.abandonia.com/files/games/341/Sim%20Tower_thumb.png'
        'openskyscraper.desktop')
sha256sums=('SKIP'
            'a0d203989c52fdaf1816d38d550d6d0de1d22c6d3c1287ea106f3975365d03c7'
            'e350547b48c6b72eeba79b8aa8f4bf66e2b48956596ab2f90895fa908669b96c'
            '66404e18ab53b0d67e9f3b822627234d10cd6e499f6e5529a88524b70e4c7a56')
noextract=('SimTower_-_The_Vertical_Empire.zip')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf 'r%s+%s' "$(git rev-list --count HEAD)" "$(git describe --always)"
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  git submodule update --init
}

build() {
  cd "${srcdir}/${_pkgname}"
  [ -d build ] && rm -r build
  mkdir build
  cd build

  cmake .. -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  install -d -m 755 "${pkgdir}"/usr/share/{pixmaps,applications,openskyscraper}
  cp -Lfpr "${_pkgname}"/data/* "${pkgdir}"/usr/share/openskyscraper/
  unzip SimTower_-_The_Vertical_Empire.zip SIMTOWER.EX_ -d "${pkgdir}"/usr/share/openskyscraper/
  install -D -m 755 "${_pkgname}"/build/OpenSkyscraper "${pkgdir}"/usr/bin/openskyscraper
  convert -crop 113x113+30x0 openskyscraper.png openskyscraper.png
  convert -resize 128x128 openskyscraper.png openskyscraper.png
  install -m644 openskyscraper.png "${pkgdir}"/usr/share/pixmaps/openskyscraper.png
  install -Dm644 openskyscraper.desktop "${pkgdir}"/usr/share/applications/openskyscraper.desktop
}
