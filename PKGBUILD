# Maintainer: UnicornDarkness
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Artem Klevtsov <a.a.klevtsov@gmail com>

pkgname=afancontrol
pkgver=3.1.0
pkgrel=2
_pypi_hash="b4/6b/50d7cd7693c21f4fcb48e77a79bea4e6de550f35879bcaf0cc82515667cc"
pkgdesc="Advanced fan control daemon"
arch=('any')
url="https://github.com/KostyaEsmukov/afancontrol"
license=('MIT')
depends=('python-click')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest' 'python-requests' 'python-pyserial' 'python-prometheus_client')
optdepends=('lm_sensors: to use the motherboard-based sensors and PWM fans'
            'freeipmi: readonly PWM fans'
            'hddtemp: for measuring HDD/SSD temperatures'
            'python-pyserial: Arduino support'
            'python-prometheus_client: Prometheus support')
backup=("etc/$pkgname/$pkgname.conf")
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/$_pypi_hash/afancontrol-3.1.0.tar.gz"
        "$pkgname-$pkgver.tar.gz.asc::https://files.pythonhosted.org/packages/$_pypi_hash/afancontrol-3.1.0.tar.gz.asc"
        'MIT.txt')
sha256sums=('1403995a84a2ec880e36d36ca54c51e21e459e492b36b13437ceb5b792c7a46c'
            'SKIP'
            'cfbf3d258bc1990f8633f0751cf14515500938a6949ff413f6491dfe4b804d1a')
validpgpkeys=('A18FE9F6F570D5B4E1E1853FAA7B5406547AF062')

prepare() {
	cd "$pkgname-$pkgver"
	sed -i \
		-e '/etc\/afancontrol/d' \
		-e 's|etc/systemd|lib/systemd|g' setup.py
	sed -i 's|usr/local|usr|g' "pkg/$pkgname.conf"
}

build() {
	cd "$pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "$pkgname-$pkgver"
	PYTHONPATH="$PWD/src" pytest -x
}

package() {
	cd "$pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dvm644 "$srcdir/MIT.txt" -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dvm644 "pkg/$pkgname.conf" -t "$pkgdir/etc/$pkgname/"
}
