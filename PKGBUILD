# Maintainer: futpib <futpib@gmail.com>
_pipname=curl_cffi
pkgname=python-${_pipname//_/-}-git
pkgver=0.12.0b1.r2.g28c8871
pkgrel=1
pkgdesc='Python FFI binding for curl-impersonate (git version)'
arch=(x86_64)
url='https://github.com/lexiforest/curl_cffi'
license=(MIT)
depends=(
	libcurl-impersonate
	python
	python-certifi
	python-cffi
	python-typing_extensions
)
optdepends=(
	'python-orjson: for speed and memory optimized JSON parsing'
	'python-eventlet: for eventlet thread support'
	'python-gevent: for gevent thread support'
)
makedepends=(
	git
	python-build
	python-installer
	python-setuptools
	python-wheel
	python-python-multipart
	unzip
)
provides=(python-curl-cffi)
conflicts=(python-curl-cffi)
source=(
	$_pipname::git+$url.git
)
sha256sums=(
	'SKIP'
)

pkgver() {
	cd $_pipname
	git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd $_pipname
	make preprocess
	
	# Modify build script to use system libraries
	sed -i 's/libraries=get_curl_libraries()/libraries=["curl-impersonate"]/' scripts/build.py
	sed -i 's/extra_objects=get_curl_archives()/extra_objects=[]/' scripts/build.py
	sed -i 's/library_dirs=\[arch\["libdir"\]\]/library_dirs=[\"\/usr\/lib\"]/' scripts/build.py
	sed -i 's/^download_libcurl()$/# download_libcurl()/' scripts/build.py
}

build() {
	cd $_pipname
	python -m build --wheel --no-isolation
}

package() {
	cd $_pipname
	python -m installer --destdir="$pkgdir" dist/*.whl

	# Symlink license file
	local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
	install -d "$pkgdir"/usr/share/licenses/$pkgname
	ln -s "$site_packages"/${_pipname/-/_}-$pkgver.dist-info/LICENSE \
		"$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
