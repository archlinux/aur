# Maintainer: ecmm (@ecmm)
pkgname=shelf-git
pkgver=.r0.1484ef8
pkgrel=1
pkgdesc="A cli tool used to bookmark files"
arch=('x86_64')
provides=("shelf")
url="https://github.com/ecmma/shelf"
license=('MIT')
depends=('git')
makedepends=('cargo')
source=("$pkgname::git+https://github.com/ecmma/shelf")
md5sums=('SKIP')

build() {
  cd "$pkgname"
  if command -v rustup > /dev/null 2>&1; then
    RUSTFLAGS="-C target-cpu=native" rustup run nightly \
      cargo build --release 
  elif rustc --version | grep -q nightly; then
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
  install -Dm755 "target/release/shelf" "$pkgdir/usr/bin/shelf"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
