# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>

_name=oojs-ui
pkgname=$_name-archlinux-git
pkgdesc="JavaScript UI library used by MediaWiki (with ArchLinux theme)"
url="https://github.com/lahwaacz/oojs-ui"
pkgver=0.48.2.r6.gbfd702e
pkgrel=1
license=(MIT)
arch=(any)
depends=()
makedepends=(git npm grunt-cli composer)
source=("git+https://github.com/lahwaacz/oojs-ui.git")
sha256sums=('SKIP')

pkgver() {
  cd $_name
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $_name
  npm install
  grunt build

  # archlinux theme has exactly the same icons as the wikimediaui theme
  rm -rf dist/themes/archlinux
  ln -s wikimediaui dist/themes/archlinux
}

package() {
  cd $_name
  install -dm755 "$pkgdir/usr/share/$_name-archlinux"

  # install resources (css, js, json, svg)
  mv dist "$pkgdir/usr/share/$_name-archlinux/resources"

  # install the generated PHP sources
  cp -r php "$pkgdir/usr/share/$_name-archlinux"

  # install the license
  install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
