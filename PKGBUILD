# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Batuhan Baserdem <lastname dot firstname at gmail>

pkgname=maestral
pkgver=1.5.1
pkgrel=1
pkgdesc='Open-source Dropbox client'
arch=('any')
url="https://github.com/SamSchott/maestral"
license=('MIT')
depends=(
	'python>=3.6'
	'python-click>=8.0.0'
	'python-desktop-notifier>=3.3.0'
	'python-dropbox>=10.9.0'        'python-dropbox<12.0'
	'python-fasteners>=0.15'
	'python-keyring>=22'
	'python-keyrings-alt>=3.1.0'
	'python-packaging'
	'python-pathspec>=0.5.8'
	'python-pyro5>=5.10'
	'python-requests>=2.16.2'
	'python-sdnotify>=0.3.2'
	'python-setuptools'
	'python-survey>=3.4.3'          'python-survey<4.0'
	'python-watchdog-git'
	'python-systemd')
optdepends=(
	'maestral-qt: Qt interface for the maestral daemon'
	'python-importlib-metadata: REQUIRED for python<3.8')
makedepends=('python-setuptools' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-benchmark')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        'maestral@.service')
sha256sums=('a239110c54448d88742a0b23f29cf4d4f8c5569ade9e6c081f3ff5e338c48ac0'
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
	install -Dm 644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm 644 "$srcdir/maestral@.service" -t "$pkgdir/usr/lib/systemd/user/"
}
