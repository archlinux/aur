# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Arturo Penen <apenen@gmail.com>
_projectname='elasticsearch-py'
_pkgname='python-elasticsearch'
pkgname="${_pkgname}7.13"
pkgver='7.13.4'
pkgrel='3'
pkgdesc='Python client for Elasticsearch (legacy 7.13.* version - before the UnsupportedProductError check)'
arch=('any')
url="https://github.com/elastic/$_projectname"
license=('Apache-2.0')
provides=("$_pkgname=$pkgver" "${_pkgname}7=$pkgver")
conflicts=("$_pkgname" "${_pkgname}7")
depends=('python>=3.4.0' 'python-aiohttp>=3.0.0' 'python-certifi' 'python-requests>=2.4.0' 'python-urllib3>=1.21.1')
makedepends=('python-build' 'python-setuptools' 'python-installer' 'python-wheel')
checkdepends=('python-numpy' 'python-pandas' 'python-pytest' 'python-pytest-asyncio' 'python-yaml')
source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
	'fix-deprecations.diff'
	'remove-simplejson-dep.diff'
)
b2sums=('442190229084c39fcfdb20218cd8e2beb63789050fdf64da568c39b34779ee1c95ba7d90da7bd4a5795aa708e9d940f9e202dc8fb52eaef0d8c04b0a16aa754b'
        '0016df97ea4cf466f45b6a14f19d5cf1a17feacfff7adcfb99e73e8271c4a88ae6f143e618b80e7821d599344700f4b95ff4375c578a914858fda6d68dfa08a1'
        'cd23bf99eb188c92981c686d55d82feaf710e17905682b8d1bae6393298b3f881a7c9b15ae2d551ec80a07ba9e89051b4cd6a9af9733c9295bc9b682b45545d6')

_sourcedirectory="$_projectname-$pkgver"

prepare() {
	cd "$srcdir/$_sourcedirectory/"

	# Get rid of deprecated stuff
	patch --forward -p1 < "$srcdir/fix-deprecations.diff"

	# Get rid of simplejson, as it doesn't pass tests
	patch --forward -p1 < "$srcdir/remove-simplejson-dep.diff"
}

build() {
	cd "$srcdir/$_sourcedirectory/"
	python -m build --wheel --no-isolation
}

check() {
	cd "$srcdir/$_sourcedirectory/"

	# Run tests, but ignore tests that require a running server
	pytest --ignore test_elasticsearch/test_async/test_server/ --ignore test_elasticsearch/test_server/
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	python -m installer --destdir="$pkgdir" 'dist/'*'.whl'

	install -dm755 "$pkgdir/usr/share/doc/$pkgname/"
	install -Dm644 'README.rst' "$pkgdir/usr/share/doc/$pkgname/README.rst"
}
