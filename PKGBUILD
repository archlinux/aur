# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Lari Tikkanen <lartza@wippies.com>

pkgname=python-irc3
_pkg=irc3
pkgver=1.1.9
pkgrel=1
pkgdesc="Plugable irc client library based on asyncio"
arch=('any')
url="https://github.com/gawel/irc3"
license=('MIT')
depends=('python-venusian' 'python-setuptools')
optdepends=('python-docopt: for the irc3 command')
makedepends=('python-build' 'python-installer' 'python-wheel')
checkdepends=(
	'python-aiocron'
	'python-docopt'
	'python-feedparser'
	'python-irc3-plugins-test'
	'python-pysocks'
	'python-pytest'
	'python-pytest-aiohttp'
	'python-pytest-asyncio'
	'python-redis'
	'python-requests'
	'python-twitter')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/i/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('cadadb9d23be42f7f6bf7ecb893c0b8b3fd9b1327cb0cbfea9af4dbbd44b26fd')

prepare() {
	cd "$_pkg-$pkgver"
	sed -i '/setup_requires/d' setup.py
}

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "$_pkg-$pkgver"
	pytest -x
}

package() {
	cd "$_pkg-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -dv "$pkgdir/usr/share/licenses/$pkgname/"
	ln -sv "$_site/$_pkg-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
