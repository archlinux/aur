# Maintainer: Jonas Witschel <diabonas@archlinux.org>
pkgname=python38-proxy.py
_name=${pkgname#python38-}
pkgver=2.4.3
pkgrel=1
pkgdesc='Lightweight HTTP, HTTPS, HTTP2 and WebSockets proxy server'
arch=('any')
url='https://github.com/abhinavsingh/proxy.py'
license=('BSD')
depends=('python38')
makedepends=('python38-build' 'python38-installer' 'python38-setuptools-scm'
             'python38-setuptools-scm-git-archive' 'python38-wheel')
checkdepends=('python38-httpx' 'python38-pytest' 'python38-pytest-asyncio' 'python38-pytest-cov' 'python38-pytest-mock')
optdepends=('python38-httpx: Cloudflare DNS resolver plugin support'
            'python38-paramiko: proxy over SSH tunnel support')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
        "python38-proxy.py-2.4.0_fix-asyncio-deprecationwarning.patch::$url/commit/e0cc90d057b44ef506b88362d71f2c707db11db9.patch")
sha256sums=('6134e8f1282db1fd7fa1a4b7049e49307566851023b2ac312d9dd36e92f0c9b1'
            'e7e511215189c95d96f279fde344c4d7473b846f9c96a3fc0077985856e97bcc')

prepare() {
	cd "$_name-$pkgver"
	# Fix pytest-asyncio 0.17.0 DeprecationWarning (https://github.com/abhinavsingh/proxy.py/pull/998)
	patch --forward --strip=1 --input="$srcdir/python38-proxy.py-2.4.0_fix-asyncio-deprecationwarning.patch"
}

build() {
	cd "$_name-$pkgver"
	python3.8 -m build --wheel --no-isolation
}

check() {
	cd "$_name-$pkgver"
	pytest
}

package() {
	cd "$_name-$pkgver"
	python3.8 -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"

	# Remove entry point usr/bin/proxy to avoid conflict with libproxy (FS#73325)
	rm -r "$pkgdir/usr/bin"
}
