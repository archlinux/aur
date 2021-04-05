# Maintainer: leuko <leuko_aydos_de>
_py=ipycanvas
pkgname=python-$_py-git
provides=("${pkgname%-git}")
pkgver=r329.30ccca2
pkgrel=1
pkgdesc="Interactive widgets library exposing the browser's Canvas API"
arch=(any)
url="https://github.com/martinRenou/ipycanvas"
license=(BSD)
depends=(
	python
	python-setuptools
	python-pillow
	python-numpy
	python-orjson
	jupyter
	jupyterlab
	jupyterlab-widgets
)
makedepends=(
	git
	python-setuptools
	python-jupyter_packaging
)
source=("git+$url")
md5sums=('SKIP')
pkgver() {
	cd $_py
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build() {
	cd $_py
	python setup.py build
}
package() {
	cd $_py
	#python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 --skip-build
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build

	# install (and enable) extension according to
	# https://jupyterlab.readthedocs.io/en/latest/extension/extension_dev.html#distributing-a-prebuilt-extension
	prebuilt_extension_dir_lab="$pkgdir"/usr/share/jupyter/labextensions
	mkdir -p $prebuilt_extension_dir_lab
	ln -s "$pkgdir"/usr/lib/python*/site-packages/ipycanvas/labextension $prebuilt_extension_dir_lab/$_py

	# for classic interface
	prebuilt_extension_dir_classic="$pkgdir"/usr/share/jupyter/nbextensions
	mkdir -p $prebuilt_extension_dir_classic
	ln -s "$pkgdir"/usr/lib/python*/site-packages/ipycanvas/nbextension $prebuilt_extension_dir_classic/$_py
	
	install -Dm644 $(find LICENSE*|head -1) "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
