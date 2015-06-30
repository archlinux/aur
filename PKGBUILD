# Maintainer: Johan Klokkhammer Helsing <johanhelsing@gmail.com>
pkgname=noisemodeler-git
pkgver=0.1.17.g32982da
pkgrel=1
pkgdesc="An in-game procedural terrain and content generation framework"
arch=('i686' 'x86_64')
url="http://www.noisemodeler.org"
license=('zlib' 'LGPL')
groups=()
depends=('qt5-base' 'qt5-declarative' 'qt5-quickcontrols' 'qt5-svg' 'mesa' 'hicolor-icon-theme' 'desktop-file-utils')
makedepends=('git' 'boost')
provides=()
conflicts=()
backup=()
options=()
install=noisemodeler.install
source=("${pkgname}::git://github.com/noisemodeler/noisemodeler.git")
noextract=()
md5sums=('SKIP') #generate with 'makepkg -g'

pkgver() {
  cd "${pkgname}"
  git describe --long --tags | sed -r 's/([^-]*-g)/\1/;s/-/./g'
}

build() {
  cd "$srcdir/${pkgname}"
  git submodule update --init --recursive
  cd "$srcdir"
  rm -rf "$srcdir/${pkgname}-build"
  mkdir "$srcdir/${pkgname}-build"
  cd "$srcdir/${pkgname}-build"

  qmake "$srcdir/${pkgname}"
  make
}

package() {
  cd "$srcdir/${pkgname}-build"
  make INSTALL_ROOT="$pkgdir/" install

  cd "${pkgdir}"

  #Add license
  mkdir -p "usr/share/licenses/${pkgname}/"
  cp "$srcdir/${pkgname}/LICENSE.md" "usr/share/licenses/${pkgname}/"

  #Removes all non-header files.
  #This may be removed when upstream fixes this issue.
  find usr/include ! -name "*.hpp" -type f -exec rm {} \;
  rm -rf usr/include/nmlib/docs
  rm -rf usr/include/nmlib/icons
  rm -rf usr/include/nmlib/qml
}

# vim:set ts=2 sw=2 et:
