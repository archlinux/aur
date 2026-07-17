# Maintainer: Undercat037 <deltacatdeveloper@gmail.com>
pkgname=aura-emerge
pkgver=1.25.0
pkgrel=1
pkgdesc="Portage-like wrapper for Arch Linux using Aura"
arch=('x86_64')
url="https://github.com/Undercat037/aura-emerge"
license=('GPL-3.0')
depends=('aura')
optdepends=('asp: for --abs support (build from ABS source)'
  'gnupg: for PGP verification when building from ABS')
makedepends=('rust' 'cargo' 'git')
conflicts=('portageq')
install=aura-emerge.install
backup=('etc/emerge/world.set')
#git tag -a v1.23.0 -m "..." && git push origin v1.23.0
source=("$pkgname::git+https://github.com/Undercat037/aura-emerge.git#tag=v$pkgver")
sha256sums=('SKIP')
build() {
  cd "$pkgname"
  cargo build --release
}
package() {
  cd "$pkgname"
  install -Dm755 target/release/aura-emerge "$pkgdir/usr/local/bin/emerge"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.MD "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -dm755 "$pkgdir/etc/emerge"
  install -Dm644 /dev/null "$pkgdir/etc/emerge/world.set"

  local bin="target/release/aura-emerge"
  install -Dm644 <("$bin" --gen-completions bash) \
    "$pkgdir/usr/share/bash-completion/completions/emerge"
  install -Dm644 <("$bin" --gen-completions zsh) \
    "$pkgdir/usr/share/zsh/site-functions/_emerge"
  install -Dm644 <("$bin" --gen-completions fish) \
    "$pkgdir/usr/share/fish/vendor_completions.d/emerge.fish"
}
