# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=grub-reboot-picker
_app_id=com.mendhak.grubrebootpicker
pkgver=0.0.10
pkgrel=1
pkgdesc="Tray application to reboot into different OSes or UEFI/BIOS"
arch=('any')
url="https://github.com/mendhak/grub-reboot-picker"
license=('MIT')
depends=(
  'grub'
  'gtk3'
  'libappindicator-gtk3'
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
#optdepends=('molly-guard')  ## Broken and out of date
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        'un-reboot.png')  # from Ubuntu update-notifier package
sha256sums=('f19c4b244d57fe6f48ee6c0c1dfae692d7e9c6bc9dd5d0201ffb7bede444f961'
            'd764a1b0722752b5166529838f29cfa5b708554d209fc4206e8f7f846e8a51cf')

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
  install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 "$srcdir/un-reboot.png" -t "$pkgdir/usr/share/icons/hicolor/48x48/apps/"
}
