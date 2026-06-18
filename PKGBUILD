# Maintainer: Phil A. <flying-sheep@web.de>
# Contributor: Anthony Wang <ta180m@gmail.com>
pkgname=jupyterlab-myst
pkgver=2.7.0
pkgrel=1
pkgdesc='Use MyST in JupyterLab'
arch=(any)
url=https://github.com/executablebooks/$pkgname
license=(BSD)
depends=(jupyter-server)
makedepends=(
	# build
	python-build
	python-hatchling
	jupyterlab  # jlpm
	python-hatch-jupyter-builder
	python-hatch-nodejs-version
	nodejs
	pnpm
	# package
	python-installer
)
provides=(python-jupyterlab-myst)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ed8853c25e96d8dd58a4d745c5c7cb77961bd4c46fa80eb75fc60e2dfd2d8813')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	sed -i 's/pnpm@11/pnpm@11.8.0/g' package.json
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	export COREPACK_ENABLE_DOWNLOAD_PROMPT=0
	python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	mv "$pkgdir"/{usr/,}etc
}
