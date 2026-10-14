# Maintainer: Gianluca Mazza <info@gianlucamazza.it>
#
# Built from the PyPI sdist rather than the git tag: the sdist is the artefact
# published under Trusted Publishing, it carries the test suite (MANIFEST.in
# ships conftest.py, examples/ and docs/), and check() therefore runs the same
# suite CI does.
pkgname=python-openappx
_name=openappx
pkgver=0.6.4
pkgrel=1
pkgdesc="Build, sign, bundle and install Windows Appx/MSIX packages from Linux"
arch=('any')
url="https://github.com/gianlucamazza/openappx"
license=('MIT')
# The default pack path is standard library only. python-cryptography is what
# the [sign] extra needs, and signing is the reason most people install this,
# so it is a hard dependency here rather than an optdepend.
depends=('python' 'python-cryptography')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('ecd0ae76d2aa1ecefc892845ac6eca9fc9d6c763cbeb965819868c34e11a26cb')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "$_name-$pkgver"
	# The golden tests fetch Microsoft's reference packages; a build host has no
	# business reaching the network, and they skip themselves cleanly.
	OPENAPPX_NO_NETWORK=1 PYTHONPATH=src python -m pytest -q
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
