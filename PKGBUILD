# Maintainer: David Runge <dvzrv@archlinux.org>

_name=cmsis_pack_manager
pkgname=python-cmsis-pack-manager
pkgver=0.5.0
pkgrel=1
pkgdesc="A Rust and Python module for handling CMSIS Pack files"
arch=(x86_64)
url="https://github.com/pyocd/cmsis-pack-manager"
license=(Apache)
depends=(python-appdirs python-cffi python-pyyaml)
makedepends=(maturin python-installer rust)
checkdepends=(python-hypothesis python-jinja python-pytest)
# disable LTO until ring can be built with it: https://github.com/briansmith/ring/issues/1444
options=(!lto debug)
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha512sums=('559374162a3dd9d6f457f0fbdce510c5459b76be87f17566c968827470a9b0c9a265e24cd963547fd36e8b8913b8bc94622f3b2bfcc16f1895af37cf8779e2ca')
b2sums=('ce3112a13433c7d12dbdc6cf27d61f260fbb9e90cc4572409aa8b02728b9ffbe17c378fea40a35c39c7d970b26f975105fe3bd6cd67e92d60fa9d4dff17172ab')

prepare() {
  cd $_name-$pkgver
  # python-milksnake is *not* a runtime dependency
  # https://github.com/pyocd/cmsis-pack-manager/issues/188
  sed '/milksnake/d' -i setup.cfg
}

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
