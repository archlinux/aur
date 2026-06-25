# Maintainer: rabbull <karl.liu.1024@gmail.com>
_pkgname=reckless
pkgname=reckless-git
pkgver=0.10.0.dev.7300f044.r111.ga4e68fd
pkgrel=1
pkgdesc='Competitive UCI chess engine written in Rust'
arch=('x86_64' 'aarch64')
url='https://github.com/codedeliveryservice/Reckless'
license=('AGPL-3.0-only')
depends=('libgcc' 'glibc')
makedepends=('cargo' 'clang' 'git')
options=('!debug')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-bin")
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"

  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"

  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_pkgname"

  make
}

check() {
  cd "$_pkgname"

  cargo test --release --locked
}

package() {
  cd "$_pkgname"

  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
