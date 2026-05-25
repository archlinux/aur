# Maintainer: Agil Mammadov <mammadovagil@tutamail.com>
# Contributor: Zhang Hua

pkgbase=python-nodejs-wheel
pkgname=(python-nodejs-wheel python-nodejs-wheel-binaries)
pkgver=24.15.0
pkgrel=1
pkgdesc="Unoffical Node.js wheels"
arch=("x86_64")
url="https://pypi.org/project/nodejs-wheel/"
license=("MIT")
depends=(python python-typing_extensions)
options=(!lto)
makedepends=(
    python-installer python-build python-scikit-build-core python-setuptools-scm python-wheel
    python-hatchling python-hatch-vcs python-pip)
source=(
    "$pkgbase-$pkgver.tar.gz::https://github.com/njzjz/nodejs-wheel/archive/refs/tags/v$pkgver.tar.gz"
)
sha256sums=('74f8deb98f468644f487e66506620bd9ce008db6214c9a4531512dbcf35bcf44')

# prepare() {
# 	cd "$srcdir/nodejs-wheel-$pkgver"
# 	sed -i 's/BUILD_COMMAND make -j.*/BUILD_COMMAND make -j8/' CMakeLists.txt
# }

build() {
	cd "$srcdir/nodejs-wheel-$pkgver"
	python -m build --wheel --no-isolation

	cd cmd
	sed -i "s/source = \"vcs\"/source = \"vcs\"\nfallback-version = \"$pkgver\"/" \
	pyproject.toml
	python -m build --wheel --no-isolation
}

package_python-nodejs-wheel-binaries() {
	depends+=(python-typing_extensions)

	cd "$srcdir/nodejs-wheel-$pkgver"
	python -m pip install --root="$pkgdir" --prefix=/usr --no-deps --no-build-isolation dist/*.whl
	rm -rf "$pkgdir"/usr/lib/python*/site-packages/*.dist-info/direct_url.json
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python-nodejs-wheel() {
	depends+=(python-nodejs-wheel-binaries)
	pkgdesc+=" (CLI tools)"
	conflicts=(nodejs npm)
	provides=(nodejs=$pkgver npm)

	cd "$srcdir/nodejs-wheel-$pkgver/cmd"
	python -m pip install --root="$pkgdir" --prefix=/usr --no-deps --no-build-isolation dist/*.whl
	rm -rf "$pkgdir"/usr/lib/python*/site-packages/*.dist-info/direct_url.json
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
