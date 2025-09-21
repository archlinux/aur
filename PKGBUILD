# Maintainer: pierspad
pkgname=imgpdfsquisher
pkgver=1.2.1
pkgrel=2
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

source=("$pkgname-$pkgver.tar.gz::https://github.com/pierspad/imgpdfsquisher/archive/v$pkgver.tar.gz")
sha256sums=('c477b79f4e6dc4aa05a921004a9fa0741d298f53cdf6e8508463ae8bcdfb54a7')

prepare() {
  cd "$srcdir/ImgPdfSquisher-$pkgver"
}

check() {
  cd "$srcdir/ImgPdfSquisher-$pkgver"
}

package() {
  cd "$srcdir/ImgPdfSquisher-$pkgver"

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
