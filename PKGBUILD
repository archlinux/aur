# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Cravix < dr dot neemous at gmail dot com >
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>

pkgname=freegish-git
_pkgname=freegish
pkgver=1.60.409.7403066
pkgrel=1
pkgdesc="Free version of gish, a physics platformer"
arch=('x86_64' 'i686')
url="https://github.com/freegish/freegish"
license=('GPL-2.0-or-later' 'CC-BY-SA-3.0')
depends=('sdl2' 'openal' 'libvorbis' 'libpng' 'libgl' 'hicolor-icon-theme')
makedepends=('git' 'cmake')
provides=('freegish')
conflicts=('freegish')
install=freegish.install

source=("git+https://github.com/jose1711/${_pkgname}#branch=fix-modern-build")

md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  echo 1.60.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  cd "$srcdir/$_pkgname"
  # game data moved into datapacks/, but CMakeLists.txt still installs the old dirs
  sed -i '/^install(DIRECTORY \(animation\|level\|sound\|texture\) /d' CMakeLists.txt
  sed -i 's|^install(FILES "freegish.bmp"|install(DIRECTORY datapacks DESTINATION share/freegish)\n&|' CMakeLists.txt
  # TYPE MAN installs into share/man without the section subdirectory
  sed -i 's|TYPE MAN)|DESTINATION share/man/man6)|' CMakeLists.txt
}

build() {
  cmake -B build -S "$srcdir/$_pkgname" -DCMAKE_INSTALL_PREFIX=/usr -DINSTALL_FHS=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

# vim: sw=2:ts=2 et:
