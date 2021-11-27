# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Batuhan Baserdem <lastname dot firstname at gmail>

pkgname=maestral
pkgver=1.5.2
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
makedepends=('python-setuptools' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-benchmark')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        'maestral@.service')
sha256sums=('e0746b1860def3758e5a3688ab7c03230d0bac8f0a984badffa915f2fcee42b5'
            '79f48787cec441c252b1fcbecbce1342bbac1de275e90fe9dfbd1b9cad2ba2c8')

prepare() {
	cd "$pkgname-$pkgver"
	sed -i '/watchdog/c\"watchdog>=2.0.1",' setup.py
}

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

check() {
	cd "$pkgname-$pkgver"
	PYTHONPATH=src/ pytest -k 'not test_autostart' -x
}

package() {
	cd "$pkgname-$pkgver"
	PYTHONHASHSEED=0 python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "$srcdir/maestral@.service" -t "$pkgdir/usr/lib/systemd/user/"
}
