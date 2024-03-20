# Maintainer:
# Contributor: Jonas Witschel <diabonas@archlinux.org>

pkgname=python-matrix-nio
pkgver=0.24.0
pkgrel=1
pkgdesc='Python Matrix client library, designed according to sans I/O principles'
arch=('any')
url='https://github.com/poljar/matrix-nio'
license=('ISC')
depends=('python' 'python-aiofiles' 'python-aiohttp' 'python-aiohttp-socks' 'python-h11'
         'python-h2' 'python-jsonschema' 'python-pycryptodome' 'python-unpaddedbase64')
makedepends=('git' 'python-build' 'python-installer' 'python-poetry-core')
checkdepends=('python-aioresponses' 'python-atomicwrites' 'python-cachetools' 'python-faker' 'python-hpack'
              'python-hyperframe' 'python-hypothesis' 'python-olm' 'python-peewee' 'python-pytest'
              'python-pytest-aiohttp' 'python-pytest-asyncio' 'python-pytest-benchmark' 'python-setuptools')
optdepends=('python-atomicwrites: end-to-end encryption support'
            'python-cachetools: end-to-end encryption support'
            'python-peewee: end-to-end encryption support'
            'python-olm: end-to-end encryption support')
source=("git+$url.git?signed#tag=$pkgver")
sha512sums=('SKIP')
validpgpkeys=('689A3B5BC6560AB4C99A2A0581314DA807EF4E22'  # Damir Jelić (poljar) <poljar@termina.org.uk>
              'D0CB3DB01DEF8CA2F4C9C4E308D39021F6D6A7B8') # Paarth Shah <mail@shahpaarth.com>

pkgver() {
	cd "${pkgname#python-}"
	git describe | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
}

prepare() {
	cd "${pkgname#python-}"
	# Remove unnecessary dependency version pinning
	sed -i 's/= "^[0-9.]*"/= "*"/' pyproject.toml
}

build() {
	cd "${pkgname#python-}"
	python -m build --wheel --no-isolation
}

check() {
	cd "${pkgname#python-}"
	python -m pytest
}

package() {
	cd "${pkgname#python-}"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
