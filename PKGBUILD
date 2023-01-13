# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-kolo
_pkg="${pkgname#python-}"
pkgver=2.3.0
pkgrel=1
pkgdesc='See everything happening in your running Django app'
arch=('x86_64' 'aarch64')
url=https://kolo.app
license=('custom:Kolo')
depends=('python-cerberus' 'python-click' 'python-django' 'python-tomli' 'python-toolz' 'python-ulid-py')
makedepends=('cargo' 'maturin' 'python-installer')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/k/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('36199e196522e71679fca7ed50326ef5bb1b25fe8a8c4dc3d8c05a4a5d850526')

prepare() {
	cd "$_pkg-$pkgver/rust"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$_pkg-$pkgver"
	maturin build \
		--release \
		--strip \
		--locked \
		--all-features \
		--target "$CARCH-unknown-linux-gnu"
}

package() {
	cd "$_pkg-$pkgver"
	python -m installer --destdir="$pkgdir" rust/target/wheels/*.whl
}
