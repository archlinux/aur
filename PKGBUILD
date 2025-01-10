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
_pkgname=cx_Freeze
pkgver=7.3.0.pre
pkgrel=1
pkgdesc='Create standalone executables from Python scripts'
arch=('x86_64')
url="https://marcelotduarte.github.io/$_pkgname"
license=('PSF-2.0')
depends=('glibc' 'patchelf' 'python' 'python-packaging' 'python-setuptools' 'python-filelock' 'python-pyqt6')
makedepends=('git' 'python-wheel' 'python-build' 'python-installer')
checkdepends=('python-pytest-mock' 'python-pytest-xdist' 'python-pytest-datafiles' 'python-pytest')
optdepends=('perl-alien-build: Alien support for rpm, dpkg, stampede slp, and slackware tgz file formats'
  'rpm-tools: RPM Package Manager RPM.org support')
replaces=('python-cx_freeze')
provides=('python-cx_freeze')
conflicts=('python-cx_freeze')
#source=("https://github.com/marcelotduarte/$_pkgname/archive/$pkgver/$pkgname-$pkgver.tar.gz")
_commit=10cea64a8efa3550cafabc3e312c2aae200e0e66
source=("git+https://github.com/marcelotduarte/cx_Freeze.git#commit=$_commit")
sha512sums=('ce5c42155d7a12ff16a127c1c42d4f5a6ef1182f37df1574416f781ebb556b7b9c244fcd150fa4982f8d45cefd87f5667682fae7bf7bbd6b582dda7d3bf7dde0')

build() {
  #cd "$_pkgname-$pkgver"
  cd "$_pkgname"
  export PYTHONNOUSERSITE=1 # Similar to Py_NoSiteFlag
  export PYTHONFROZEN=1     # Similar to Py_FrozenFlag
  export PYTHONPATH=""      # Control Python path
  _pyinclude=$(python -c "import os, sys; print(os.path.dirname(os.__file__))")
  export CFLAGS="$CFLAGS -Wno-implicit-function-declaration -Wno-int-conversion -I$_pyinclude"
  export CPPFLAGS="$CPPFLAGS -I$_pyinclude"
  python -m build --wheel --no-isolation
}

check() {
  echo "Removing the following directory for a clean install: $PWD/$_pkgname-$pkgver/test_dir"
  #rm -rf "$_pkgname-$pkgver"/test_dir
  rm -rf "$_pkgname"/test_dir
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  #cd "$_pkgname-$pkgver"
  cd "$_pkgname"
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="$PWD/test_dir/$site_packages:$PYTHONPATH"
  unset SOURCE_DATE_EPOCH # Workaround for 'FATAL ERROR:SOURCE_DATE_EPOCH' (see https://github.com/AppImage/AppImageKit/issues/1202)
  #pytest -vv -k 'not pandas and not deb and not rpm' # Since deb and rpm are optional, disable testing
  python -m pytest -k "not (test___main__ or test_cxfreeze or \
    test_cxfreeze_target_name_not_isidentifier or test_cxfreeze_deprecated_behavior or \
    test_cxfreeze_deprecated_option or test_cxfreeze_include_path or test_build or \
    test_build_exe or test_zip or test_excludes or test_install or test_install_pyproject or \
    test_executables or test_valid_icon or test_executable_rename or test_executable_namespace or \
    test_multiprocess or test_multiprocessing or test_ssl or test_tkinter or test_tz or \
    test_command_bdist or test_freezer or test_hooks_pandas)"
}

package() {
  #cd "$_pkgname-$pkgver"
  cd "$_pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
