# Maintainer: Aseem Athale <athaleaseem@gmail.com>

_pkgname=langid.py
pkgname=python-langid-git
pkgver=r242.4153583
pkgrel=2
pkgdesc="Stand-alone language identification system using python"
arch=('any')
url="https://github.com/saffsd/${_pkgname}"
license=('BSD')
depends=('python' 'python-numpy')
makedepends=('git' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("git+${url}.git"
    "0001-langid-Use-2to3-tool.patch")
sha512sums=('SKIP'
            '3f1a17b7cd3bd6e01572c785c4759212e8e4ab4a305e1abc4fb7c27f66d7db430edea65025027ebc8dc9d26241bf5626574141a70ee34ad0ba97221ab0e64fc3')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  git -C "${srcdir}/${_pkgname}" clean -dfx
  patch -Np1 -d "${_pkgname}" < "0001-langid-Use-2to3-tool.patch"
}

build() {
  cd "${_pkgname}"
	## skip dependency check because of pinned deps
  python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
  cd "${_pkgname}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
