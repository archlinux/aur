# Maintainer: Magi3r <magier dot mit dot f3erball at gmail dot com>
# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=primp
pkgname=python-$_name
pkgver=0.15.0
pkgrel=1
pkgdesc='HTTP client that can impersonate web browsers, mimicking their headers and `TLS/JA3/JA4/HTTP2` fingerprints.'
arch=('x86_64' 'aarch64')
license=('MIT')
url='https://github.com/deedy5/primp'
depends=('python' 'glibc' 'gcc-libs')
makedepends=('python-maturin' 'python-build' 'python-installer' 'python-wheel' 'mold')
checkdepends=('python-certifi' 'python-pytest' 'python-pytest-asyncio')
options=(!strip lto)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('1af8ea4b15f57571ff7fc5e282a82c5eb69bc695e19b8ddeeda324397965b30a')

prepare(){
	cd "$srcdir"/$_name-$pkgver
	sed -i 's/t13d1516h2_8daaf6152771_b1ff8ab2d16f/t13d1516h2_8daaf6152771_02713d6af862/g' tests/test_client.py
	sed -i 's/t13d1716h2_5b57614c22b0_bed828528d07/t13d1716h2_5b57614c22b0_eeeea6562960/g' tests/test_defs.py
}

build(){
	cd "$srcdir"/$_name-$pkgver
	export RUSTFLAGS="$RUSTFLAGS -Clink-arg=-fuse-ld=mold"
	python -m build --wheel --no-isolation
}

check(){
	local pytest_options=(
		-vv
	)
	cd "$srcdir"/$_name-$pkgver
	python -m venv --system-site-packages test-env
	test-env/bin/python -m installer dist/*.whl
	test-env/bin/python -P -m pytest "${pytest_options[@]}" tests
}

package(){
	cd "$srcdir"/$_name-$pkgver
	python -m installer --destdir="$pkgdir" dist/*.whl

	# Symlink license file
	local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
	install -d "$pkgdir"/usr/share/licenses/$pkgname
	ln -s "$site_packages"/$_name-$pkgver.dist-info/licenses/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
