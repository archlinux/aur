# Maintainer: Neurognostic <neurognostic@astranetics.com>
_pipname=curl_cffi
pkgname=python-${_pipname//_/-}
pkgver=0.10.0
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
	python-typing_extensions
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
	'3e37b35268ca58492f54ed020ae4b50c33ee0debad4145db9f746f04ed466eb0'
	'2adbc4bfcca05d1c0a41a2e2ed7a9b33353164b05ac8e50b42d3a26662c8e11a'
)

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
	install -d "$pkgdir/usr/share/licenses/$pkgname"
	ln -s "$site_packages/$_pipname-$pkgver.dist-info/LICENSE" \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
