# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: Roberto Alsina <ralsina@kde.org>
# Contributor: Julien Duponchelle <julien@gns3.net>

pkgname=python-cx-freeze
pkgver=6.15.10
pkgrel=1
pkgdesc='Create standalone executables from Python scripts'
arch=('x86_64')
url='https://marcelotduarte.github.io/cx_Freeze'
license=('PSF')
depends=('glibc' 'patchelf' 'python' 'python-packaging' 'python-setuptools')
makedepends=('python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest-mock' 'python-bcrypt' 'python-cryptography' 'python-openpyxl'
              'python-pandas' 'python-pillow' 'python-pydantic' 'python-pytz' 'rpm-tools' 'python-pytest-xdist' 'python-pytest-datafiles')
replaces=('python-cx_freeze')
provides=('python-cx_freeze')
conflicts=('python-cx_freeze')
source=("https://github.com/marcelotduarte/cx_Freeze/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('e18823c106049a72180d99b7910986fc727f1301426a90028e39700b183436ffd3c8d060eef0587c7a07c5a67c54f2a8bf62764426e840d7dcd6e9fed7030b26')

prepare() {
  sed -e 's|69|70|g' -i cx_Freeze-$pkgver/pyproject.toml # Support setuptools 69
}

build() {
  cd cx_Freeze-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd cx_Freeze-$pkgver
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="$PWD/test_dir/$site_packages:$PYTHONPATH"
  pytest -vv
}

package() {
  cd cx_Freeze-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
