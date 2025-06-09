# Maintainer:
# Contributor: Lubosz Sarnecki <lubosz@gmail.com>

_pkgname="novelwriter"
pkgname="$_pkgname-git"
pkgver=2.7.r44.ge816cbc
pkgrel=1
pkgdesc="A markdown-like document editor for writing novels"
url="https://github.com/vkbo/novelWriter"
license=('GPL-3.0-or-later')
arch=('any')

depends=(
  'python'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='v*[a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgsrc"
  python -m build --no-isolation --wheel
}

package() {
  depends+=(
    'python-pyenchant'
    'python-pyqt6'
  )

  cd "$_pkgsrc"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 setup/data/x-novelwriter-project.xml -t "$pkgdir/usr/share/mime/packages"
  install -Dm644 setup/data/novelwriter.desktop -t "$pkgdir/usr/share/applications/"

  install -Dm644 setup/data/hicolor/512x512/apps/novelwriter.png \
    -t "$pkgdir/usr/share/pixmaps/"

  install -Dm644 setup/data/hicolor/512x512/mimetypes/application-x-novelwriter-project.png \
    -t "$pkgdir/usr/share/pixmaps/"
}
