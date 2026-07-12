# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=openskyscraper
pkgname=${_pkgname}-git
epoch=6
pkgver=r465+aefdef4
pkgrel=1
pkgdesc="Simtower clone"
arch=('i686' 'x86_64')
#url="https://github.com/fabianschuiki/OpenSkyscraper"
url="https://github.com/uaktags/OpenSkyscraper"
license=('GPL-2.0-only')
depends=('libgl' 'sfml' 'libmspack' 'librocket' 'tgui')
makedepends=('cmake' 'git' 'unzip')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=(${_pkgname}::git+https://github.com/uaktags/OpenSkyscraper.git#branch="feature/simtower-gap-impl"
        'SimTower_-_The_Vertical_Empire.zip::https://d2.xp.myabandonware.com/t/6b541647-d5bf-4d20-8569-0df1b2682842/SimTower-The-Vertical-Empire_Win-3x_EN_Floppy-version.zip'
        'openskyscraper.png' #::http://www.abandonia.com/files/games/341/Sim%20Tower_thumb.png'
        'openskyscraper.desktop')
sha256sums=('SKIP'
            'a0d203989c52fdaf1816d38d550d6d0de1d22c6d3c1287ea106f3975365d03c7'
            '7ff1b240a878714d8910c7f19f4512b3289621d46490529c93114b628a4a06a6'
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
  install -Dm644 openskyscraper.desktop "${pkgdir}"/usr/share/applications/openskyscraper.desktop
}
