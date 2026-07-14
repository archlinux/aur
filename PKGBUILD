# Maintainer: Rohit Goswami (HaoZeke) <rohit.goswami@aol.com>
# Contributor: voxan <dev at hessfr dot fr>
# Contributor: 39aldo39

pkgname=klfc
pkgver=1.5.7
pkgrel=6
pkgdesc="Tool to create advanced keyboard layouts in various formats"
url="https://github.com/39aldo39/klfc"
license=("GPL-3.0-only")
arch=("x86_64")
# Upstream ships a pinned nix expression (ghc 8.10.4). Modern cabal+GHC fails on
# this tree (aeson/containers bounds + Unicode layout). Use the upstream build.
makedepends=("nix")
source=("https://github.com/39aldo39/klfc/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5a052c6f59917e99593e507e460e37b6633a388a43ef9ed0401b297c723c1eba')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  nix-build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  # result/bin/klfc is a nix wrapper; install the real ELF
  local _bin
  _bin="$(readlink -f result/bin/klfc)"
  if file "$_bin" | grep -q 'ELF'; then
    install -Dm755 "$_bin" "$pkgdir/usr/bin/klfc"
  else
    # wrapper script: prefer .klfc-wrapped sibling
    install -Dm755 result/bin/.klfc-wrapped "$pkgdir/usr/bin/klfc"
  fi
}
