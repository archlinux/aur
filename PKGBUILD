# Maintainer: Ilaï Deutel <PlMWPh1WSmypRv0JQljz> (echo ... | tr 'A-Za-z' 'l-za-kL-ZA-K' | base64 -d)
# Contributor: David Runge <dvzrv@archlinux.org>

pkgname=pypiserver
pkgver=2.4.1
pkgrel=1
pkgdesc="Minimal PyPI server for uploading and downloading packages with pip/easy_install"
arch=(any)
url="https://github.com/pypiserver/pypiserver"
license=(
  MIT
  Zlib
)
depends=(
  python
  python-legacy-cgi
  python-packaging
  python-pip
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-setuptools-git
  python-wheel
)
checkdepends=(
  python-passlib
  python-pytest
  python-watchdog
  python-webtest
)
optdepends=(
  'python-passlib: for authentication'
  'python-setuptools: for new - still inactive - config module'
  'python-waitress: for waitress support'
  'python-watchdog: for cache'
)
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
b2sums=('37d8898360070465f90f706401d94cc73502d8aefef8867281b52de527a162595b6707a862bf5bbaeba55c7c112cc04b8ec2d75fccc85a712cd10664288299a5')


prepare() {
  # extract dedicated license files
  sed -n '7,25p' $pkgname-$pkgver/LICENSE.txt > MIT.txt
  sed -n '30,49p' $pkgname-$pkgver/LICENSE.txt > Zlib.txt
}

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  TMP_DIR=$(mktemp -d)
  # shellcheck disable=SC2064
  trap "rm -rf ${TMP_DIR}" INT TERM EXIT

  cd $pkgname-$pkgver
  python -m installer --destdir="$TMP_DIR" dist/*.whl
  export PYTHONPATH="$TMP_DIR/$site_packages:$PYTHONPATH"
  pytest -vv --ignore docker/test_docker.py -k "not test_twine"
}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/$pkgname*.whl
  install -vDm 644 {AUTHORS,CHANGES}.rst README.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 ../{MIT,Zlib}.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
