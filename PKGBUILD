# Maintainer: Magi3r <magier dot mit dot f3erball at gmail dot com>
pkgname=python-primp
_name=primp
pkgver=0.14.0
pkgrel=3
pkgdesc='HTTP client that can impersonate web browsers, mimicking their headers and `TLS/JA3/JA4/HTTP2` fingerprints'
arch=('x86_64' 'aarch64')
url=https://github.com/deedy5/primp
license=('MIT')
depends=('python')
makedepends=('git' 'cmake' 'python-maturin' 'python-build' 'python-installer' 'python-wheel' 'clang' 'mold')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('b6f23b2b694118a9d0443b3760698b90afb6f867f8447e71972530f48297992e')

build() {
	cd $_name-$pkgver
	export RUSTFLAGS="$RUSTFLAGS -Clink-arg=-fuse-ld=mold"
	python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
	cd $_name-$pkgver
}

package() {
	cd $_name-$pkgver
	python -m installer --destdir="$pkgdir" dist/*.whl

	# Symlink license file
	local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
	install -d "$pkgdir"/usr/share/licenses/$pkgname
	ln -s "$site_packages"/$_name-$pkgver.dist-info/LICENSE \
	   "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
