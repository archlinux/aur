# Maintainer: Odd-Harald Lillestø Myhren <knarkzel@cock.li>
pkgname=groffdown
pkgver=0.1.0
pkgrel=1
pkgdesc="wrapper for creating documents with markdown using groff as backend, because groff is fast and convenient"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://gitlab.com/knarkzel/groffdown"
source=("git+$url")
license=('MIT')
makedepends=('rust' 'cargo' 'git')
depends=('gcc-libs')
md5sums=('SKIP')

build() {
  cd "$pkgname"
  if command -v rustup > /dev/null 2>&1; then
    RUSTFLAGS="-C target-cpu=native" rustup run stable \
      cargo build --release
  elif rustc --version | grep -q stable; then
    RUSTFLAGS="-C target-cpu=native" \
      cargo build --release
  else
    cargo build --release
  fi
}

pkgver() {
  cd "$pkgname"
  local tag=$(git tag --sort=-v:refname | grep '^[0-9]' | head -1)
  local commits_since=$(git rev-list $tag..HEAD --count)
  echo "$tag.r$commits_since.$(git log --pretty=format:'%h' -n 1)"
}

package() {
  cd "$pkgname"
  install -Dm755 "target/release/groffdown" "$pkgdir/usr/bin/groffdown"
}
