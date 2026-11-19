# Maintainer: Joern <joernhofmann@web.de>
pkgname=tessera-deck
_pkgname=tessera
pkgver=1.2.4
pkgrel=1
pkgdesc='Host application (tray, USB host and editor) for the Tessera deck panel'
arch=('any')
url='https://github.com/catorendal-a11y/tessera-deck'
license=('MIT')
depends=('python' 'python-pyserial' 'python-psutil' 'python-textual' 'esptool'
         'python-pillow' 'python-pystray' 'python-keyring' 'python-jeepney'
         'python-xlib' 'xdotool' 'xclip')
makedepends=('python-pillow')
optdepends=('libpulse: volume, mute and mixer actions'
            'python-gobject: themed tray menu'
            'gtk3: themed tray menu'
            'tk: fallback tray menu'
            'librsvg: vector program icons'
            'gnome-keyring: secret storage for plugin passwords')
install=tessera-deck.install
source=("tessera-host-v${pkgver}.zip::${url}/releases/download/v${pkgver}/tessera-host-v${pkgver}.zip"
        'tessera-deck.sh'
        'tessera-deck.desktop')
sha256sums=('c5475f0730f32f93013e655e836d073a997fcc2eeaa3e73410f0dcba57d3715d'
            'SKIP'
            'SKIP')

package() {
  cd "$srcdir/${_pkgname}-v${pkgver}"
  local dest="$pkgdir/usr/share/tessera"

  install -d "$dest"
  cp -r host vendor plugins firmware "$dest/"
  install -Dm644 VERSION README.md CHANGELOG.md -t "$dest/"
  install -d "$dest/docs"
  install -m644 docs/*.md "$dest/docs/"
  echo "$pkgrel" > "$dest/.pkgrel"

  # Windows-only pieces and development leftovers
  rm -rf "$dest/host/platform_windows" "$dest/host/Enable-HWiNFO.ps1" "$dest/host/requirements.lock" "$dest/host/requirements.txt"
  find "$dest" -name __pycache__ -prune -exec rm -rf {} +
  find "$dest" -type d -exec chmod 755 {} +
  find "$dest" -type f -exec chmod 644 {} +

  install -Dm755 "$srcdir/tessera-deck.sh" "$pkgdir/usr/bin/tessera"
  install -Dm644 "$srcdir/tessera-deck.desktop" "$pkgdir/usr/share/applications/tessera.desktop"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  python -I - "host/tessera.ico" "$pkgdir/usr/share/icons/hicolor/256x256/apps/tessera.png" <<'PY'
import sys, os
from PIL import Image
im = Image.open(sys.argv[1])
sizes = im.info.get('sizes') or {im.size}
im.size = max(sizes)
os.makedirs(os.path.dirname(sys.argv[2]), exist_ok=True)
im.convert('RGBA').resize((256, 256)).save(sys.argv[2])
PY
}
