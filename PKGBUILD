# Maintainer: XNeedNoName <xneednoname@tutamail.com>
pkgname=lonkorush
pkgver=1.0.0
pkgrel=1
pkgdesc="Lonkorush"
arch=('x86_64')
url="https://github.com/Kaktus000/lonkorush"
license=('MIT')
depends=('gtk3' 'libx11' 'libxcomposite' 'libxrandr' 'libxrender' 'fuse2')
makedepends=('cargo' 'rust' 'npm' 'nodejs' 'yarn' 'git')
source=(
  "https://github.com/Kaktus000/lonkorush/archive/refs/tags/Release-1.0.tar.gz"
  "lonkorush.desktop"
)
sha256sums=('SKIP' 'SKIP')

build() {
  cd "$srcdir"

  # GitHub-Tarball wird mit Unterordner entpackt
  tar -xvzf Release-1.0.tar.gz -C lonkorush-Release-1.0
  # in das richtige Verzeichnis wechseln
  cd lonkorush-Release-1.0/src-tauri

  # Node Modules installieren, falls Tauri benötigt
  yarn install --frozen-lockfile

  # Tauri Build
  cargo build --release
  cd target/release
  ls
  cd ../../../
  echo "----"
  ls
}

package() {
  cd "$srcdir/lonkorush-Release-1.0"

  # Binary installieren
  install -Dm755 "src-tauri/target/release/lonkorush-client" "$pkgdir/usr/bin/lonkorush"

  # Desktopfile installieren
  install -Dm644 "$srcdir/lonkorush.desktop" "$pkgdir/usr/share/applications/lonkorush.desktop"

  # Icon installieren
  install -Dm644 "src-tauri/icons/128x128@2x.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/lonkorush.png"
}
