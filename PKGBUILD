# Maintainer: pierspad
pkgname=textmerger
pkgver=2.0.0
pkgrel=2
pkgdesc="A Rust/Tauri GUI application for merging text files"
arch=('x86_64')
url="https://github.com/pierspad/textmerger"
license=('MIT')

# Dipendenze di runtime necessarie per Tauri su Linux
depends=(
  'webkit2gtk'
  'gtk3'
  'cairo'
  'gdk-pixbuf2'
  'glib2'
  'pango'
  'libappindicator-gtk3'
)

# Strumenti per compilare
makedepends=('cargo' 'nodejs' 'npm')

# Fonte: useremo il tarball locale generato dal tuo script o quello di GitHub
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/pierspad/textmerger/archive/refs/tags/v$pkgver.tar.gz"

)
sha256sums=('dc8a38063b08a805c9d03f3aecfbd9b609011e1835d175ffcca2b5a2cf30d23a')

prepare() {
  cd "$srcdir/$pkgname-$pkgver/textmerger"
  # Installazione dipendenze Node (Frontend)
  echo "Installing Node dependencies..."
  npm install
}

build() {
  cd "$srcdir/$pkgname-$pkgver/textmerger"
  
  echo "Building Tauri application..."
  # Disable bundling to avoid linuxdeploy dependency (we only need the binary)
  sed -i 's/"active": true/"active": false/' src-tauri/tauri.conf.json
  
  # Rimuoviamo i flag specifici. Tauri costruirà i bundle di default.
  # Noi li ignoreremo e prenderemo solo il binario compilato.
  npm run tauri build
}

package() {
  cd "$srcdir/$pkgname-$pkgver/textmerger"
  
  # 1. Installa il binario
  install -Dm755 "src-tauri/target/release/textmerger" "$pkgdir/usr/bin/textmerger"
  
  # 2. Installa il file .desktop (Tauri ne genera uno o ne usiamo uno custom)
  # Assumiamo tu ne abbia uno in packaging/ o usiamo quello generato se presente.
  # Per ora usiamo un path generico, adattalo se hai il file in una cartella specifica.
  install -Dm644 "../packaging/textmerger.desktop" "$pkgdir/usr/share/applications/textmerger.desktop"
  
  # 3. Installa l'icona (Tauri ha le icone in src-tauri/icons o app-icon.png)
  install -Dm644 "src-tauri/icons/128x128.png" "$pkgdir/usr/share/pixmaps/textmerger.png"
  
  # 4. Docs e Licenza
  cd ..
  install -Dm644 docs/README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 docs/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
