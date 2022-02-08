# Maintainer: David Runge <dvzrv@archlinux.org>

_name=cmsis-pack-manager
pkgname=python-cmsis-pack-manager
pkgver=0.4.0
pkgrel=3
pkgdesc="A Rust and Python module for handling CMSIS Pack files"
arch=(x86_64)
url="https://github.com/pyocd/cmsis-pack-manager"
license=(Apache)
depends=(python-appdirs python-cffi python-yaml)
makedepends=(cargo python-setuptools-scm python-milksnake)
checkdepends=(python-hypothesis python-jinja python-mock python-pytest)
# disable LTO until ring can be built with it: https://github.com/briansmith/ring/issues/1444
options=(!lto)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('1855fa0297ab04638c3f6559033cac32cb51d6534380eb2dc1ca1f4ff10d8851e2aeff7b5b635b0e4894b2584f79b86f97dd78381c866284f2f915ebda0d3ff2')
b2sums=('1ccc16d56b4b0488a3f0d55445c82443b9045efb2ae041e5c17ea77748c09dde7114f2bd79bd6e2043346fd10b593463ed0be98c486e23113733e3a1a7458c1b')

prepare() {
  cd "$_name-$pkgver"
  # python-milksnake is *not* a runtime dependency
  # https://github.com/pyocd/cmsis-pack-manager/issues/188
  sed '/milksnake/d' -i setup.cfg
}

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

check() {
  local _py_ver=$(python3 -c "import sys; print(str(sys.version_info.major)+'.'+str(sys.version_info.minor))")

  cd "$_name-$pkgver"
  export PYTHONPATH="build/lib.linux-$CARCH-$_py_ver:$PYTHONPATH"
  pytest -v
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --optimize=1 --root="${pkgdir}"
}
