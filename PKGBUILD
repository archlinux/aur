# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pyocd
pkgname=python-pyocd
pkgver=0.34.3
pkgrel=1
pkgdesc="Programming and debugging Arm Cortex-M microcontrollers"
arch=(any)
url="https://github.com/pyocd/pyOCD"
license=(Apache)
depends=(
  python-capstone
  python-cmsis-pack-manager
  python-colorama
  python-intelhex
  python-intervaltree
  python-natsort
  python-prettytable
  python-pyelftools
  python-pylink-square
  python-pyusb
  python-pyyaml
  python-six
  python-typing-extensions
)
makedepends=(python-build python-installer python-setuptools python-setuptools-scm python-toml python-wheel)
checkdepends=(python-pytest python-typing-extensions)
optdepends=('python-setuptools: for plugin support')
provides=(pyocd)
conflicts=(pyocd)
replaces=(pyocd)
source=(
  https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz
  $pkgname-0.33.1-optional_libusb_package.patch
)
sha512sums=('f1ba67bc4ebdd3c3fefab462d647b65cc4f026f76752de6cd6c1042fe1857d29f4fd8cb348b9b98faf670b8e4d9d3a0a3750b0dcbbec532fd246c342f2af9308'
            'cbcf65ead4f72025c28e9d42e7947db9671c8de62a797dc27d1198dbdb164afe51b5cafb83224e5c0797b5ae6ea8a9f91080aae81f00934309645a47d0154eaf')
b2sums=('4a9563b10fa00c91f3cea4829154dc7f5f495a58fc50d8e4179c0ec4351454a23a4430cff95a18c476ea4dbf71ee8ab13ef5b0be616015d5ec300ee19d2348d8'
        'dfed46c4e852cf28029573acd49aef06e51a3280851111ebc40bd7110c1900f480e77ade970c9b4d5574e9966cab996014b503991fdb8879aa9113f9d8091edb')

prepare() {
  cd $_name-$pkgver

  # we remove the dependency for libusb-package, because it would vendor libusb
  # https://github.com/pyocd/pyOCD/issues/1331
  sed '/libusb-package/d' -i setup.cfg
  patch -Np1 -i ../$pkgname-0.33.1-optional_libusb_package.patch

  # tag devices with uaccess to automatically make them available to active user sessions
  sed -e 's|MODE:="666"|MODE:="0660", TAG+="uaccess"|g' -i udev/*{cmsis,pico}*.rules
  sed -e 's|MODE:="0666"|MODE:="0660", TAG+="uaccess"|g' -i udev/*stlink*.rules
}

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name-$pkgver
  # install to temporary location
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="test_dir/$_site_packages:$PYTHONPATH"
  pytest -vv
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -vDm 644 udev/*.rules -t "$pkgdir/usr/lib/udev/rules.d/"
}
