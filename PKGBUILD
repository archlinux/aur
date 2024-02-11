# Maintainer: leuko <leuko_aydos_de>
_py=ipycanvas
pkgname=python-$_py-git
provides=("${pkgname%-git}")
pkgver=r473.b5cf121
pkgrel=1
pkgdesc="Interactive widgets library exposing the browser's Canvas API"
arch=(any)
url="https://github.com/jupyter-widgets-contrib/ipycanvas"
license=(BSD)
depends=(
	python
	python-setuptools
	python-pillow
	python-numpy
	python-ipywidgets  # TODO actually ipywidgets requires jupyterlab widgets? https://archlinux.org/packages/community/any/python-ipywidgets/
)
makedepends=(
	git
    python-build
    python-installer
    python-wheel
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
    python -m build --wheel --no-isolation
}
package() {
	cd $_py
	py_ver=$(python --version | cut -d' ' -f2 | cut -d. -f1,2)
    python -m installer --destdir="$pkgdir" dist/*.whl

	# install (and enable) extension according to
	# https://jupyterlab.readthedocs.io/en/latest/extension/extension_dev.html#distributing-a-prebuilt-extension
	prebuilt_extension_dir_lab="$pkgdir"/usr/share/jupyter/labextensions
	mkdir -p $prebuilt_extension_dir_lab
	ln -s /usr/lib/python${py_ver}/site-packages/ipycanvas/labextension $prebuilt_extension_dir_lab/$_py

	# for classic interface
	prebuilt_extension_dir_classic="$pkgdir"/usr/share/jupyter/nbextensions
	mkdir -p $prebuilt_extension_dir_classic
	ln -s /usr/lib/python${py_ver}/site-packages/ipycanvas/nbextension $prebuilt_extension_dir_classic/$_py
	
	install -Dm644 $(find LICENSE*|head -1) "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
