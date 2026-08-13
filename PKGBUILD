# Maintainer: gogamlg3
pkgname=tg-ws-proxy-git
_pkgname=tg-ws-proxy
pkgver=1.10.0.r0.gb2a8074
pkgrel=1
pkgdesc="Local MTProto proxy server for partial bypassing of Telegram loading"
arch=("any")
url="https://github.com/Flowseal/tg-ws-proxy"
license=("MIT")
depends=("python" "tk" "libappindicator" "libayatana-appindicator")
optdepends=("wl-clipboard" "xclip" "xsel")
makedepends=("git" "python" "python-pip" "imagemagick")
conflicts=("tg-ws-proxy-bin")

source=("$_pkgname::git+https://github.com/Flowseal/tg-ws-proxy.git"
        "tg-ws-proxy.desktop"
        "tg-ws-proxy.service")

sha256sums=("SKIP"
            "e06f5ca3f96bde84404610dbee8df3bdf1017fa350cd6e09831d30d820d21e93"
            "34263521bef49c289d3956fb513780950a6f319cb6d4b0222034d32ab929f05d")

_binname=tg-ws-proxy

pkgver() {
  cd "$_pkgname"
  # cutting off 'v' prefix that presents in the git tag
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}


build() {
  cd "$srcdir/$_pkgname"

  python -m venv --system-site-packages .venv
  .venv/bin/pip install --upgrade pip
  .venv/bin/pip install "."
  .venv/bin/pip install "pyinstaller"
  .venv/bin/pyinstaller --noconfirm packaging/linux.spec

  rm -rf .venv
}

package() {
  cd "$srcdir/$_pkgname"

  install -Dm755 "dist/TgWsProxy" "$pkgdir/usr/bin/$_binname"

  install -d "$pkgdir/usr/share/icons/hicolor/64x64/apps"
  magick "icon.ico[5]" -background none -alpha on "$pkgdir/usr/share/icons/hicolor/64x64/apps/tg-ws-proxy.png"

  install -Dm644 ../tg-ws-proxy.desktop "$pkgdir/usr/share/applications/tg-ws-proxy.desktop"
  install -Dm644 ../tg-ws-proxy.service "$pkgdir/usr/lib/systemd/system/tg-ws-proxy.service"

}
