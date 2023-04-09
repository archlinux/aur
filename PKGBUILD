# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pytest-html
pkgname=python-pytest-html
pkgver=3.2.0
pkgrel=3
pkgdesc="Plugin for generating HTML reports for pytest results"
arch=(any)
url="https://github.com/pytest-dev/pytest-html"
license=(MPL2)
depends=(python-py python-pytest python-pytest-metadata)
makedepends=(python-build python-installer python-setuptools python-setuptools-scm python-wheel)
checkdepends=(python-ansi2html python-pytest-mock python-pytest-rerunfailures
python-pytest-xdist)
source=(
  https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz
  $pkgname-3.2.0-build_system.patch
)
sha512sums=('1d448b904d484e5a70c4ede4562a54a1eb14d13a07501c9ec52e607e1261dacb1af96bca416fa8fbe03dd7f5c3f833cc0f6ed96b1f433f0057f2aad7f7fbd734'
            '83c82f453ae07c030ba7807674ac6a33ca119ba482d52e73d1093395dad30e95bbe196f501290a70714b02ba40fdf8d1d82b5a790e02bc891605917fd4f1bdde')
b2sums=('7c06f42a1530956fa24a9ea6a1fb8112b053cf461b30f0509c513f8e81044c6b50885d3135157295fbaabb8c24078bd182efc5e868227a3334c13bb1b71d7352'
        '826b11bf59badf2a24cc92c53a8d70e2f95b5ab20c623042c7b72e7f2dba7b13287d5811acfaf42c4931401d97bec29c933cc755b4f5a22257a13bfe6a47448b')

prepare() {
  # remove the use of wheel and setuptools-scm-git-archive: https://github.com/pytest-dev/pytest-html/pull/567
  patch -Np1 -d $_name-$pkgver -i ../$pkgname-3.2.0-build_system.patch
}

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name-$pkgver
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="test_dir/$_site_packages:$PYTHONPATH"
  pytest -vv
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
}
