# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-pyevtx
_name=evtx
pkgver=0.7.3
pkgrel=1
pkgdesc="Python bindings for evtx"
arch=('x86_64')
url="https://github.com/omerbenamram/pyevtx-rs"
license=('MIT' 'Apache')
depends=('python')
makedepends=('maturin' 'python-installer')
# checkdepends=('python-pytest')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/e/$_name/$_name-$pkgver.tar.gz")
sha256sums=('321c6f4b39102d4d970e60eef8d07913321540cb524830962ecf61a8394cf71a')

prepare() {
	cd "$_name-$pkgver"
	cargo update
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$_name-$pkgver"
	maturin build --no-sdist --release --strip
}

# check() {
# 	cd "$_name-$pkgver"
# 	_ver="$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')"
# 	PYTHONPATH="$PWD/build/lib.linux-$CARCH-$_ver" pytest -x
# }

package() {
	cd "$_name-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" target/wheels/*.whl
}
