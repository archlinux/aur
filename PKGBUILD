# Maintainer: Ninso112 <Ninso112@pm.me>
_pkgname=oxid
pkgname=$_pkgname-git
pkgver=r4.ae84775
pkgrel=1
pkgdesc="A customizable TUI editor written in Rust"
arch=('x86_64')
url="https://github.com/Ninso112/oxid"
license=('MIT') # Ändere dies, falls du eine andere Lizenz nutzt (z.B. GPL, Apache)
makedepends=('git' 'cargo')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  # Generiert eine Version basierend auf Anzahl der Commits und dem Hash (z.B. r20.a1b2c3d)
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_pkgname"
  # Lädt die Cargo Dependencies vor
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # Baut das Binary im Release Modus
  cargo build --frozen --release --all-features
}

package() {
  cd "$_pkgname"
  # Installiert das Binary nach /usr/bin/oxid
  install -Dm755 target/release/$_pkgname "$pkgdir/usr/bin/$_pkgname"

  # Installiert die Lizenzdatei (falls vorhanden im Repo, sonst Zeile entfernen)
  if [ -f LICENSE ]; then
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  fi

  # Installiert die README (optional, aber nice to have)
  if [ -f README.md ]; then
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  fi
  
  # Installiert die Standard Config (falls vorhanden) als Beispiel
  if [ -f config.toml ]; then
    install -Dm644 config.toml "$pkgdir/usr/share/doc/$pkgname/config.example.toml"
  fi
}

