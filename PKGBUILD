# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=fowl
pkgver=25.9.0
pkgrel=1
pkgdesc='Forward over Wormhole: streams over magic-wormhole Dilation connections'
arch=(any)
url="https://pypi.org/project/$pkgname"
license=(MIT)
_pydeps=(attrs
         click
         humanize
         msgpack
         rich
         twisted)
depends=(magic-wormhole
         python
         "${_pydeps[@]/#/python-}")
makedepends=(python-{build,installer,wheel}
             python-hatchling)
checkdepends=(python-hypothesis
              python-magic-wormhole-mailbox-server
              python-pytest
              python-pytest-twisted)
_archive="${pkgname/-/_}-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$_archive.tar.gz")
sha256sums=('93795643212f1ece96f676a94cd4520a2c047a3f4bbb94948a93b1091afd8e6b')

build() {
	cd "$_archive"
	python -m build -wn
}

check() {
	cd "$_archive"
	export PYTHONPATH="$PWD/src"
	pytest
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
	install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" README.rst
}
