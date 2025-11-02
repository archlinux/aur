# Maintainer: Abel <tu-email@dominio.com>
pkgname=notnative-app
pkgver=0.1.0
pkgrel=1
pkgdesc="Note-taking application with Vim-like keybindings"
arch=('x86_64')
url="https://github.com/k4ditano/notnative-app"
license=('MIT')
depends=('gtk4' 'webkit2gtk-6.0' 'libadwaita' 'gtksourceview5' 'pulseaudio')
makedepends=('cargo' 'rust' 'git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')  # Actualizar después de crear el primer release en GitHub

build() {
    cd "$pkgname-$pkgver"
    export CARGO_TARGET_DIR=target
    cargo build --release --locked --all-features
}

check() {
    cd "$pkgname-$pkgver"
    cargo test --release --locked
}

package() {
    cd "$pkgname-$pkgver"
    
    # Instalar el binario
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    
    # Instalar el archivo .desktop
    install -Dm644 "notnative.desktop" "$pkgdir/usr/share/applications/notnative.desktop"
    
    # Instalar assets
    install -Dm644 "assets/style.css" "$pkgdir/usr/share/$pkgname/assets/style.css"
    
    # Instalar iconos (SVG es el principal, PNG para compatibilidad)
    install -Dm644 "assets/logo/logo.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/notnative.svg"
    install -Dm644 "assets/logo/logo.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/notnative.png"
    install -Dm644 "assets/logo/logo.png" "$pkgdir/usr/share/pixmaps/notnative.png"
    
    # Instalar documentación
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    
    # Instalar licencia (asegúrate de tener un archivo LICENSE en el repo)
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE" 2>/dev/null || true
}
