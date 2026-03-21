# Maintainer: gogamlg3
pkgname=tg-ws-proxy-git
pkgver=1.2.0
pkgrel=1
pkgdesc="Local SOCKS5 proxy server for partial bypassing of Telegram loading"
arch=("x86_64")
url="https://github.com/Flowseal/tg-ws-proxy"
license=("MIT")
depends=("python" "tk" "libappindicator" "libayatana-appindicator")
optdepends=("wl-clipboard" "xclip" "xsel")
makedepends=("python" "python-pip" "imagemagick")
conflicts=("tg-ws-proxy-bin")

source=("git+https://github.com/Flowseal/tg-ws-proxy.git"
        "tg-ws-proxy.desktop")
sha256sums=("SKIP" "SKIP")

_binname=tg-ws-proxy

build() {
  cd "$srcdir/tg-ws-proxy"

  python -m venv --system-site-packages .venv
  .venv/bin/pip install --upgrade pip
  .venv/bin/pip install ".[linux]"
  .venv/bin/pip install "pyinstaller"
  .venv/bin/pyinstaller --noconfirm packaging/linux.spec

  rm -rf .venv
}

package() {
  cd "$srcdir/tg-ws-proxy"

  install -Dm755 "dist/TgWsProxy" "$pkgdir/usr/bin/$_binname"

  install -d "$pkgdir/usr/share/icons/hicolor/64x64/apps"
  magick "icon.ico[4]" -background none -alpha on "$pkgdir/usr/share/icons/hicolor/64x64/apps/tg-ws-proxy.png"

  install -Dm644 ../tg-ws-proxy.desktop "$pkgdir/usr/share/applications/tg-ws-proxy.desktop"

}
