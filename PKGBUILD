# Maintainer: Felitendo
# This PKGBUILD is updated automatically:
# https://github.com/Felitendo/PKGBUILDS

pkgname=zapzap-bin
pkgver=7.4.1
pkgrel=1
pkgdesc="WhatsApp desktop client written in PyQt6 + PyQt6-WebEngine (upstream wheel)"
arch=('any')
url="https://github.com/rafatosta/zapzap"
license=('GPL-3.0-or-later')
depends=('python' 'python-pyqt6' 'python-pyqt6-webengine' 'python-dbus'
         'qt6-wayland')
optdepends=('hunspell: spell check')
provides=('zapzap')
conflicts=('zapzap')
source=("zapzap-${pkgver}-py3-none-any.whl::${url}/releases/download/${pkgver}/zapzap-${pkgver}-py3-none-any.whl"
        "${pkgname}-${pkgver}-src.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
noextract=("zapzap-${pkgver}-py3-none-any.whl")
sha256sums=('dda0f003c9415b80fdcd58b9bd88393ce56bc16c2645b4dc102a31f282a3ef0f' '3ec0f5be60fd6c542aa088770e941fad9376eed43a75fe76b8d3d7dc5ca1b35a')

package() {
  local _entry _srctree="$srcdir/zapzap-${pkgver}"

  # Upstream's wheel, unpacked into a fixed directory instead of
  # site-packages: that path moves with every Python minor bump and would
  # silently break a package that is only rebuilt on new upstream releases.
  install -d "$pkgdir/usr/lib/zapzap"
  bsdtar -xpf "$srcdir/zapzap-${pkgver}-py3-none-any.whl" -C "$pkgdir/usr/lib/zapzap"

  # ... which also means the wheel's console script cannot be used
  _entry="$(sed -n 's/^zapzap *= *//p' \
    "$pkgdir/usr/lib/zapzap/zapzap-${pkgver}.dist-info/entry_points.txt")"
  [[ -n "$_entry" ]] || { echo "no zapzap entry point in the wheel" >&2; return 1; }

  install -d "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/zapzap" << EOF
#!/usr/bin/python3
import sys

sys.path.insert(0, "/usr/lib/zapzap")
from ${_entry%%:*} import ${_entry#*:}

sys.exit(${_entry#*:}())
EOF
  chmod 755 "$pkgdir/usr/bin/zapzap"

  # icon, desktop file and metainfo are not part of the wheel
  install -Dm644 "$_srctree/share/icons/com.rtosta.zapzap.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/com.rtosta.zapzap.svg"
  install -Dm644 "$_srctree/share/applications/com.rtosta.zapzap.desktop" \
    "$pkgdir/usr/share/applications/com.rtosta.zapzap.desktop"
  install -Dm644 "$_srctree/share/metainfo/com.rtosta.zapzap.appdata.xml" \
    "$pkgdir/usr/share/metainfo/com.rtosta.zapzap.appdata.xml"
  install -Dm644 "$pkgdir/usr/lib/zapzap/zapzap-${pkgver}.dist-info/licenses/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
