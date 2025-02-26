# Maintainer: Neurognostic <neurognostic@astranetics.com>
_pipname=curl_cffi
_pkgname=python-${_pipname//_/-}
pkgname=$_pkgname-yt-dlp
pkgver=0.7.1
pkgrel=1
pkgdesc='Python FFI binding for curl-impersonate'
arch=(x86_64)
url='https://github.com/lexiforest/curl_cffi'
license=(MIT)
depends=(
	libcurl-impersonate-chrome
	python
	python-certifi
	python-cffi
	python-eventlet
	python-gevent
)
optdepends=('python-orjson: for speed and memory optimized JSON parsing')
makedepends=(
	gcc13
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
	'8a64b12432146a3f178c4792c91188c18f50cc4b76e908ffc3206442c4610894'
	'6dd99c11ea2ae2f392c5f15499a3bcf88c41fcbcabd461c589ae88edccffc5b9'
)
conflicts=($_pkgname)
provides=($_pkgname=$pkgver)

prepare() {
	patch -d $_pipname-$pkgver -p1 -i ../use-system-libs.patch
	cd $_pipname-$pkgver
	make preprocess
}

build() {
	cd $_pipname-$pkgver
	# TODO: remove gcc13 from makedepends when upstream gets resolved
	# https://github.com/lexiforest/curl_cffi/issues/473
	export CC=gcc-13 CXX=g++-13
	python -m build --wheel --no-isolation
}

package() {
	cd $_pipname-$pkgver
	python -m installer --destdir="$pkgdir" dist/*.whl

	# Symlink license file
	local site_packages=$(python -c 'import site;print(site.getsitepackages()[0])')
	install -d "$pkgdir/usr/share/licenses/$_pkgname"
	ln -s "$site_packages/$_pipname-$pkgver.dist-info/LICENSE" \
		"$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
