# Maintainer: Toesoe <code [at] toesoe [dot] dev>

pkgname=negpy-bin
pkgver=0.66.0
pkgrel=1
pkgdesc="Tool for processing film negatives"
arch=('x86_64')
url="https://github.com/marcinz606/NegPy"
license=('GPL-3.0-only')
depends=('hicolor-icon-theme')
optdepends=(
  'sane: film scanners with SANE support'
  'libgphoto2: tethered camera capture'
  'libusb: USB transport for scanners'
)

provides=('negpy')
options=('!strip' '!debug')

_appimage="NegPy-${pkgver}-x86_64.AppImage"
source=("${_appimage}::${url}/releases/download/${pkgver}/${_appimage}")
sha256sums=('a73740592af1d4b9c2d210dbc1ca858f84a6842fe4b5343642e7dfadb6a1030c')

package() {
  cd "$srcdir"
  chmod +x "$_appimage"
  "$srcdir/$_appimage" --appimage-extract >/dev/null # no FUSE needed

  install -d "$pkgdir/opt/negpy"
  cp -a squashfs-root/. "$pkgdir/opt/negpy/"

  # appimage extracts dirs as 0700, normalize to 0755
  find "$pkgdir/opt/negpy" -type d -exec chmod 0755 {} +

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/negpy" <<'EOF'
#!/bin/sh
exec /opt/negpy/AppRun "$@"
EOF

  # desktop entry
  install -Dm644 "$srcdir/squashfs-root/NegPy.desktop" \
    "$pkgdir/usr/share/applications/negpy.desktop"
  sed -i 's|^Exec=.*|Exec=negpy|' "$pkgdir/usr/share/applications/negpy.desktop"

  # icons
  install -Dm644 "$srcdir/squashfs-root/negpy.png" \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/negpy.png"
  install -Dm644 "$srcdir/squashfs-root/usr/share/icons/hicolor/48x48/apps/negpy.png" \
    "$pkgdir/usr/share/icons/hicolor/48x48/apps/negpy.png"
  install -Dm644 "$srcdir/squashfs-root/usr/share/icons/hicolor/scalable/apps/negpy.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/negpy.svg"
}
