# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: Roberto Alsina <ralsina@kde.org>
# Contributor: Julien Duponchelle <julien@gns3.net>

pkgname=python-cx-freeze
pkgver=6.11
pkgrel=1
pkgdesc='Create standalone executables from Python scripts'
arch=('x86_64')
url='https://marcelotduarte.github.io/cx_Freeze'
license=('PSF')
depends=('patchelf' 'python-packaging' 'python-setuptools')
checkdepends=('python-pytest-mock' 'python-bcrypt' 'python-cryptography' 'python-openpyxl'
              'python-pandas' 'python-pillow' 'python-pydantic' 'python-pytz')
replaces=('python-cx_freeze')
provides=('python-cx_freeze')
conflicts=('python-cx_freeze')
source=("https://github.com/marcelotduarte/cx_Freeze/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('96dc0f5e0be45f737fa4833d99216ed35150839a60ec24518838f871fdd7eeac5eac739490dac7f2da82decf7278b1c35597a80efa7ef4d47bd9b98a0c89b5e4')

prepare() {
  cd cx_Freeze-$pkgver
  sed -i 's|setuptools>=59.0.1,<=60.10.0|setuptools>=59.0.1|' setup.cfg
}

build() {
  cd cx_Freeze-$pkgver
  python setup.py build
}

check() {
  cd cx_Freeze-$pkgver
  python setup.py egg_info
  # TODO
  PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-310" python -m pytest --deselect tests/test_bdist_rpm.py::test_bdist_rpm
}

package() {
  cd cx_Freeze-$pkgver
  python setup.py install --root "$pkgdir" --optimize 1 --skip-build
}
