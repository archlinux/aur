# Maintainer: Neurognostic <neurognostic@astranetics.com>
_pipname=curl_cffi
pkgname=python-${_pipname//_/-}
pkgver=0.9.0
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
	libcurl-impersonate-chrome
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
	'4818e074b61cb209bd8d4d0d03783313d4773e6b51f8b815e25aad9cc146a7b7'
	'3d5c1695ec2663e1302e0990539acf8dd06100666e656fb9ba52c07709392577'
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
