# Maintainer: Danny Waser (Waser Technologies) <waser@waser.tech>

pkgname=python38-setuptools
pkgver=65.4.0
pkgrel=1
epoch=1
pkgdesc="Easily download, build, install, upgrade, and uninstall Python packages"
arch=('any')
license=('PSF')
url="https://pypi.org/project/setuptools/"
depends=('python38-appdirs' 'python38-jaraco.text' 'python38-more-itertools' 'python38-ordered-set'
         'python38-packaging' 'python38-pyparsing' 'python38-tomli' 'python38-validate-pyproject')
makedepends=('git')
checkdepends=('python38-jaraco.envs' 'python38-jaraco.path' 'python38-mock' 'python38-pip' 'python38-pip-run'
              'python38-pytest-fixture-config' 'python38-pytest-virtualenv' 'python38-wheel'
              'python38-pytest-enabler' 'python38-pytest-mypy' 'python38-sphinx' 'python38-build'
              'python38-ini2toml' 'python38-tomli-w')
provides=('python38-distribute')
replaces=('python38-distribute')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pypa/setuptools/archive/v$pkgver.tar.gz"
        system-validate-pyproject.patch
        add-dependency.patch)
sha512sums=('9d956aee88c15214cae63579e2e434ccd77d2dbbbefca4907e5181e50d6fdd60e61521900d153e608369442295c55a65f66a62c42b962dbdd7772bf64b655f3d'
            '390fea2c575a0042054f51d33e629b04a48f832f0a4a2dd07d34e23cdf330c382dba0f54bfb7c8a6a253bb248a4940f2a789672f715e4dc2aeb395fa185cae7a'
            '4277c983f17db19b0e499ceff7b6e24aad4f7956ec282bb7f5148f6f44e4e35077bfdfa219cbc04f49f37d0b9dc9c3e3075db7a36dbdc30944e1bd28efad0e0b')

export SETUPTOOLS_INSTALL_WINDOWS_SPECIFIC_FILES=0

prepare() {
  cd setuptools-$pkgver

  patch -p1 -i ../system-validate-pyproject.patch

  rm -r {pkg_resources,setuptools}/{extern,_vendor} setuptools/config/_validate_pyproject

  # Upstream devendoring logic is badly broken, see:
  # https://bugs.archlinux.org/task/58670
  # https://github.com/pypa/pip/issues/5429
  # https://github.com/pypa/setuptools/issues/1383
  # The simplest fix is to simply rewrite import paths to use the canonical
  # location in the first place
  for _module in setuptools pkg_resources '' ; do
      find . -name \*.py -exec sed -i \
          -e 's/from '$_module.extern' import/import/' \
          -e 's/from '$_module.extern'\./from /' \
          -e 's/import '$_module.extern'\./import /' \
          -e "s/__import__('$_module.extern./__import__('/" \
          -e 's/from \.\.extern\./from /' \
          {} +
  done

  # Add the devendored dependencies into metadata of setuptools
  patch -p1 -i ../add-dependency.patch

  # Fix tests invoking python38-build
  sed -e 's/"-m", "build", "--wheel"/"-m", "build", "--wheel", "--no-isolation"/' \
      -e 's/"-m", "build", "--sdist"/"-m", "build", "--sdist", "--no-isolation"/' \
      -i setuptools/tests/fixtures.py

  # Remove post-release tag since we are using stable tags
  sed -e '/tag_build = .post/d' \
      -e '/tag_date = 1/d' \
      -i setup.cfg

  # Fix shebang
  sed -i -e "s|^#\!.*/usr/bin/env python|#!/usr/bin/env python3.8|" setuptools/command/easy_install.py
}

build() {
  cd setuptools-$pkgver
  python3.8 setup.py build
}

check() { (
  # Workaround UTF-8 tests by setting LC_CTYPE
  export LC_CTYPE=en_US.UTF-8

  # https://github.com/pypa/setuptools/pull/810
  export PYTHONDONTWRITEBYTECODE=1

  cd setuptools-$pkgver
  # 1: subtle difference introduced by devendoring
  # 2: pip failures related to devendoring, 
  PYTHONPATH="$PWD"/build/lib python3.8 -m pytest \
    --deselect setuptools/tests/config/test_apply_pyprojecttoml.py::test_apply_pyproject_equivalent_to_setupcfg \
    --deselect setuptools/tests/test_virtualenv.py
)}

package() {
  cd setuptools-$pkgver
  python3.8 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 --skip-build
}