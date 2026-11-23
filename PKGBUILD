# Maintainer: Gigas002 <gigas002@pm.me>

_pkgname=sruman
pkgname=sruman-git
pkgver=r69.gd256199
pkgrel=1
pkgdesc='Steam Linux Runtime manager and launcher for native games, without Steam'
arch=('x86_64')
url='https://github.com/Gigas002/sruman'
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc')
makedepends=('cargo' 'git')
options=('!lto')  # ring's C code built with -flto can't be linked by rustc's lld
provides=('sruman')
conflicts=('sruman')
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
  install -Dm644 README.md CHANGELOG.md docs/*.md -t "$pkgdir/usr/share/doc/$pkgname/"
  cp -r examples "$pkgdir/usr/share/doc/$pkgname/"
}
