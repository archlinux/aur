# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>
# Contributor: Buce <dmbuce@gmail.com>
# Contributor: Duncan Bain <duncanjbain@gmail.com>
# Contributor: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>

_pkgname=Minecraft-Overviewer
pkgname=(${_pkgname,,}{,-docs}-git)
pkgver=0.19.0.r9.6ffbe0f0
pkgrel=1
pkgdesc="Render large resolution images of a Minecraft map with a web UI"
arch=('x86_64')
url="https://github.com/overviewer/${_pkgname}"
license=('GPL3')
depends=('python' 'python-pillow' 'python-numpy')
makedepends=('git' 'python-sphinx')
conflicts=('minecraft-overviewer')
provides=('minecraft-overviewer')
source=("git+https://github.com/overviewer/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  local version="$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
  printf "%s" "${version#v}"
}

build() {
  cd "${_pkgname}"
  python "setup.py" build

  cd ./docs
  make html
}

package_minecraft-overviewer-git() {
  cd "${_pkgname}"
  python "setup.py" install --prefix=/usr --root="$pkgdir"
}

package_minecraft-overviewer-docs-git() {
  arch=('any')
  depends=()
  cd "${_pkgname}/docs/_build/html"

  install -d "$pkgdir/usr/share/doc/${_pkgname,,}/html"
  cp -r -t "$pkgdir/usr/share/doc/${_pkgname,,}/html" -- *
}
