# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: xantares
# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=george
pkgname=python-$_name
pkgver=0.4.4
pkgrel=1
pkgdesc="Blazingly fast Gaussian Processes for regression.."
url="https://github.com/dfm/george"
arch=('x86_64' 'aarch64')
license=('MIT')
depends=('python-numpy'
         'python-scipy'
         'glibc'
         'libstdc++'
         'libgcc')
makedepends=('python-scikit-build-core'
             'pybind11'
			 'python-setuptools-scm'
             'python-build'
             'python-installer'
			 'eigen')
checkdepends=('python-pytest')
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
		"python-george-system-eigen.patch")
sha256sums=('ab89513c4eb3f34764dfe82babca8f8b7e09c856fc385f19f19a4149b76e60cb'
			'30fc45339c9b1479941c8614e602077c68f1f3e400d040e9783cb6f3c1cc48f7')

prepare() {
  cd "$_name-$pkgver"
  patch -Np1 -i "$srcdir/python-george-system-eigen.patch"
}

build() {
  cd "$_name-$pkgver"
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --disable-warnings
  )
  cd "$_name-$pkgver"
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -P -m pytest "${pytest_options[@]}" tests
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
