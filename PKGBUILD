# Maintainer: envolution
# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# shellcheck shell=bash disable=SC2034,SC2154

_distname=webtest-aiohttp
pkgname="python-${_distname}"
pkgver=2.0.0
pkgrel=6
pkgdesc='Provides integration of WebTest with aiohttp.web applications'
arch=(any)
url="https://pypi.org/project/${_distname}"
_repourl="https://github.com/sloria/${_distname}"
license=(MIT)
depends=(
  python-aiohttp
  python-webob
  python-webtest
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-pytest
  python-pytest-aiohttp
  python-pytest-asyncio
  python-pytest-loop
)
source=("${_distname}-${pkgver}.tar.gz::${_repourl}/archive/refs/tags/${pkgver}.tar.gz"
  "${_distname}-PR7-fix-tests-Python311.patch::${_repourl}/pull/7.patch")
b2sums=('38e782a465f929efd455109a3108499bfe605a4c5434dd9dc5945147138f8b7fb8159bae7bb8ef5a9a85423fc77028b6012f159b07fe9d3da81f851f0ce07deb'
        '52c3dd7824eab79080ce2c79c05da725bf7054b13a4edc19fc1d98946846c1c2ae6038f64e0fc5c23750169b2dba7748b029ba0f1b2ce42a24698e6414e88ba7')

prepare() {
  cd "$_distname-$pkgver"
  patch --forward --strip=1 -i ../"${_distname}-PR7-fix-tests-Python311.patch"
}

build() {
  cd "$_distname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_distname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
# vim:set ts=2 sw=2 et:
