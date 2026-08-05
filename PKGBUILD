# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=vdu_controls
pkgver=2.6.8
pkgrel=1
pkgdesc="Visual Display Unit virtual control panel - a GUI front end to ddcutil"
arch=('any')
url="https://digitaltrails.github.io/vdu_controls"
license=('GPL-3.0-or-later')
depends=(
  'ddcutil'
  'hicolor-icon-theme'
  'noto-fonts'
  'python-pyqt6'
  'qt6-svg'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=('desktop-file-utils')
optdepends=(
  'brightnessctl: Laptop panel support'
  'ddcutil-service: D-Bus Interface for up to 10x faster response times.'
  'python-pyserial: If you wish to use a serial-port lux metering device'
  'python-pyudev: Laptop panel support'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/digitaltrails/vdu_controls/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1c52ff929fd02eda3e3c6e38439a58bb13afa818ff371f0bb2488f7a4d27cfb2')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname-$pkgver"
  desktop-file-validate "$pkgname.desktop"
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -Dm644 src/$pkgname/resources/icons/app/* -t \
      "${pkgdir}${site_packages}/$pkgname/resources/icons/app/"
  install -Dm644 "src/$pkgname/resources/docs/help.md" -t \
    "${pkgdir}${site_packages}/$pkgname/resources/docs/"

  install -Dm644 translations/* -t "$pkgdir/usr/share/$pkgname/translations/"
  install -Dm755 sample-scripts/* -t "$pkgdir/usr/share/$pkgname/sample-scripts/"
  install -Dm644 icons/* -t "$pkgdir/usr/share/$pkgname/icons/"
  install -Dm644 "docs/_build/man/$pkgname.1" -t "$pkgdir/usr/share/man/man1/"
  install -Dm644 "src/$pkgname/resources/icons/app/$pkgname.svg" -t \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/"
  install -Dm644 "$pkgname.desktop" -t "$pkgdir/usr/share/applications/"
}
