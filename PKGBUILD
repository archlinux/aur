pkgname=pastelock
pkgver=0.3.1
pkgrel=1
pkgdesc="Encrypted clipboard manager with login, scrollable history and text/image paste storage"
arch=('any')
url="https://gitlab.com/E-Gamma-102/pastelock"
license=('custom')  # TODO: set to your real license and ship LICENSE
depends=(
  'python'
  'tk'
  'python-darkdetect'
  'python-packaging'
  'python-pillow'
  'python-pynput'
  'python-pyperclip'
  'python-requests'
  'python-screeninfo'
  'python-evdev'
  'python-xlib'
  'python-customtkinter'
  'python-ctkmessagebox'

)
makedepends=()
source=(
  "${pkgname}-${pkgver}.tar.gz::https://gitlab.com/E-Gamma-102/pastelock/-/archive/v${pkgver}/pastelock-v${pkgver}.tar.gz"
)
sha256sums=('4744930ce3871121eb58b7da484f6ea42007985a4302c83151237963ee886a2a')

build() {
  cd "${srcdir}/pastelock-v${pkgver}"
  python -m compileall .
}

package() {
  cd "${srcdir}/pastelock-v${pkgver}"

  install -d "$pkgdir/usr/lib/${pkgname}"
  cp -a . "$pkgdir/usr/lib/${pkgname}"

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/${pkgname}" <<'EOF'
#!/usr/bin/env bash
APP_DIR="/usr/lib/pastelock"
cd "$APP_DIR"
exec python run.py "$@"
EOF

  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/${pkgname}.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=PasteLock
Comment=Encrypted clipboard manager with login, scrollable history and text/image paste storage
Exec=pastelock
Terminal=false
Categories=Utility;
EOF

  if [[ -f LICENSE ]]; then
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
  fi
}
