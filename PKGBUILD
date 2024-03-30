# Maintainer: Noel Jacob <noeljacob at gmail dot com>
# Contributor: Daniele Basso <d dot bass 05 at proton dot me>
pkgname=bun-git
pkgver=1.0.36.r9080.02ad501
pkgrel=1
pkgdesc="Bun is a fast JavaScript all-in-one toolkit. This PKGBUILD builds from source, resulting into a minor binary depending on your CPU."
arch=("x86_64")
url="https://github.com/oven-sh/bun"
license=('MIT')
makedepends=("bun" "llvm" "clang" "lld" "ccache" "cmake" "git" "go" "libiconv" "libtool" "make" "ninja" "pkg-config" "python" "rust" "sed" "unzip" "ruby")
conflicts=("bun" "bun-bin")
provides=("bun")
source=("$pkgname::git+https://github.com/oven-sh/bun.git")
sha512sums=("SKIP")

pkgver() {
  cd "$pkgname"
  release=$(git describe --tags `git rev-list --tags --max-count=1` | sed 's/^bun-v//')
  version="r$(git rev-list --count HEAD).$(git rev-parse --short=7 HEAD)"
  printf "$release.$version"
}

build() {
  cd "$pkgname"
  bun setup
  bun run build:release
}

package() {
  install -Dm755 $srcdir/$pkgname/build/bun $pkgdir/usr/bin/bun
  ln -s /usr/bin/bun $pkgdir/usr/bin/bunx

  SHELL=zsh $pkgdir/usr/bin/bun completions > bun.zsh
  SHELL=bash $pkgdir/usr/bin/bun completions > bun.bash
  SHELL=fish $pkgdir/usr/bin/bun completions > bun.fish

  install -Dm644 bun.zsh $pkgdir/usr/share/zsh/site-functions/_bun
  install -Dm644 bun.bash $pkgdir/usr/share/bash-completion/completions/bun
  install -Dm644 bun.fish $pkgdir/usr/share/fish/vendor_completions.d/bun.fish
}
