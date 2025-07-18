# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=i8kgui
pkgver=0.8.4
pkgrel=2
pkgdesc="A Dell thermal management GUI to control fan speeds and monitor temperatures"
arch=('any')
url="https://github.com/razman786/i8kgui"
license=('GPL-3.0-or-later')
depends=(
  'i8kutils'
  'polkit'
  'pyside6'
  'python-psutil'
  'python-py-cpuinfo'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
optdepends=(
  'cpupower-gui: change the CPU Governor'
  'dell-bios-fan-control-git: Disable BIOS fan control on some laptops'
  'libsmbios: BIOS thermal management modes'
  'python-undervolt: CPU undervolting support'
)
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "$pkgname.patch")
sha256sums=('56a7abf15fa3981a9564320d453781f0873d1c8f1c982da1c4b4debdf69ed1cc'
            '34473bfb2ab37a0ae4182119d255cae9c993d35ab907884fbd43631e5afc616e')

prepare() {
  cd "$pkgname-$pkgver"

  # Correct paths
  patch -Np1 -i ../"$pkgname.patch"
}

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 i8kmon_sample_conf/i8kmon.conf \
    "$pkgdir/usr/share/doc/$pkgname/i8kmon_sample.conf"
}
