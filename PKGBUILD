# Maintainer: Francesco Zardi <frazar0@hotmail.it>
pkgname=amber-search-git
pkgver=v0.5.1.r3.68171b9
pkgrel=2
pkgdesc="A code search and replace tool written by Rust, inspired by ack, ag, and other grep-like tools."
arch=('x86_64' 'i686')
url="https://github.com/dalance/amber"
license=('MIT')
provides=("amber-search")
depends=("gcc-libs")
makedepends=('cargo' 'git')
conflicts=("amber-search")
source=("$pkgname::git+https://github.com/dalance/amber")
md5sums=('SKIP')

build() {
  cd "$pkgname"

  cargo build --release --target=$CARCH-unknown-linux-gnu
}

pkgver() {
  cd "$pkgname"
  local tag=$(git tag --sort=-v:refname | head -1)
  local commits_since=$(git rev-list $tag..HEAD --count)
  echo "$tag.r$commits_since.$(git log --pretty=format:'%h' -n 1)"
}

package() {
  cd "$pkgname"

  install -Dm755 "target/$CARCH-unknown-linux-gnu/release/ambr" "$pkgdir/usr/bin/ambr"
  install -Dm755 "target/$CARCH-unknown-linux-gnu/release/ambs" "$pkgdir/usr/bin/ambs"

  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"

  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
