# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=grub-reboot-picker
_app_id=com.mendhak.grubrebootpicker
pkgver=0.0.12
pkgrel=1
pkgdesc="Tray application to reboot into different OSes or UEFI/BIOS"
arch=('any')
url="https://github.com/mendhak/grub-reboot-picker"
license=('MIT')
depends=(
  'grub'
  'gtk3'
  'libayatana-appindicator'
  'polkit'
  'python-cairo'
  'python-gobject'
  'systemd-sysvcompat'
)
makedepends=(
  'python-build'
  'python-hatchling'
  'python-installer'
  'python-wheel'
)
optdepends=('molly-guard')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('3fc383ae6fd1f9588db950d804fd50efd8b40ce284229dc13f1918b9b3d35198')

prepare() {
  cd "$pkgname-$pkgver"

  # sbin to bin
  find . -type f -exec sed -i 's|sbin|bin|g' {} \;
}

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir/usr/bin"
  ln -s "${site_packages}/$pkgname/$pkgname.py" "$pkgdir/usr/bin/$pkgname"

  install -Dm644 "${_app_id}.policy" -t "$pkgdir/usr/share/polkit-1/actions/"
  install -Dm644 "${_app_id}.desktop" -t "$pkgdir/etc/xdg/autostart/"
  install -Dm644 "${_app_id}.desktop" -t "$pkgdir/usr/share/applications/"
  install -Dm644 "assets/$pkgname.svg" -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/"
  install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"
}
