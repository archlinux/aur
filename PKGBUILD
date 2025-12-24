pkgname=simplytoast
pkgver=0.9.5.4
pkgrel=1
pkgdesc="Manage startup and background applications,easier than ever before!"
arch=(any)
url="https://github.com/toast1599/SimplyToast"
license=('GPL-3.0-or-later')

depends=(
  python
  python-gobject
  gtk3
)

source=("https://github.com/toast1599/SimplyToast/archive/v0.9.5.4.tar.gz")
sha256sums=('c3b768f753240df750c57e70989e79de49cb6bf1170b1a4f356f3933871c4a14')

package() {
  cd "$srcdir/SimplyToast-$pkgver"

  # App code
  install -d "$pkgdir/usr/lib/simplytoast"
  cp -r src/* "$pkgdir/usr/lib/simplytoast/"

  # Data
  install -d "$pkgdir/usr/lib/simplytoast/data"
  cp -r data/* "$pkgdir/usr/lib/simplytoast/data/"

  # Launcher wrapper
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/simplytoast" <<'EOF'
#!/usr/bin/env bash
export PYTHONPATH="/usr/lib/simplytoast${PYTHONPATH:+:$PYTHONPATH}"
exec python /usr/lib/simplytoast/main.py "$@"
EOF

  # Desktop + metadata
  install -Dm644 data/com.toast1599.SimplyToast.desktop \
    "$pkgdir/usr/share/applications/com.toast1599.SimplyToast.desktop"

  install -Dm644 data/com.toast1599.SimplyToast.appdata.xml \
    "$pkgdir/usr/share/metainfo/com.toast1599.SimplyToast.appdata.xml"

  install -Dm644 data/icons/com.toast1599.SimplyToast-512.png \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/com.toast1599.SimplyToast.png"

  # Cleanup
  find "$pkgdir" -name "__pycache__" -prune -exec rm -rf {} +
  find "$pkgdir" -name "*.pyc" -delete
}
