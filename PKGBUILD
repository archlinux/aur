# Maintainer: Blair Bonnett (blair.bonnett@gmail.com)

pkgname=python-cf-units
pkgdesc='Units of measure from the CF Metadata Conventions'
pkgver=3.3.1
pkgrel=1
url='https://cf-units.readthedocs.io/'
arch=('x86_64')
license=('BSD-3-Clause')

depends=(
  glibc
  python-cftime
  python-jinja
  python-numpy
  udunits
)
makedepends=(
  cython
  git
  python-build
  python-installer
  python-setuptools
  python-setuptools-scm
)
checkdepends=(
  python-pytest
  python-tomli
)

_commit=26f7831
source=(
  "git+https://github.com/SciTools/cf-units.git?signed#commit=$_commit"
)
sha256sums=(
  '9f1a3c52c291c30827a418cae137a875c978fce754933d8f58f898b8a638a217'
)
validpgpkeys=(
  '968479A1AFF927E37D1A566BB5690EEEBB952194'  # GitHub signing key
)

build() {
  cd cf-units
  export UDUNITS2_XML_PATH='/usr/share/udunits/udunits2.xml'
  python -m build --no-isolation --wheel
}

check() {
  cd cf-units
  rm -rf test-env
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer "dist/cf_units-$pkgver"-*.whl

  local site_packages=$(test-env/bin/python -c 'import site; print(site.getsitepackages()[0])')
  cd "$site_packages/cf_units"
  "$srcdir"/cf-units/test-env/bin/python -m pytest
}

package() {
  cd cf-units
  python -m installer --destdir="$pkgdir" "dist/cf_units-$pkgver"-*.whl
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE

  # Remove tests from final package.
  local site_packages=$(python -c 'import site; print(site.getsitepackages()[0])')
  rm -r "$pkgdir/$site_packages/cf_units/tests"
}
