# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pyocd
pkgname=python-pyocd
pkgver=0.33.1
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
makedepends=(python-setuptools python-setuptools-scm python-toml python-wheel)
checkdepends=(python-pytest python-typing-extensions)
provides=(pyocd)
conflicts=(pyocd)
replaces=(pyocd)
source=(
  "https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz"
  $pkgname-0.33.1-optional_libusb_package.patch
  $pkgname-0.33.1-support_prettytable3.patch
)
sha512sums=('52acb68a5e938509df25d79b12af4374cbc98a4beb7771d039fa9de31ebb779bf098398c311ed96ddf7f38ee1b29e5eb1cdc950ad458a86187185cef1e7d12d5'
            'cbcf65ead4f72025c28e9d42e7947db9671c8de62a797dc27d1198dbdb164afe51b5cafb83224e5c0797b5ae6ea8a9f91080aae81f00934309645a47d0154eaf'
            '196bd3ad3718baf881ab3ca30d7e135be180e1185ccbc0e8f854a5754d5bf53d048985f970cbe943fb02228e82c0d07e56d74ddb28b72b078bdb997464b3d35c')
b2sums=('2dfefd23fef60bc667de095781e071afcfd93299792473a19b9f508ee856ae1dfd0ff7be075ddcddae79717424134b4b30a0ec224a174397ba3303952cfa0cc0'
        'dfed46c4e852cf28029573acd49aef06e51a3280851111ebc40bd7110c1900f480e77ade970c9b4d5574e9966cab996014b503991fdb8879aa9113f9d8091edb'
        '4447a64d11b4cb480762d323681c08b3f5e0d8e50f2b776faf6a53ed69eb3b492973146d837a310b272e7aac9578c7e54e641100229d8df783ee6179b30857ba')

prepare() {
  cd $_name-$pkgver
  # support prettytable >= 3.0: https://github.com/pyocd/pyOCD/pull/1330
  patch -Np1 -i ../$pkgname-0.33.1-support_prettytable3.patch

  # python-pyocd-pemicro drags in obfuscated prebuilt shared objects via python-pypemicro:
  # https://github.com/NXPmicro/pypemicro/issues/10
  # https://github.com/pyocd/pyOCD/issues/1319
  sed '/pyocd_pemicro/d' -i setup.cfg

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
  python setup.py build
}

check() {
  cd $_name-$pkgver
  export PYTHONPATH="build:$PYTHONPATH"
  # do not run tests that would require packaging python-elapsedtimer
  # https://github.com/pyocd/pyOCD/issues/1333
  pytest -v --ignore test/unit/test_semihosting.py
}

package() {
  cd $_name-$pkgver
  python setup.py install --optimize=1 --root="$pkgdir"
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -vDm 644 udev/*.rules -t "$pkgdir/usr/lib/udev/rules.d/"
}
