# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Batuhan Baserdem <lastname dot firstname at gmail>

pkgname=maestral-git
pkgver=1.5.3.r1.gbf70c762
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
	'python-keyring'
	'python-keyrings-alt'
	'python-packaging'
	'python-pathspec'
	'python-pyro5'
	'python-requests'
	'python-sdnotify'
	'python-setuptools'
	'python-survey'
	'python-watchdog-git'
	'python-systemd')
optdepends=(
	'maestral-qt: Qt interface for the maestral daemon'
	'python-importlib-metadata: REQUIRED for python<3.8')
makedepends=('git' 'python-build' 'python-install' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-benchmark')
source=("$pkgname::git+$url"
        'maestral@.service')
sha256sums=('SKIP'
            '79f48787cec441c252b1fcbecbce1342bbac1de275e90fe9dfbd1b9cad2ba2c8')

pkgver() {
	git -C "$pkgname" describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
	cd "$pkgname"
	python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
	cd "$pkgname"
	PYTHONPATH=src/ pytest -k 'not test_autostart' -x
}

package() {
	export PYTHONHASHSEED=0
	cd "$pkgname"
	python -m install --optimize=1 --destdir="$pkgdir/" dist/*.whl
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "$srcdir/maestral@.service" -t "$pkgdir/usr/lib/systemd/user/"
}
