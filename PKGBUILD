# Maintainer: Debasish Patra <patradebasish1987@gmail.com>
pkgname=treeview-git
pkgver=.r0.17f1ab3
pkgrel=1
pkgdesc="A treeview tool to see directories & files"
arch=('i686' 'x86_64')
url="https://gitlab.gnome.org/patradebasish1987/treeview"
license=('UNLICENSE' 'MIT')
provides=("treeview")
makedepends=('cargo' 'git')
conflicts=('treeview-bin')
source=("$pkgname::git+https://gitlab.gnome.org/patradebasish1987/treeview")
sha1sums=('SKIP')

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
  install -Dm755 "target/release/treeview" "$pkgdir/usr/bin/treeview"

}

