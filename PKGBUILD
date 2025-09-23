# Maintainer: pierspad
pkgname=imgpdfsquisher
pkgver=1.3.2
pkgrel=1
pkgdesc="A Python GUI application for reducing the filesize of PDF with high resolution images"
arch=('any')
url="https://github.com/pierspad/imgpdfsquisher"
license=('MIT')

depends=(
  'python'
  'poppler'
  'python-pillow'
  'python-reportlab'
  'python-charset-normalizer'
  'pyside6'
  'python-pdf2image'
)

makedepends=()
optdepends=('python-pip: per installare plugin opzionali')

source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/pierspad/imgpdfsquisher/archive/refs/tags/v$pkgver.tar.gz"
)
sha256sums=('ca3457b5973a5d11874e7e9da21aac8f781716ed1094447fc0d23d516129339f')

prepare() {
  cd "$srcdir/imgpdfsquisher-$pkgver"
}

check() {
  cd "$srcdir/imgpdfsquisher-$pkgver"
}

package() {
  cd "$srcdir/imgpdfsquisher-$pkgver"

  install -d "$pkgdir/usr/lib/$pkgname"
  
  cp gui_app.py "$pkgdir/usr/lib/$pkgname/"
  cp manga_compressor.py "$pkgdir/usr/lib/$pkgname/"
  cp presets.json "$pkgdir/usr/lib/$pkgname/"
  cp requirements.txt "$pkgdir/usr/lib/$pkgname/"
  cp pyproject.toml "$pkgdir/usr/lib/$pkgname/"
  
  cp -r assets/ "$pkgdir/usr/lib/$pkgname/"
  cp -r i18n/ "$pkgdir/usr/lib/$pkgname/"
  cp -r modules/ "$pkgdir/usr/lib/$pkgname/"

  install -d "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/$pkgname" << 'EOF'
#!/usr/bin/env bash
# Avvia l'applicazione GUI
cd /usr/lib/imgpdfsquisher
exec /usr/bin/python gui_app.py "$@"
EOF
  chmod 755 "$pkgdir/usr/bin/$pkgname"

  if [ -f "packaging/imgpdfsquisher.desktop" ]; then
    install -Dm644 packaging/imgpdfsquisher.desktop "$pkgdir/usr/share/applications/imgpdfsquisher.desktop"
  fi
  
  install -Dm644 assets/logo/logo.png "$pkgdir/usr/share/pixmaps/imgpdfsquisher.png"

  install -Dm644 docs/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
