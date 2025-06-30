# Maintainer: Neurognostic <neurognostic@astranetics.com>
_pipname=curl_cffi
pkgname=python-${_pipname//_/-}
pkgver=0.11.4
pkgrel=1
pkgdesc='Python FFI binding for curl-impersonate'
arch=(x86_64)
url='https://github.com/lexiforest/curl_cffi'
license=(MIT)
depends=(
	libcurl-impersonate
	python
	python-certifi
	python-cffi
	python-eventlet
	python-gevent
	python-typing_extensions
)
optdepends=('python-orjson: for speed and memory optimized JSON parsing')
makedepends=(
	python-build
	python-installer
	python-setuptools
	python-wheel
	python-python-multipart
	unzip
)
source=(
	$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$_pipname-$pkgver.tar.gz
	use-system-libs.patch
)
sha256sums=(
	'064ecab44c0571aaf47ad18a97200130f9e05bf7668fe3a2ff8633276fcbbb3c'
	'0f2471e6168f62685b44bcc6d3f234bb959e3933bbaeb3429e2d2407220285a4'
)

prepare() {
	patch -d $_pipname-$pkgver -p1 -i ../use-system-libs.patch
	cd $_pipname-$pkgver
	make preprocess
}

build() {
	cd $_pipname-$pkgver
	python -m build --wheel --no-isolation
}

package() {
	cd $_pipname-$pkgver
	python -m installer --destdir="$pkgdir" dist/*.whl

	# Symlink license file
	local site_packages=$(python -c 'import site;print(site.getsitepackages()[0])')
	install -d "$pkgdir/usr/share/licenses/$pkgname"
	ln -s "$site_packages/$_pipname-$pkgver.dist-info/licenses/LICENSE" \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
