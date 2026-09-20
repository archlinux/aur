# Maintainer: Phil A. <flying-sheep@web.de>
# Contributor: Anthony Wang <ta180m@gmail.com>
_name=jupyterlab-git
pkgname=jupyterlab-extension-jupyterlab_git
pkgver=0.54.1
pkgrel=1
pkgdesc='Git extension for JupyterLab'
arch=(any)
url=https://github.com/jupyterlab/$_name
license=(BSD)
depends=(jupyterlab jupyter-server python-nbdime jupyter-nbformat python-packaging python-pexpect python-traitlets)
makedepends=(npm python-hatchling python-hatch-jupyter-builder python-hatch-nodejs-version python-build python-installer)
provides=(jupyterlab-extension-git python-jupyterlab-git)
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b51cd170e0a939bbaa51ae59ea55d06bfe701d067dc90e57e59c51f8e2126866')


build() {
	cd "$_name-$pkgver"
	for package in core jupyterlab; do
		pushd "packages/$package"
		python -m build --wheel --no-isolation --skip-dependency-check
		popd
	done
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" packages/*/dist/*.whl
	mv "$pkgdir"/{usr/,}etc
	install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
