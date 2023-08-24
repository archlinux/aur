# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Marko Korhonen <reekymarko at reekynet.com>

pkgname=python-yubico
_pkg="${pkgname#python-}"
pkgver=1.3.3
pkgrel=3
pkgdesc="Pure-python library for interacting with Yubikeys"
arch=('any')
url="https://github.com/Yubico/python-yubico"
license=('BSD')
depends=('python-pyusb')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-nose')
changelog=ChangeLog

source=("$pkgname-$pkgver.tar.gz::https://github.com/Yubico/python-yubico/releases/download/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz"
        "$pkgname-$pkgver.tar.gz.sig::https://github.com/Yubico/python-yubico/releases/download/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz.sig")
sha256sums=('d8466427aa5922ac5d4b7e9c65b693108427cf537d653d68cb212c0713e8e6f5'
            'SKIP')
validpgpkeys=('20EE325B86A81BCBD3E56798F04367096FBA95E8') ## Dain Nilsson

build() {
	cd "$pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "$pkgname-$pkgver"

	# Exclude tests that require a physical yubikey attached.
	nosetests3 -e test_challenge_response -e test_serial -e test_status
}

package() {
	cd "$pkgname-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s \
		"$_site/${pkgname/-/_}-$pkgver.dist-info/COPYING" \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
