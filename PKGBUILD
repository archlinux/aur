# Maintainer: Gigas002 <gigas002@pm.me>

_pkgname=lootrs
pkgname=lootrs-git
pkgver=r17.g43869c2
pkgrel=1
pkgdesc='Minimal TUI and CLI for running Windows games through wine, Proton (umu) or natively'
arch=('x86_64' 'aarch64')
url='https://github.com/Gigas002/lootrs'
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc')
makedepends=('cargo' 'git')
optdepends=('wine: wine runner'
            'umu-launcher: Proton runner'
            'winetricks: lootrs tricks for the wine runner')
provides=('lootrs')
conflicts=('lootrs')
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_pkgname"
  cargo fetch --locked
}

build() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo build --release --frozen -p "$_pkgname"
}

package() {
  cd "$_pkgname"

  install -Dm755 "target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md docs/*.md -t "$pkgdir/usr/share/doc/$pkgname/"
  cp -r examples "$pkgdir/usr/share/doc/$pkgname/"
}
