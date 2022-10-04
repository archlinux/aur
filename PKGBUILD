# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-deepl
pkgver=1.11.0
pkgrel=1
pkgdesc="DeepL language translation API"
arch=('any')
url="https://github.com/deeplcom/deepl-python"
license=('MIT')
depends=('python-requests')
makedepends=('git' 'python-poetry-core' 'python-build' 'python-installer')
install=deepl.install
changelog=CHANGELOG.md
source=("$pkgname::git+$url#tag=v$pkgver?signed"
        'remove-datafiles.patch')
sha256sums=('SKIP'
            'eea3f558773d785b607cde063fe148ed131442a834590b86a2f929b7602065f6')
validpgpkeys=('DBDC63E97C526204335805941FA7A782EC90634E') ## Daniel Jones

prepare() {
	patch -p1 -d "$pkgname" < remove-datafiles.patch
}

build() {
	cd "$pkgname"
	python -m build --wheel --no-isolation
}

## tests require a DeepL API key (paid account)

package() {
	cd "$pkgname"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s "$_site/deepl-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
