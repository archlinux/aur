# Maintainer: LinArcx <linarcx@gmail.com>

pkgname='terrarium-git'
pkgver=r143.5121446
pkgrel=1
pkgdesc="UI Prototyping Tool for Coders (Github version)"
arch=('any')
url="https://github.com/penk/terrarium-app"
license=('MIT')
depends=('qt5-quickcontrols2' 'qt5-quickcontrols')
makedepends=('git' 'qt5-base')
source=("${pkgname}::git+https://github.com/penk/terrarium-app")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "${srcdir}/${pkgname}"
  git submodule init && git submodule update
  qmake
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm755 ./Terrarium ${pkgdir}/usr/bin/Terrarium
  install -Dm644 ./platform/arch/terrarium.desktop ${pkgdir}/usr/share/applications/terrarium.desktop
  install -Dm644 ./terrarium-app.png ${pkgdir}/usr/share/pixmaps/terrarium-app.png
  install -Dm644 ./LICENSE ${pkgdir}/usr/share/licenses/Terrarium/LICENSE
}