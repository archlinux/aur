# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>

_pkgname=lupa
pkgname=python38-lupa
pkgver=1.13
pkgrel=1
pkgdesc='Python wrapper around Lua and LuaJIT'
arch=(x86_64)
url="https://github.com/scoder/$_pkgname"
license=(MIT)
depends=(lua python38)
makedepends=(python38-{build,installer,wheel}
             python38-setuptools)
_archive="$_pkgname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_archive.tar.gz")
sha256sums=('e1d94ac2a630d271027dac2c21d1428771d9ea9d4d88f15f20a7781340f02a4e')

prepare() {
	cd "$_archive"
	# --no-bundle is not removed from argv if lua is properly detected, so the
	# only working safety net is to rm the bundled sources
	rm -rf third-party
}

build() {
	cd "$_archive"
	python3.8 -m build -wn
}

check() {
	cd "$_archive"
	python3.8 setup.py test
}

package() {
	cd "$_archive"
	python3.8 -m installer -d "$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.txt
}
