# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=ruff
pkgver=0.0.149
pkgrel=1
pkgdesc='Experimental Python linter written in Rust'
arch=('x86_64')
url="https://github.com/charliermarsh/ruff"
license=('MIT')
depends=('python>=3.7')
makedepends=('maturin' 'python-installer')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('be46985f8557c02830ef73c5f562acf799852ff57c1e7a8c9e4fe81872961e6a')

prepare() {
	cd "$pkgname-$pkgver"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$pkgname-$pkgver"
	maturin build \
		--release \
		--strip \
		--locked \
		--target "$CARCH-unknown-linux-gnu" \
		--all-features
}

check() {
	cd "$pkgname-$pkgver"
	cargo test --frozen --all-features
}

package() {
	cd "$pkgname-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" target/wheels/*.whl
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -dv "$pkgdir/usr/share/licenses/$pkgname/"
	ln -sv "$_site/$pkgname-$pkgver.dist-info/license_files/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
