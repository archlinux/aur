# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: zwindl on AUR

pkgname=python-pypugjs
pkgver=5.9.12
pkgrel=4
pkgdesc='PugJS syntax adapter for Django, Jinja2 and Mako templates'
url='https://github.com/kakulukia/pypugjs'
depends=(python python-six python-charset-normalizer)
optdepends=(python-django python-jinja python-tornado python-mako python-markdown)
makedepends=(python-build python-installer python-setuptools python-wheel ${optdepends[@]})
checkdepends=(python-nose)
license=(MIT)
arch=(any)
source=("https://github.com/kakulukia/pypugjs/archive/v$pkgver/pypugjs-$pkgver.tar.gz")
sha256sums=('a13a78aa26e05613a3d6a7551a08895139a2053978000a3d8a8e3c44f24f3c64')

prepare() {
  cd pypugjs-$pkgver
  # avoid using upstream pyproject.toml as it seems unmaintained
  # out-dated version= value, missing metadata fields, excessive dependencies
  rm -v pyproject.toml
}

build() {
  cd pypugjs-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd pypugjs-$pkgver
  # -w is needed here as test_cases.py looks into cases/
  PYTHONPATH="$PWD" nosetests -w pypugjs/testsuite
}

package() {
  cd pypugjs-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
