# Maintainer:
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=python-thaw
_name=${pkgname#python-}
pkgver=1.0.1
pkgrel=1
pkgdesc="Generates report showing where dependencies affect your project"
arch=('any')
url="https://github.com/kateapault/pip-thaw"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("https://pypi.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz"
        "https://github.com/kateapault/pip-thaw/raw/v$pkgver/LICENSE.txt")
sha256sums=('08784d4d4b3eed538090b9b094a45d63c7d5908bd88369d918be90b1bf2f9460'
            '5268e3d47d3de16127c98aea02116723155a0a52eb6fe50b9d9e7a1bb76d7e47')

build() {
	cd "$_name-$pkgver"
	python setup.py build
}

check() {
	cd "$_name-$pkgver"
	pytest tests/test_thaw.py
}

package() {
	cd "$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build

	local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
	rm -rf "$pkgdir/$site_packages/tests"

	install -Dm644 "$srcdir/LICENSE.txt" -t "$pkgdir/usr/share/licenses/$pkgname"
}
