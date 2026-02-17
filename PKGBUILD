# Maintainer: nixval <nicovaliantoku@gmail.com>

pkgname=declarch-bin
pkgver=0.8.1
pkgrel=1
pkgdesc="Universal declarative package manager - unify AUR, flatpak, npm, cargo, pip, and custom backends (pre-built binary)"
arch=('x86_64')
url="https://github.com/nixval/declarch"
license=('MIT')
depends=('pacman' 'git')
optdepends=(
  'paru: AUR backend for syncing'
  'yay: Alternative AUR helper'
  'flatpak: For managing Flatpak applications'
)
provides=('declarch')
conflicts=('declarch' 'declarch-git')

source=("declarch-$pkgver-x86_64-unknown-linux-gnu.tar.gz::$url/releases/download/v$pkgver/declarch-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('d0868257e53b7ad4d6caf1761fcb5139a1e116c3340fd84f63f23071ff634f4d')

package() {
  # Install binaries
  install -Dm755 declarch "$pkgdir/usr/bin/declarch"
  if [[ -f decl ]]; then
    install -Dm755 decl "$pkgdir/usr/bin/decl"
  else
    ln -s declarch "$pkgdir/usr/bin/decl"
  fi

  # Install documentation when available in release archive
  [[ -f README.md ]] && install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  [[ -f LICENSE ]] && install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Install shell completions from packaged binary (fakeroot-safe)
  ./declarch completions bash > "$pkgdir/usr/share/bash-completion/completions/declarch"
  ./declarch completions fish > "$pkgdir/usr/share/fish/vendor_completions.d/declarch".fish
  ./declarch completions zsh > "$pkgdir/usr/share/zsh/site-functions/_declarch"
}
