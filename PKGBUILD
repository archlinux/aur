# Maintainer: fuero <fuerob@gmail.com>
_pkgname=bashhub-client
pkgname=${_pkgname}
# renovate: datasource=github-releases depName=rcaloras/bashhub-client
pkgver=2.4.0
pkgrel=6
pkgdesc='saves every terminal command entered across all sessions and system to the cloud'
arch=('x86_64')
_repo_prefix='github.com/rcaloras'
_repo_name="${_pkgname}"
url="https://${_repo_prefix}/${_repo_name}"
source=(
  ${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz
)
sha256sums=('c3a43a50137f599a46d7371c4e6da98ce2c51c6104167b22fb5c0cf7414c0c50')
license=('Apache')
depends=(
	python
	python-bson
	python-jsonpickle
	python-inflection
	python-humanize
	python-npyscreen
)
conflicts=(${_pkgname}-git)
provides=(${_pkgname})
checkdepends=(
	python-pytest
	python-click
	python-dateutil
	python-requests
	python-future
	python-mock
)
makedepends=(
	python-build
    python-installer
    python-wheel
    python-setuptools
)

prepare() {
  cd "$_pkgname-$pkgver"
  sed -i -e "s/'__version__'/__version__/g" setup.py
}

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
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  rm -rf "${pkgdir}${site_packages}/tests"

}

check() {
  cd "$_pkgname-$pkgver"
  pytest
}
