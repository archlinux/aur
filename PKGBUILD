# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: pfm <vorticity at mail dot ru>

## python-twisted[tls] requires the following dependencies
## * python-pyopenssl
## * python-idna
## * python-service-identity

pkgname=python-txsni
pkgver=0.2.0
pkgrel=4
pkgdesc="Simple support for running a TLS server with Twisted"
arch=('any')
url="https://github.com/glyph/txsni"
license=('MIT')
depends=(
	'python-idna'
	'python-pyopenssl'
	'python-service-identity'
	'python-twisted')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/t/txsni/TxSNI-$pkgver.tar.gz"
        'LICENSE')
sha256sums=('bf16d221c84bf222434fde9d1f75329149bf6bf9da049855bddffbff2b7886e1'
            '2a41b4da4e95c95c4a9c09f87652f67cb92d7072316cc12fc16db1773976e5e3')

prepare() {
	cd "TxSNI-$pkgver"
	sed -i '/txsni.test/d' setup.py
}

build() {
	cd "TxSNI-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "TxSNI-$pkgver"
	pytest -x --disable-warnings
}

package() {
	export PYTHONHASHSEED=0
	cd "TxSNI-$pkgver"
	python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 "$srcdir/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
}
