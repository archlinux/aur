# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-jaraco.versioning
_name=${pkgname#python-}
pkgver=1.1.0
pkgrel=3
pkgdesc="More sophisticated version manipulation (than packaging)"
arch=('any')
url="https://github.com/jaraco/jaraco.versioning"
license=('MIT')
depends=('python-packaging')
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools-scm'
  'python-wheel'
)
checkdepends=('python-pytest')
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        'https://github.com/jaraco/jaraco.versioning/pull/5.patch')
sha256sums=('e160ba954c385e38b153ba1d00f27fb02ce65a63bfb2b23b0d0ec5c6fe963f35'
            '4c6eb2b21f2b5f49301e1dc2ee84b41f73f9a857084104b7a4ece2b68017a455')

prepare() {
  cd "$_name-$pkgver"

  # Avoid reliance on packaging's repr in SummableVersion doctest
  # https://github.com/jaraco/jaraco.versioning/issues/4
  patch -Np1 -i ../5.patch
}

build() {
  cd "$_name-$pkgver"
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd "$_name-$pkgver"
  python -m venv --clear --without-pip --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -I -m pytest
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
