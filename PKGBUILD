# Maintainer: envolution
# Contributor: Self Denial <selfdenial@pm.me>
# Contributor: Brian Thompson <brianrobt@pm.me>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: Roberto Alsina <ralsina@kde.org>
# Contributor: Julien Duponchelle <julien@gns3.net>

pkgname=python-cx-freeze
pkgver=7.2.5
pkgrel=1
pkgdesc='Create standalone executables from Python scripts'
arch=('x86_64')
url='https://marcelotduarte.github.io/cx_Freeze'
license=('PSF-2.0')
depends=('glibc' 'patchelf' 'python' 'python-packaging' 'python-setuptools' 'python-filelock' 'python-pyqt6')
makedepends=('python-wheel' 'python-build' 'python-installer')
checkdepends=('python-pytest-mock' 'python-pytest-xdist' 'python-pytest-datafiles' 'python-pytest')
optdepends=('perl-alien-build: Alien support for rpm, dpkg, stampede slp, and slackware tgz file formats'
            'rpm-tools: RPM Package Manager RPM.org support')
replaces=('python-cx_freeze')
provides=('python-cx_freeze')
conflicts=('python-cx_freeze')
source=("https://github.com/marcelotduarte/cx_Freeze/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('a442084d1b25aba8bf536106b5da591cbb63297f88c2eeb79484f45ae5d288b166068817c29919af6d9ce7b5da2fd24be3f4678a0fef46863b69abe3ad27e281')

prepare() {
  sed -e 's|75|80|g' -i cx_Freeze-$pkgver/pyproject.toml # Support setuptools 75
  sed -e '/patchelf/d' -i cx_Freeze-$pkgver/pyproject.toml # don't require patchelf pip module
}

build() {
  cd cx_Freeze-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  echo "Removing the following directory for a clean install: $PWD/cx_Freeze-$pkgver/test_dir"
  rm -rf cx_Freeze-$pkgver/test_dir
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd cx_Freeze-$pkgver
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="$PWD/test_dir/$site_packages:$PYTHONPATH"
  unset SOURCE_DATE_EPOCH # Workaround for 'FATAL ERROR:SOURCE_DATE_EPOCH' (see https://github.com/AppImage/AppImageKit/issues/1202)
  pytest -vv -k 'not pandas and not deb and not rpm' # Since deb and rpm are optional, disable testing
}

package() {
  cd cx_Freeze-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
