# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=ruff-git
_pkg=ruff
pkgver=0.0.79.r0.gcf0d198
pkgrel=1
pkgdesc='Experimental Python linter written in Rust'
arch=('x86_64')
url="https://github.com/charliermarsh/ruff"
license=('MIT')
depends=('gcc-libs')
optdepends=('python>=3.7')
makedepends=('git' 'maturin' 'python-installer' 'python-wheel')
provides=('ruff')
conflicts=('ruff')
options=('!lto')
source=("$_pkg::git+$url")
sha256sums=('SKIP')

pkgver() {
	git -C "$_pkg" describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

prepare() {
	cd "$_pkg"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$_pkg"
	maturin build \
		--release \
		--strip \
		--locked \
		--target "$CARCH-unknown-linux-gnu" \
		--all-features
}

check() {
	cd "$_pkg"
	cargo test --frozen --all-features
}

package() {
	cd "$_pkg"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" target/wheels/*.whl
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s "$_site/${_pkg}-${pkgver%.r*}.dist-info/license_files/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
