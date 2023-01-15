# Maintainer: David Runge <dvzrv@archlinux.org>

_name=cmsis_pack_manager
pkgname=python-cmsis-pack-manager
pkgver=0.5.1
pkgrel=1
pkgdesc="A Rust and Python module for handling CMSIS Pack files"
arch=(x86_64)
url="https://github.com/pyocd/cmsis-pack-manager"
license=(Apache)
depends=(python-appdirs python-cffi python-pyyaml)
makedepends=(maturin python-installer rust)
checkdepends=(python-hypothesis python-jinja python-pytest)
# disable LTO until ring can be built with it: https://github.com/briansmith/ring/issues/1444
options=(!lto)
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha512sums=('08c95b17c8fe21faf0940ea15b69de4fd5d15adfb6ef2c60cf6b086276bd89251eddbda8ad665fcba2e50b35c86fc3fe7224ef0b9efa6cace76eb3432f359f7b')
b2sums=('e0c0aed4c64e394c56c88f3accbf7e568d39dc3587c598923e2258ad9b18c3bd540547c89bcb283429244863556837f344fc77bbf1383ef3437a134f1f941769')

build() {
  cd $_name-$pkgver
  maturin build --release --strip
}

check() {
  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name-$pkgver
  python -m installer --destdir=test_dir target/wheels/*.whl
  export PYTHONPATH="test_dir/$_site_packages:$PYTHONPATH"
  pytest -vv
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" target/wheels/*.whl
}
