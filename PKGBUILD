pkgname=tg-ws-proxy
pkgver=1.10.1
pkgrel=1
pkgdesc="Telegram Desktop WebSocket Bridge Proxy"
arch=('any')
url="https://github.com/Flowseal/tg-ws-proxy"
license=('MIT')
depends=(
  'gtk3'
  'libayatana-appindicator'
  'python'
  'python-cryptography'
  'python-customtkinter'
  'python-gobject'
  'python-pillow'
  'python-psutil'
  'python-pyperclip'
  'python-pystray'
  'tk'
  'xdg-utils'
)
makedepends=(
  'git'
  'python-build'
  'python-hatchling'
  'python-installer'
  'python-wheel'
  'imagemagick'
)
optdepends=(
  'wl-clipboard: clipboard support on Wayland'
  'xclip: clipboard support on X11'
)
conflicts=('tg-ws-proxy-bin' 'tg-ws-proxy-cli' 'tg-ws-proxy-git')
source=(
  "${pkgname}-${pkgver}::git+${url}.git#tag=v${pkgver}"
  "${pkgname}.desktop"
  "${pkgname}.service"
)
b2sums=('SKIP' 'SKIP' 'SKIP')

build() {
  cd "${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -d "$pkgdir/usr/share/icons/hicolor/64x64/apps"
  magick icon.ico -background none -alpha on "$pkgdir/usr/share/icons/hicolor/64x64/apps/$pkgname.png"
  install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "$srcdir/$pkgname.service" "$pkgdir/usr/lib/systemd/user/$pkgname.service"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
