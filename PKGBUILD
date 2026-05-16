# Maintainer: gogamlg3
pkgname=tg-ws-proxy-git
pkgver=1.7.0
pkgrel=1
pkgdesc="Local MTProto proxy server for partial bypassing of Telegram loading"
arch=("x86_64")
url="https://github.com/Flowseal/tg-ws-proxy"
license=("MIT")
depends=("python" "tk" "libappindicator" "libayatana-appindicator")
optdepends=("wl-clipboard" "xclip" "xsel")
makedepends=("python" "python-pip" "imagemagick")
conflicts=("tg-ws-proxy-bin")

source=("https://github.com/Flowseal/tg-ws-proxy/archive/refs/tags/v$pkgver.tar.gz"
        "tg-ws-proxy.desktop"
        "tg-ws-proxy.service")

sha256sums=("6ad18132d6c938fa8747f483b9323395332b56849e1af14e94089552a7d897f6"
            "e06f5ca3f96bde84404610dbee8df3bdf1017fa350cd6e09831d30d820d21e93"
            "34263521bef49c289d3956fb513780950a6f319cb6d4b0222034d32ab929f05d")

_binname=tg-ws-proxy

build() {
  cd "$srcdir/tg-ws-proxy-$pkgver"

  python -m venv --system-site-packages .venv
  .venv/bin/pip install --upgrade pip
  .venv/bin/pip install "."
  .venv/bin/pip install "pyinstaller"
  .venv/bin/pyinstaller --noconfirm packaging/linux.spec

  rm -rf .venv
}

package() {
  cd "$srcdir/tg-ws-proxy-$pkgver"

  install -Dm755 "dist/TgWsProxy" "$pkgdir/usr/bin/$_binname"

  install -d "$pkgdir/usr/share/icons/hicolor/64x64/apps"
  magick "icon.ico" -background none -alpha on "$pkgdir/usr/share/icons/hicolor/64x64/apps/tg-ws-proxy.png"

  install -Dm644 ../tg-ws-proxy.desktop "$pkgdir/usr/share/applications/tg-ws-proxy.desktop"
  install -Dm644 ../tg-ws-proxy.service "$pkgdir/usr/lib/systemd/system/tg-ws-proxy.service"

}
