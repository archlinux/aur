# Maintainer: fuero <fuerob@gmail.com>
_pkgname=bashhub-client
pkgname=${_pkgname}
pkgver=2.3.0
pkgrel=2
pkgdesc='saves every terminal command entered across all sessions and systemto the cloud'
arch=('x86_64')
_repo_prefix='github.com/rcaloras'
_repo_name="${_pkgname}"
url="https://${_repo_prefix}/${_repo_name}"
source=(
	${url}/archive/refs/tags/${pkgver}.tar.gz
)
sha256sums=(
  '70f2d70ee1a24ecca6f9bdf80256a93b488a10eb5cabf63de37ac5520f1cf6c9'
)
license=('Apache')
depends=(
	python
	python-bson
	python-jsonpickle
	python-inflection
	python-humanize
)
conflicts=(${_pkgname}-git)
provides=(${_pkgname})
checkdepends=(
	python-pytest
)
makedepends=(
	python-build python-installer python-wheel
)

build() {
  cd "$_pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  for _file in *.md
  do
    install -Dm644 "${_file}" "${pkgdir}/usr/share/doc/${pkgname}/$(basename ${_file})"
  done

}

check() {
  cd "$_pkgname-$pkgver"
  pytest
}
