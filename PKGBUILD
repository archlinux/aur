# Maintainer: otaj <ota.jasek@proton.me>

_name=xkbregistry
pkgname=python-xkbregistry
pkgver=0.1
pkgrel=1
pkgdesc="Python bindings for libxkbregistry using cffi"
arch=(x86_64)
url="https://github.com/sde1000/python-xkbregistry"
license=(MIT)
depends=(python-cffi libxkbcommon)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha512sums=('daa4ac4aa99289d7df18c6e4bb5f67b96c2a0d29749e7c271badf739d8edfbb3cf9100458c554e2a262ddf5ecca054cecc94b858eef2699d558497533b2fd520')
b2sums=('6d97b395980d4b4d10458f266ed8f9a27ec9490403340af469ec45ddefe8b0a7eea28f9e18bc8c00eb5bcc0542a2a6f8bc28bb0da933e307e496b93095a940fa')

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
