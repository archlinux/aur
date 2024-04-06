# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>

pkgname=python-sphinx-jinja
# https://github.com/tardyp/sphinx-jinja/blob/master/ChangeLog
pkgver=2.0.2
# curl https://api.github.com/repos/tardyp/sphinx-jinja/git/ref/tags/$pkgver | jq -r .object.sha
_tag=7faac8c23bf523f39c5386524a733c12d8c25dfd
pkgrel=4
pkgdesc='A sphinx extension to include jinja based templates based documentation into a sphinx doc'
arch=(any)
url='https://github.com/tardyp/sphinx-jinja'
license=(MIT)
depends=(python python-docutils python-jinja python-sphinx)
makedepends=(git python-build python-installer python-poetry-core)
checkdepends=(python-pytest)
# tests are no longer included in PyPI source tarballs after upstream switched to poetry
source=("git+https://github.com/tardyp/sphinx-jinja.git?signed#tag=$_tag"
        "sphinx-7.2.patch")
sha256sums=('SKIP'
            '7d28a6d234a64d4de5998869478f001d71d0cf74b7649ebbb780104936a54901')
validpgpkeys=(
  '390EB159056ED56F66AB1092AECD456B4D2531FC'  # https://github.com/tardyp.gpg
)

pkgver() {
  cd sphinx-jinja
  git describe --tags | sed 's/^v//'
}

prepare() {
  cd sphinx-jinja
  # Backport a fix for sphinx 7.2 from https://github.com/tardyp/sphinx-jinja/pull/40 (looks good, but not merged yet)
  patch -Np1 -i ../sphinx-7.2.patch
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
