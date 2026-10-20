# Maintainer: Smoolak <smoolak@gmail.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Philip Goto <philip.goto@gmail.com>

pkgname=python-codetiming
pkgver=1.4.0
pkgrel=1
pkgdesc="Flexible, customizable timer for your Python code"
license=('MIT')
arch=('any')
url='https://github.com/realpython/codetiming'
depends=('python')
makedepends=('git' 'python-flit-core' 'python-build' 'python-installer')
checkdepends=('python-pytest')
changelog=CHANGELOG.md
source=('source::git+https://github.com/realpython/codetiming.git#commit=bb707ca838799c8308ff6679f647c35965132baf')
sha256sums=('SKIP')

prepare() {
	cd source
	# Flit 4 supports this metadata; retain the lower bound and dependency checks.
	sed -i 's/flit_core >=3.2,<4/flit_core >=3.2,<5/' pyproject.toml
}

build() {
	cd source
	python -m build --wheel --no-isolation
}

check() {
	cd source
	local _site
	_site=$(python -c 'import sysconfig; print(sysconfig.get_path("purelib"))')
	python -m installer --destdir="$srcdir/check-root" dist/*.whl
	mkdir -p "$srcdir/test-run"
	cp -a tests pyproject.toml "$srcdir/test-run/"
	cd "$srcdir/test-run"
	PYTHONPATH="$srcdir/check-root$_site" \
		python -m pytest --import-mode=importlib -o addopts='' -q tests
}

package() {
	cd source
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 README.md AUTHORS.md -t "$pkgdir/usr/share/doc/$pkgname/"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
