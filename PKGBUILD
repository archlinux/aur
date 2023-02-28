# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-deepl
pkgver=1.14.0
pkgrel=1
pkgdesc="DeepL language translation API"
arch=('any')
url="https://github.com/deeplcom/deepl-python"
license=('MIT')
depends=('python-requests')
optdepends=('python-keyring')
makedepends=('git' 'python-poetry-core' 'python-build' 'python-installer')
install=deepl.install
changelog=CHANGELOG.md
source=("$pkgname::git+$url#tag=v$pkgver?signed"
        'remove-datafiles.patch')
sha256sums=('SKIP'
            '963de9fdb04134b7c698a2e440aa7f5fd870685673c5240ecfbb26455eff00b7')
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
	python -m installer --destdir="$pkgdir/" dist/*.whl
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -dv "$pkgdir/usr/share/licenses/$pkgname/"
	ln -sv "$_site/deepl-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
