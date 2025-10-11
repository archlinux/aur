# Maintainer: Max Rossmannek <max@rossmannek.de>

_pkgname='cobib-zotero'
pkgname="${_pkgname}-git"
pkgver=r19.43fb9f8
pkgrel=1
arch=('any')
depends=(
    'cobib'
    'python'
    'python-pyzotero'
)
license=('MIT')
makedepends=(
    'git'
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
    'ruby-ronn-ng'
)
provides=('cobib-zotero')
conflicts=('cobib-zotero')
pkgdesc="Zotero importer plugin for coBib"
url="https://gitlab.com/cobib/${_pkgname}"
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $srcdir/${_pkgname}
  python3 -m build --wheel --no-isolation
}

package() {
  cd $srcdir/${_pkgname}
  make DESTDIR="${pkgdir}" install_extras
  python3 -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
