# Contributor: SZanko  <szanko at protonmail dot com>

pkgname=python-dictdiffer
pkgver=0.9.0
pkgrel=2
pkgdesc="Module that helps you to diff and patch dictionaries"
arch=('any')
url="https://github.com/inveniosoftware/dictdiffer"
license=('MIT')
depends=(python)
makedepends=(
  git
  python-build
  python-installer
  python-pytest-runner
  python-wheel
  python-setuptools-scm
)
checkdepends=(
  python-pytest
  python-numpy
)
optdepends=(
  'python-numpy: for comparing numpy arrays'
)
source=("git+${url}#tag=v${pkgver}"
	pull-179.patch
        fix-deprecations.patch)
sha256sums=('d414e30984aab2e38c2b2886ee152ff9ec84b50b9431469e636315e402b64755'
            'e746d0900944b49e4995540667b48476d8f02755a6c95befda4f894d2e97ad44'
            '7e0d69462738ba56a662552498656284a91c49f76fd527126b4cd03fa107aa47')

prepare() {
  cd dictdiffer
  git cherry-pick --no-commit bfb5dd4 # fixes #174
  patch -p1 < ../pull-179.patch
  patch -p1 < ../fix-deprecations.patch
}

build() {
  cd dictdiffer
  python -m build --wheel --no-isolation
}

check() {
  cd dictdiffer
  rm -vf pytest.ini
  PYTHONPATH=./build/lib pytest
}

package() {
  cd dictdiffer
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
