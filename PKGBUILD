# Maintainer: thrasibule <guillaume.horel@gmail.com>
# Contributor: Karthik <kndevl@outlook.com>
# Contributor: Sean Enck <enckse@gmail.com>
# Contributor: Kevin Slagle <kjslag at gmail dot com>

pkgname=python-snakeviz
_pythonname=snakeviz
pkgver=2.2.0
pkgrel=1
pkgdesc='A viewer for Python profiling data'
arch=('any')
url="http://jiffyclub.github.io/snakeviz"
license=('BSD')
depends=('python' 'python-tornado')
source=("$_pythonname-$pkgver.tar.gz::https://github.com/jiffyclub/snakeviz/archive/v$pkgver.tar.gz")
makedepends=(python-build python-installer python-wheel)
checkdepends=(python-pytest python-requests)
options=(!emptydirs)
sha256sums=('511a86bbed85e4afc0de3599d62300fcc92138cd8d3aec176bef5b9fa4bfd380')

prepare() {
	cd "$_pythonname-$pkgver"
	cat <<- EOF >> pyproject.toml
	[tool.setuptools]
	packages= ["snakeviz"]
	EOF
}

build() {
  cd "$_pythonname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_pythonname-$pkgver/"
  python -m installer --destdir="$pkgdir/" dist/*.whl
  install -D -m 644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}

check() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  cd "$_pythonname-$pkgver"
  python -m installer --destdir="test_dir" dist/*.whl

  PATH="test_dir/usr/bin:$PATH" PYTHONPATH="test_dir/$site_packages" pytest -v tests
}
# vim:set ts=2 sw=2 et:
