# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>

# Upstream tests are pretty borked, especially the PyPi sources. Skip for now.
BUILDENV+=(!check)

_pyname=fakeredis
pkgname=python38-fakeredis
pkgver=2.0.0
pkgrel=2
pkgdesc='Fake implementation of redis API (redis-py) for testing purposes'
arch=(any)
url="https://github.com/dsoftwareinc/${_pyname}-py"
license=(BSD MIT)
depends=(python38-importlib-metadata
         python38-redis
         python38-six
         python38-sortedcontainers)
makedepends=(python38-{build,installer,wheel}
             python38-packaging
             python38-lupa
             python38-poetry-core)
checkdepends=(python38-pytest
              python38-pytest-asyncio
              python38-pytest-mock
              python38-hypothesis)
optdepends=('python38-packaging: for aioredis support'
            'python38-lupa: for lua scripting support')
# _archive="$_pyname-py-$pkgver"
# source=("$url/archive/v$pkgver/$_archive.tar.gz")
_archive="$_pyname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_archive.tar.gz")
sha256sums=('6d1dc2417921b7ce56a80877afa390d6335a3154146f201a86e3a14417bdc79e')

build(){
	cd "$_archive"
	python3.8 -m build -wn
}

check() {
	cd "$_archive"
	PYTHONPATH="$PWD" pytest
}

package() {
	cd "$_archive"
	python3.8 -m installer -d "$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
