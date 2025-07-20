# Maintainer: 
# Contributor: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Felix Yan <felixonmars@archlinux.org>
pkgname=python-pytest-flake8
_name=${pkgname#python-}
pkgver=1.3.0
pkgrel=1
pkgdesc="A pytest plugin for efficiently checking PEP8 compliance"
arch=('any')
url="https://github.com/coherent-oss/pytest-flake8"
license=('MIT')
depends=(
  'python-flake8'
  'python-pytest'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools-scm'
  'python-wheel'
)
source=("$_name-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('7b7fb4836e5510c924d1d49af9c1253286f1e353f78b2444ae2733a2cac9b6bc')

build() {
  cd "$_name-$pkgver"
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd "$_name-$pkgver"

  # Hack entry points by installing it
  python -m installer --destdir="$PWD/tmp_install" dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  PYTHONPATH="$PWD/tmp_install/${site_packages}:$PYTHONPATH" pytest
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "${site_packages}/$_name-$pkgver.dist-info/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/"
}
