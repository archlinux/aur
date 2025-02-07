# Maintainer: otaj <ota.jasek@proton.me>

_name=xkbregistry
pkgname=python-xkbregistry
pkgver=1.5
pkgrel=1
pkgdesc="Python bindings for libxkbregistry using cffi"
arch=(x86_64)
url="https://github.com/sde1000/python-xkbregistry"
license=(MIT)
depends=(python-cffi libxkbcommon)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha512sums=('b0fd0ed6645501fcdded675606e67b99cd3bf6074e3f7398219b5c540e56f4ab520b853b939611a36bf1ec5ca81fb34a9510b9a362901a1cca6cedf976e88325')
b2sums=('2f66b40f2add187a05b21ad3a69def6c2e85762bf6442dc1cdc21eef1d841d1ef85accf55b71178a1fe8642085627c3297752e464f65207786bf529c64d4283b')

build() {
	cd $_name-$pkgver
	python $_name/ffi_build.py
	python -m build --wheel --no-isolation
}

check() {
	local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

	cd $_name-$pkgver
	# install to temporary location, as importlib is used
	python -m installer --destdir=test_dir dist/*.whl
	export PYTHONPATH="test_dir/$_site_packages:$PYTHONPATH"
	sed -i "/test_layouts/ i \    @pytest.mark.xfail(reason=\"Archlinux does not ship 'nec_vndr/jp' layout\")" tests/test_rxkb.py
	sed -i '1 i import pytest' tests/test_rxkb.py
	pytest -v
}

package() {
	cd $_name-$pkgver
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -vDm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
	install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
