# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=i8kgui
pkgver=0.8.4
pkgrel=1
pkgdesc="A Dell thermal management GUI to control fan speeds and monitor temperatures"
arch=('any')
url="https://github.com/razman786/i8kgui"
license=('GPL-3.0-or-later')
depends=('i8kutils' 'polkit' 'pyside6' 'python-psutil' 'python-py-cpuinfo')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=('cpupower-gui: change the CPU Governor'
            'dell-bios-fan-control-git: Disable BIOS fan control on some laptops'
            'libsmbios: BIOS thermal management modes'
            'python-undervolt: CPU undervolting support')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('56a7abf15fa3981a9564320d453781f0873d1c8f1c982da1c4b4debdf69ed1cc')

prepare() {
  cd "$pkgname-$pkgver"

  # Correct dell-bios-fan-control service path
  sed -i 's|etc/systemd|usr/lib/systemd|g' "$pkgname/${pkgname}_thermal_control"
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
