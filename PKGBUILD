# Maintainer: Gergely Meszaros <maetveis at gmail dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Payson Wallach <payson@paysonwallach.com>

# Contribute at https://gitlab.com/Maetveis/aur-packages

pkgname=python-persist-queue
_pkg="${pkgname#python-}"
pkgver=0.8.1
pkgrel=1
pkgdesc='Thread-safe disk-based persistent queue'
arch=('any')
url="https://github.com/peter-wangxu/persist-queue"
license=('BSD')
depends=('python')
optdepends=('python-msgpack: MessagePack serialization support'
			'python-cbor2: CBOR serialization support')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
# checkdepends=(
# 	'python-dbutils'
# 	'python-eventlet'
# 	'python-nose2'
# 	'python-msgpack'
# 	'python-mock'
# 	'python-pymysql')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('09bb473f0c0a3a333ef5225f19f638c58f912a3e947cba3317451f137e8a8143')

prepare() {
	cd "$_pkg-$pkgver"
	sed -i "/packages=find/c\packages=find_packages(exclude=('*tests*',))," setup.py
}

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

# check() {
# 	cd "persist-queue-$pkgver"
# 	nose2
# }

package() {
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s \
		"$_site/${_pkg/-/_}-$pkgver.dist-info/LICENSE" \
		"$pkgdir/usr/share/licenses/$pkgname/"
}
