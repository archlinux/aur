# Maintainer: pierspad
pkgname=imgpdfsquisher
pkgver=1.0.0
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

source=("$pkgname-$pkgver.tar.gz::https://github.com/pierspad/imgpdfsquisher/archive/v$pkgver.tar.gz")
sha256sums=('e19c3d969e21a0268efc3c1fa262b452a0c3cfc1b1a30fe0ba8607024424432f')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # Installa i file Python nell'app directory
  install -d "$pkgdir/usr/lib/$pkgname"
  
  # Copia solo i file necessari
  cp gui_app.py "$pkgdir/usr/lib/$pkgname/"
  cp manga_compressor.py "$pkgdir/usr/lib/$pkgname/"
  cp presets.json "$pkgdir/usr/lib/$pkgname/"
  cp requirements.txt "$pkgdir/usr/lib/$pkgname/"
  cp pyproject.toml "$pkgdir/usr/lib/$pkgname/"
  
  # Copia le directory necessarie
  cp -r assets/ "$pkgdir/usr/lib/$pkgname/"
  cp -r i18n/ "$pkgdir/usr/lib/$pkgname/"
  cp -r modules/ "$pkgdir/usr/lib/$pkgname/"

  # Crea lo script di avvio
  install -d "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/$pkgname" << 'EOF'
#!/usr/bin/env bash
# Avvia l'applicazione GUI
cd /usr/lib/imgpdfsquisher
exec /usr/bin/python gui_app.py "$@"
EOF
  chmod 755 "$pkgdir/usr/bin/$pkgname"

  # Installa il desktop file se esiste
  if [ -f "packaging/imgpdfsquisher.desktop" ]; then
    install -Dm644 packaging/imgpdfsquisher.desktop "$pkgdir/usr/share/applications/imgpdfsquisher.desktop"
  fi
  
  # Installa l'icona
  install -Dm644 assets/logo/logo.png "$pkgdir/usr/share/pixmaps/imgpdfsquisher.png"

  # Installa la licenza
  install -Dm644 docs/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
