# Maintainer: PhotonX <photon89 [at] gmail.com>.

pkgname=pdftl
pkgver=0.18.0
pkgrel=1
pkgdesc="CLI tool for PDF manipulation written in Python, intended to be a command-line compatible extension of pdftk."
arch=('any')
url='https://github.com/pdftl/pdftl'
license=('MPL-2.0')
depends=('python-pikepdf>=10.3.0' 'python-rich' 'python-defusedxml')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-setuptools-scm')
source=(
	"$pkgname-$pkgver.tar.gz"::"https://github.com/pdftl/pdftl/archive/refs/tags/v$pkgver.tar.gz"
)
sha256sums=('2733aa6eb04eee421ff4a7f08568ae57ddd058a37a7c7466ca40426fe53fdc03')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
	python -m build --wheel --no-isolation
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  rm -rf temp_install
  python -m installer --destdir="temp_install" dist/*.whl
  local _site_packages=( temp_install/usr/lib/python*/site-packages )
  PYTHONPATH="${_site_packages}" python -c "import pdftl"
}

package() {
	cd "$srcdir/$pkgname-$pkgver"	
	install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm 644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	python -m installer --compile-bytecode=1 --destdir="$pkgdir" dist/*.whl
}

