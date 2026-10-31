# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=certfan
pkgver=0.3.0
pkgrel=1
_tag=v$pkgver
_srcdir="certfan-$pkgver"
pkgdesc="Checks that every IP address behind a TLS hostname serves the same valid, not-about-to-expire certificate, with exit codes, JSON and Prometheus output"
arch=('any')
url="https://blackman99.github.io/certfan/"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-hatchling')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Blackman99/certfan/archive/refs/tags/$_tag.tar.gz")
sha256sums=('e7bf3244eca44bfe44e32547dbed14a4d58d55dae655556d3f96bda13d0f46dc')

build() {
	cd "$_srcdir"
	python -m build --wheel --no-isolation
}

check() {
	cd "$_srcdir"
	python -m installer --destdir=test_dir dist/*.whl
	local site_packages
	site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
	PYTHONPATH="$PWD/test_dir$site_packages" python -m pytest tests -v
}

package() {
	cd "$_srcdir"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
