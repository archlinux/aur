# Maintainer: Gradia <gradia@disroot.org>

pkgname=clonaut
pkgver=0.4.0
pkgrel=1
pkgdesc='Desktop GUI for rclone: remotes, transfers with progress, safety trash, dry runs and scheduled syncs'
arch=('any')
url='https://github.com/gradia64/Clonaut'
license=('GPL-3.0-only')
depends=('python' 'python-requests' 'python-pyqt6' 'rclone' 'hicolor-icon-theme')
optdepends=('pyside6: alternative Qt binding (used instead of PyQt6 when installed)')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
# Il tag firmato dal maintainer: con «?signed» makepkg verifica la firma del
# tag annotato e la accetta solo da una chiave in validpgpkeys. Il prefisso
# «$pkgname::» fissa la cartella del clone in $srcdir/clonaut.
source=("$pkgname::git+$url.git#tag=v$pkgver?signed")
# SKIP per il sorgente git: lo garantisce la firma del tag
sha256sums=('SKIP')
# Impronta della primaria (scripts/release-keys.sh): makepkg accetta anche le
# firme delle sue sottochiavi, quindi una rotazione non cambia questa riga.
validpgpkeys=('9F54724ACD0995BEC321BD30E6C5DCC0D49CCC6B')  # Clonaut release key

_appid=io.github.gradia64.Clonaut

build() {
  cd "$pkgname"
  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"
  # Qt senza schermo, binding del pacchetto, rclone vero di sistema
  QT_QPA_PLATFORM=offscreen CLONAUT_QT=pyqt6 \
    python -m pytest -q -p no:cacheprovider tests
}

package() {
  cd "$pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 "packaging/$_appid.desktop" "$pkgdir/usr/share/applications/$_appid.desktop"
  install -Dm644 "packaging/$_appid.metainfo.xml" "$pkgdir/usr/share/metainfo/$_appid.metainfo.xml"
  install -Dm644 "packaging/icons/$_appid.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/$_appid.svg"
  local size
  for size in 48 64 128 256; do
    install -Dm644 "packaging/icons/$_appid-$size.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/$_appid.png"
  done

  sed "s/@VERSION@/$pkgver/" packaging/clonaut.1 | gzip -9n > clonaut.1.gz
  install -Dm644 clonaut.1.gz "$pkgdir/usr/share/man/man1/clonaut.1.gz"

  install -Dm644 README.md README.it.md CHANGELOG.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
