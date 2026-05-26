# Maintainer: Anntóin Wilkinson <anntoin@gmail.com>
pkgname=mansnip
_pkgname=llm-manpage-tool
pkgver=0.6.5
pkgrel=1
pkgdesc="The universal manual indexer"
arch=(any)
url="https://github.com/day50-dev/llm-manpage-tool"
license=('MIT')
depends=('python>=3.2')
makedepends=(python-build python-installer python-setuptools)
optdepends=('python-mcp: mcp server support')
source=("${_pkgname}-$pkgver.tar.gz::https://github.com/day50-dev/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("ad81a77a26b0977d8f42e9110a5f6c64847f5571e05a23f7831e87c909044045")

prepare() {
	cd "$_pkgname-$pkgver"
	sed -i "s/^version = \".*\"/version = \"$pkgver\"/" pyproject.toml
}

build() {
	cd "$_pkgname-$pkgver"
	python -m build --no-isolation
}

package() {
	cd "$_pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm755 mcp-server.py "$pkgdir/usr/bin/manpage-query"

	# mansnip is installed as a script, not a module, so import mansnip
	# fails. Copy it to site-packages so it can be imported.
	local site_packages
	site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
	install -Dm644 mansnip "$pkgdir$site_packages/mansnip.py"

	install -Dm644 LICENSE.MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
