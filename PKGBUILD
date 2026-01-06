# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=pclink
_app_id=xyz.bytedz.PCLink
pkgver=3.2.0
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
  'python-pynput'
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
  'python-pyperclip: Fallback for clipboard support'
  'python-pystray: Fallback for system tray'
  'spectacle: Screenshot support on KDE Plasma'
  'wl-clipboard: Clipboard support on Wayland'
)
source=("PCLink-$pkgver.tar.gz::https://github.com/BYTEDz/PCLink/archive/refs/tags/v$pkgver.tar.gz"
         "$pkgname.1")
sha256sums=('213ee394ef64e54d14c728cf125aeca1fb78348a16a80a169e5f017f64348369'
            'a7d34dee7209e41a63e778e4de773a1b9699b170b5969d563b6eb8206eda91f9')

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
  install -Dm644 "assets/${pkgname}_icon.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/${_app_id}.svg"
  install -Dm644 "${_app_id}.desktop" -t "$pkgdir/usr/share/applications/"
  install -Dm644 "$srcdir/$pkgname.1" -t "$pkgdir/usr/share/man/man1/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
