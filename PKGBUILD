# Maintainer: Martino Pilia <martino.pilia@gmail.com>
_pkgname=pydensecrf
pkgname=python-$_pkgname-git
pkgver=r93.dd07054
pkgrel=1
pkgdesc="Python wrapper to Philipp Krähenbühl's dense CRFs with Gaussian edge potentials"
arch=('any')
url="https://github.com/lucasb-eyer/pydensecrf"
license=('MIT')
depends=('python-numpy')
optdepends=()
makedepends=(
    'cython0'
    'git'
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
source=("git+${url}.git")
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/$_pkgname"
    sed -i 's,\([Cc]\)ython==,\1ython>=,' pyproject.toml setup.py
}

build() {
	cd "$srcdir/$_pkgname"
    python -m build --wheel --no-isolation
}

package() {
	cd "$srcdir/$_pkgname"
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
