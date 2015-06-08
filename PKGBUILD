# Maintainer: Frederic Bezies < fredbezies at gmail dot com>
# Contributor: bitwave < aur [at] oomlu [d0t] de >
# Contributor: carstene1ns <url/mail: arch carsten-teibes de>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail> 
# Contributor: Biginoz <biginoz _at_ free _point_ fr>
# Contributor: Adrián Chaves Fernández <adriyetichaves@gmail.com>

_pkgbase=violetland
pkgname=$_pkgbase-git
pkgver=0.4.4.r364.g9a15a83
pkgrel=2
pkgdesc='Open source cross platform game where a girl, Violet, struggles with hordes of monsters (clone of "crimsonland").'
arch=('i686' 'x86_64')
url="http://violetland.github.io"
license=('GPL3' 'CCPL:by-sa')
depends=('sdl_image' 'sdl_mixer' 'sdl_ttf' 'mesa' 'boost-libs')
makedepends=('cmake' 'boost' 'git')
conflicts=("$_pkgbase")
provides=("$_pkgbase")
source=($_pkgbase::"git+https://github.com/ooxi/violetland.git")
md5sums=('SKIP')

pkgver() {
  cd $_pkgbase

  # as there are no tags, use some black magic to get version...
  printf "%s.r%s.g%s" "$(grep "VERSION =" src/program.cpp | sed 's|.*VERSION.*"\(.*\)".*|\1|;s/[^0-9\.]*//g')" \
    "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $_pkgbase

  # check out submodules
  git submodule init
  git submodule update
}

build() {
  cd $_pkgbase

  cmake ./ -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd $_pkgbase

  make DESTDIR="$pkgdir/" install

  # .desktop entry
  install -Dm644 $_pkgbase.desktop "$pkgdir"/usr/share/applications/$_pkgbase.desktop
  install -Dm644 icon-light.png "$pkgdir"/usr/share/pixmaps/$_pkgbase.png
}
