# Maintainer: <b.j.corrigan@gmail.com>

pkgname=mime-tui
pkgver=0.9.0
pkgrel=1
pkgdesc='Keyboard-driven terminal UI for managing MIME-type to application associations'
arch=('x86_64' 'aarch64')
url='https://github.com/bcorrigan/mime-tui'
license=('MIT')

depends=(
  'shared-mime-info'
  'desktop-file-utils'
  'sqlite'
)

optdepends=(
  'ttf-firacode-nerd: Nerd Font for file-type / app-category icons'
)

makedepends=('rust' 'git')

options=('!debug')

_giturl=https://github.com/bcorrigan/mime-tui.git
source=("$pkgname::git+$_giturl#tag=$pkgver")
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/$pkgname"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$srcdir/$pkgname"
  cargo build --frozen --release
}

check() {
  cd "$srcdir/$pkgname"
  cargo test --frozen --release
  desktop-file-validate mime-tui.desktop
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
