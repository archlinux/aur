# Maintainer: Rohit Goswami (HaoZeke) <rohit.goswami@aol.com>
# Contributor: voxan <dev at hessfr dot fr>
# Contributor: 39aldo39

pkgname=klfc
pkgver=1.5.7
pkgrel=7
pkgdesc="Tool to create advanced keyboard layouts in various formats"
url="https://github.com/39aldo39/klfc"
license=("GPL-3.0-only")
arch=("x86_64")
depends=('gmp')
# Upstream ships a pinned nix expression (ghc 8.10.4). Modern cabal+GHC fails on
# this tree (aeson/containers bounds + Unicode layout). Use the upstream build,
# then rewrite the dynamic linker/RPATH for a normal Arch runtime.
makedepends=('nix' 'patchelf')
source=("https://github.com/39aldo39/klfc/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5a052c6f59917e99593e507e460e37b6633a388a43ef9ed0401b297c723c1eba')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  nix-build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  local _wrapped _libffi
  _wrapped="result/bin/.klfc-wrapped"
  install -Dm755 "$_wrapped" "$pkgdir/usr/bin/klfc"

  # Bundle libffi.so.7 (Arch currently ships libffi.so.8 only)
  _libffi="$(ldd "$_wrapped" | sed -n 's/.*libffi\.so\.7 => \(.*\) (0x.*/\1/p')"
  install -Dm755 "$_libffi" "$pkgdir/usr/lib/$pkgname/libffi.so.7"

  patchelf --set-interpreter /lib64/ld-linux-x86-64.so.2 \
    --force-rpath --set-rpath '$ORIGIN/../lib/klfc:/usr/lib' \
    "$pkgdir/usr/bin/klfc"
}
