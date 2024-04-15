# Maintainer: Debasish Patra <patradebasish1987@gmail.com>
pkgname=gnomelookbrowse-git
pkgver=0.0.1.aplha
pkgrel=1
pkgdesc="A Gnome native themes installer from gnome-look.org"
arch=('i686' 'x86_64')
url="https://gitlab.gnome.org/patradebasish1987/gnomethemebrowse.git"
license=('UNLICENSE' 'MIT')
provides=("gnomelookbrowse")
makedepends=('cargo' 'git')
source=("$pkgname::git+https://gitlab.gnome.org/patradebasish1987/gnomethemebrowse.git")
sha1sums=('SKIP')

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
  install -Dm755 "target/release/gnomelookbrowse" "$pkgdir/usr/bin/gnomelookbrowse"
  install -Dm755 "org.scalpel.gnomelookbrowse.desktop" "$pkgdir/usr/share/applications/org.scalpel.gnomelookbrowse.desktop"
}

