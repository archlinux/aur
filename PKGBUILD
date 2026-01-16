# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=android-tv-remote
_app_id="io.github.erenseymen.$pkgname"
pkgver=1.1.2
pkgrel=1
_scrcpy_ver=3.3.4
pkgdesc="A GTK-based remote control for Android TV devices"
arch=('any')
url="https://github.com/erenseymen/android-tv-remote"
license=('GPL-3.0-or-later')
depends=(
  'gtk4'
  'libadwaita'
  'python-adb-shell'
  'python-gobject'
  'python-psutil'
  'python-pyasn1'
  'python-rsa'
  'scrcpy'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ba26d00da62b1813cabcfb8bb3edfe63e7537146fb7f59ba53a675e97bc9270a')

prepare() {
  cd "$pkgname-$pkgver"

  # Don't compile schemas
  sed -i "/'install': PostInstallCommand/d" setup.py

  # Fix icon location
  sed -i "s|../../../data/icons/material|/usr/share/${_app_id}/icons/material|g" \
    src/gnome_adb_tv_remote/ui/ui_utils.py

  # Match scrcpy-server version with system scrcpy package version
  sed -i "s/3.1/"${_scrcpy_ver}"/g" \
    src/gnome_adb_tv_remote/core/scrcpy_controller.py
}

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname-$pkgver"
  appstreamcli validate --no-net "data/${_app_id}.metainfo.xml"
  desktop-file-validate "data/${_app_id}.desktop"
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
