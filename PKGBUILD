# Maintainer: pierspad
pkgname=imgpdfsquisher
pkgver=1.3.0
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

# Scarica il tarball della release da GitHub e rinominalo a $pkgname-$pkgver.tar.gz
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/pierspad/imgpdfsquisher/archive/refs/tags/v$pkgver.tar.gz"
)
# Lo script di build aggiornerà automaticamente questo valore
sha256sums=('cbc5a6eaad2600353e2b096f71f70846a8d04fb13ae2b0be1cee68da2d8e6a1d')

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
