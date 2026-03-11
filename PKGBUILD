# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=pclink
_app_id=xyz.bytedz.PCLink
pkgver=3.6.0
pkgrel=1
pkgdesc="Desktop app for secure remote PC control and management"
arch=('any')
url="https://bytedz.xyz/products/pclink"
license=('AGPL-3.0-or-later AND LicenseRef-custom')
depends=(
  'gtk3'
  'libayatana-appindicator'
  'libnotify'
  'playerctl'
  'python-click'
  'python-cryptography'
  'python-fastapi'
  'python-getmac'
  'python-gobject'
  'python-keyboard'
  'python-mss'
  'python-multipart'
  'python-packaging'
  'python-pefile'
  'python-pillow'
  'python-psutil'
  'python-pyautogui'
  'python-pydantic'
  'python-qrcode'
  'python-requests'
  'python-websockets'
  'python-wsproto'
  'python-yaml'
  'uvicorn'
  'xdg-desktop-portal'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
optdepends=(
  'grim: Screenshot support for wlroots-based compositors'
  'python-aiofiles: Improves upload performance with async file I/O'
  'python-pynput: Fallback for input control'
  'python-evdev: Input control on Wayland'
  'python-pyperclip: Fallback for clipboard support'
  'python-pystray: Fallback for system tray'
  'spectacle: Screenshot support on KDE Plasma'
  'wl-clipboard: Clipboard support on Wayland'
)
source=("PCLink-$pkgver.tar.gz::https://github.com/BYTEDz/PCLink/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('023dc9b8eda975705ab13bd22e9753c75394a9ff6b09acf8df3251993723a8b7')

build() {
  cd "PCLink-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "PCLink-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm755 "scripts/linux/$pkgname-power-wrapper" -t "$pkgdir/usr/bin/"
  install -Dm755 scripts/linux/test-power-permissions -t "$pkgdir/usr/bin/"
  install -dm750 "$pkgdir/etc/sudoers.d/"
  install -m440 "scripts/linux/$pkgname-sudoers" "$pkgdir/etc/sudoers.d/$pkgname"
  install -Dm644 "scripts/linux/$pkgname.service.template" \
    "$pkgdir/usr/lib/systemd/user/$pkgname.service"
  install -Dm644 scripts/linux/99-uinput.rules -t "$pkgdir/usr/lib/udev/rules.d/"
  install -Dm644 "assets/${pkgname}_icon.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/${_app_id}.svg"
  install -Dm644 "${_app_id}.desktop" -t "$pkgdir/usr/share/applications/"
  install -Dm644 "scripts/linux/$pkgname.1" -t "$pkgdir/usr/share/man/man1/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
