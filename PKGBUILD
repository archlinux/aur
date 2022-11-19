# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Felix Kaiser <felix.kaiser@fxkr.net>

pkgname=python38-pytest
pkgver=7.2.0
pkgrel=4
pkgdesc="Simple powerful testing with Python"
arch=('any')
license=('MIT')
url="https://pytest.org/"
depends=('python38-attrs' 'python38-exceptiongroup' 'python38-iniconfig'
         'python38-packaging' 'python38-pluggy' 'python38-tomli')
makedepends=('python38-build' 'python38-installer' 'python38-setuptools'
             'python38-wheel')
checkdepends=('python38-argcomplete' 'python38-hypothesis' 'python38-nose'
              'python38-requests' 'python38-xmlschema'
              # Unlisted, but actually used. Check again after a while:
              'lsof' 'python38-asynctest' 'python38-decorator' 'python38-docutils'
              'python38-jinja' 'python38-numpy' 'python38-pexpect' 'python38-pygments'
              'python38-pytest-xdist' 'python38-twisted')
source=("https://files.pythonhosted.org/packages/source/p/pytest/pytest-$pkgver.tar.gz"
        'pytest-fix_test_raising_repr_test.patch::https://github.com/pytest-dev/pytest/commit/54d5a63d1485110015665ece1065982407394517.patch')
sha256sums=('c4014eb40e10f11f355ad4e3c2fb2c6c6d1919c73f3b5a433de4708202cade59'
            '0b9325fd0ab8789f3dbe82c09cb9a9cfd2aa52383925d4b8c699203c7c4284fd')
b2sums=('051c1c28aae1b2ff97af0b6e58046d8d3ee9b72909d4c8360f7ca3b9f2ed46f24a6db2d6138d1a629ec650bf7b0a14d89b44d0779340c31b60abb8608defd30b'
        'f87c12594070e567169bfd3ea2c0d62879b564085bdbab9b096e51061280254ef1257bc763a71f8a11d5aaaff062baf22a0a4ed28d04ee697cf93d53b411bf21')

# Remove dep on setuptools_scm
prepare() {
  cd pytest-$pkgver
  sed -i "/^\[metadata\]/a version = $pkgver
  /setuptools-scm/d" setup.cfg
  sed -i '/setuptools-scm\|wheel/d
  /\[tool.setuptools_scm\]/,/^$/d' pyproject.toml

  patch --forward --strip=1 --input=../pytest-fix_test_raising_repr_test.patch
}

build() {
  cd pytest-$pkgver
  python3.8 -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd pytest-$pkgver
  python3.8 -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  # https://github.com/pytest-dev/pytest/issues/10042
  test-env/bin/python -m pytest -o xfail_strict=False
}

package() {
  cd pytest-$pkgver
  python3.8 -m installer --destdir="$pkgdir" dist/*.whl

  # Symlink license file
  local site_packages=$(python3.8 -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s "$site_packages"/pytest-$pkgver.dist-info/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
