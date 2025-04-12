# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>
# Contributor: Slithery <aur at slithery dot uk>

pkgname=python-linode_api4-git
epoch=1
pkgver=5.18.0.r78.gcf04ca6
pkgrel=1
pkgdesc="Bindings for the Linode API v4"
arch=('any')
url="https://github.com/linode/linode_api4-python"
license=('BSD-3-Clause')
depends=(
	'python'
	'python-requests'
	'python-polling'
	'python-deprecated'
)
makedepends=(
	'git'
	'python-build'
	'python-installer'
	'python-wheel'
	'python-setuptools'
)
checkdepends=(
	'python-pytest'
	'python-mock'
	'python-httpretty'
)
provides=('python-linode_api4' 'python-linode-api')
conflicts=('python-linode_api4' 'python-linode-api')
source=("git+https://github.com/linode/linode_api4-python#branch=dev")
sha256sums=('SKIP')

pkgver() {
	cd linode_api4-python
	git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
	cd linode_api4-python
	python -m build --wheel --no-isolation
}

check() {
	cd linode_api4-python
	python -m pytest test/unit
}

package() {
	cd linode_api4-python
	python -m installer --destdir="$pkgdir" dist/*.whl

	install -dm755 "$pkgdir/usr/share/doc/$pkgname"
	mv "$pkgdir"/usr/lib/python*/site-packages/examples \
		-t "$pkgdir/usr/share/doc/$pkgname"

	install -Dm644 LICENSE \
		-t "$pkgdir/usr/share/licenses/$pkgname"
}
