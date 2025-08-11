# Maintainer: Neurognostic <neurognostic@astranetics.com>
_pipname=curl_cffi
pkgname=python-${_pipname//_/-}
pkgver=0.13.0
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
	'62ecd90a382bd5023750e3606e0aa7cb1a3a8ba41c14270b8e5e149ebf72c5ca'
	'0c2270deefe140ec79166c78fdf9c05870b03e32f22f9e80e6c02ea5baebadaf'
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
