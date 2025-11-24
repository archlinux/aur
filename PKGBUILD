# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=pclink
_app_id=xyz.bytedz.PCLink
pkgver=2.6.0
pkgrel=1
pkgdesc="Desktop app for secure remote PC control and management"
arch=('any')
url="https://bytedz.xyz/products/pclink"
license=('AGPL-3.0-or-later')
depends=(
  'libappindicator'
  'libnotify'
  'python-cryptography'
  'python-fastapi'
  'python-getmac'
  'python-gobject'
  'python-keyboard'
  'python-mss'
  'python-packaging'
  'python-pefile'
  'python-pillow'
  'python-psutil'
  'python-pyautogui'
  'python-pydantic'
  'python-pynput'
  'python-pyperclip'
  'python-requests'
  'python-websockets'
  'python-wsproto'
  'uvicorn'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
optdepends=(
  'python-aiofiles: Improves upload performance with async file I/O'
  'python-pystray: fallback for system tray'
)
source=("PCLink-$pkgver.tar.gz::https://github.com/BYTEDz/PCLink/archive/refs/tags/v$pkgver.tar.gz"
        "${_app_id}.desktop"
         "$pkgname.1")
sha256sums=('d4e5ab45cae3071f8b38828e2c71e1bd900ccc93658e815b94893f6d562be834'
            '7e5df0da74ea06cd786dcb46b63de9d4822b746fa1a2cca6b6e41f42b5e5322c'
            '25e48aaf46a06e432486d30dc6d95d7fdf12db0a55eaf60336a5d9efb4a32ce7')

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
  install -Dm644 "$srcdir/${_app_id}.desktop" -t "$pkgdir/usr/share/applications/"
  install -Dm644 "$srcdir/$pkgname.1" -t "$pkgdir/usr/share/man/man1/"
}
