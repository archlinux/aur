# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>

pkgname=python-sphinx-jinja
# https://github.com/tardyp/sphinx-jinja/blob/master/ChangeLog
pkgver=1.4.0
# curl https://api.github.com/repos/tardyp/sphinx-jinja/git/ref/tags/$pkgver | jq -r .object.sha
_tag=c142a2d05089a56fef4b2fd0701ee0b45c7d5f24
pkgrel=1
pkgdesc='A sphinx extension to include jinja based templates based documentation into a sphinx doc'
arch=(any)
url='https://github.com/tardyp/sphinx-jinja'
license=(MIT)
depends=(python python-docutils python-jinja python-sphinx)
makedepends=(git python-build python-installer python-poetry-core)
checkdepends=(python-pytest)
# tests are no longer included in PyPI source tarballs after upstream switched to poetry
source=("git+https://github.com/tardyp/sphinx-jinja.git?signed#tag=$_tag")
sha256sums=('SKIP')
validpgpkeys=(
  '390EB159056ED56F66AB1092AECD456B4D2531FC'  # https://github.com/tardyp.gpg
)

prepare() {
  cd sphinx-jinja
  rm -v sphinxcontrib/__init__.py
}

pkgver() {
  cd sphinx-jinja
  git describe --tags | sed 's/^v//'
}

build() {
  cd sphinx-jinja
  python -m build --wheel --no-isolation
}

check() {
  cd sphinx-jinja
  pytest
}

package() {
  cd sphinx-jinja
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
