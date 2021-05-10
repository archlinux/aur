# Maintainer: shiro <shiro@usagi.io>

pkgname=map2-git
pkgver=1.0.0
pkgrel=1
pkgdesc="A scripting language that allows complex key remapping on Linux, written in Rust"
arch=('x86_64' 'i686')
license=('MIT')
provides=("map2")
depends=()
makedepends=(rustup)
conflicts=('map2')
source=("${pkgname}::git+https://github.com/shiro/${pkgname%-git}.git")
sha256sums=('SKIP')

build() {
  cd "$pkgname"
  cargo build --release --locked --all-features --target-dir=target
}

pkgver() {
  cd "$pkgname"
  local tag=$(git tag --sort=-v:refname | grep '^[0-9]' | head -1)
  local commits_since=$(git rev-list $tag..HEAD --count)
  echo "$tag.r$commits_since.$(git log --pretty=format:'%h' -n 1)"
}

check() {
  cd "$pkgname"
  cargo test --release --locked --target-dir=target
}

package() {
  cd "$pkgname"
  install -Dm 755 target/release/map2 -t "${pkgdir}/usr/bin"

  install -Dm644 docs/man/map2.1 "$pkgdir/usr/share/man/man1/map2.1"
}
