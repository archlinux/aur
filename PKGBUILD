# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Batuhan Baserdem <lastname dot firstname at gmail>

pkgname=maestral-git
pkgver=1.6.3.r0.g7b8e7a53
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
makedepends=('git' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-benchmark')
provides=("${pkgname%-git}=${pkgver%.r*}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url"
        'maestral@.service')
sha256sums=('SKIP'
            '79f48787cec441c252b1fcbecbce1342bbac1de275e90fe9dfbd1b9cad2ba2c8')

pkgver() {
	git -C "$pkgname" describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
	cd "$pkgname"
	python -m build --wheel --no-isolation
}

check() {
	cd "$pkgname"
	PYTHONPATH=src/ pytest -k 'not test_autostart' -x
}

package() {
	cd "$pkgname"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 "$srcdir/maestral@.service" -t "$pkgdir/usr/lib/systemd/user/"
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s \
		"$_site/maestral-${pkgver%.r*}.dist-info/LICENSE.txt" \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
