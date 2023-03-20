# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Batuhan Baserdem <lastname dot firstname at gmail>

pkgname=maestral
pkgver=1.7.1
pkgrel=1
pkgdesc='Open-source Dropbox client'
arch=('any')
url="https://github.com/SamSchott/maestral"
license=('MIT')
depends=(
	'python-click'
	'python-desktop-notifier'
	'python-dropbox'
	'python-fasteners'
	'python-importlib-metadata'
	'python-keyring'
	'python-keyrings-alt'
	'python-packaging'
	'python-pathspec'
	'python-pyro5'
	'python-requests'
	'python-rich'
	'python-setuptools'
	'python-survey'
	'python-typing_extensions'
	'python-watchdog')
optdepends=('maestral-qt: Qt interface for the maestral daemon'
            'python-systemd: Syslog support')
makedepends=('python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-benchmark')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        'maestral@.service')
sha256sums=('428d425c9123493186fdedbe067d7915b056624215b121ed542e1f8eac2aa86b'
            '79f48787cec441c252b1fcbecbce1342bbac1de275e90fe9dfbd1b9cad2ba2c8')

build() {
	cd "$pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "$pkgname-$pkgver"
	PYTHONPATH=src/ pytest -k 'not test_autostart' -x --disable-warnings
}

package() {
	cd "$pkgname-$pkgver"
	python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dvm644 "$srcdir/maestral@.service" -t "$pkgdir/usr/lib/systemd/user/"
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -dv "$pkgdir/usr/share/licenses/$pkgname/"
	ln -sv "$_site/maestral-$pkgver.dist-info/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
