# Maintainer: mr_s1m0n silverphoneix@disroot.org

pkgname=freebsd-coreutils-git
pkgver=13.2.r33.g6bec5e5
pkgrel=1
pkgdesc="Alternative to GNU coreutils using software from FreeBSD. Chocobo1's package with improved full source build."
arch=('i686' 'x86_64')
url="https://codeberg.org/dcantrell/bsdutils.git"
license=('BSD-3-Clause')
depends=('glibc' 'libgcc' 'libstdc++' 'libedit' 'libbsd' 'libxo' 'ncurses' 'openssl' 'unibilium')
makedepends=('git' 'byacc' 'meson' 'flex' 'ninja')
provides=("bsdutils=$pkgver")
conflicts=('bsdutils' 'bsdcoreutils-git')
source=("git+https://codeberg.org/dcantrell/bsdutils.git")
sha256sums=('SKIP')


pkgver() {
  cd "$srcdir/bsdutils"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count "$_tag"..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "$srcdir/bsdutils"

#  meson setup build --prefix=/opt/$pkgname
  meson setup build . \
    --prefix=/opt/freeBSD-coreutils \
    --buildtype=release
  ninja -C build
}

check() {
  cd "$srcdir/bsdutils"

  #meson test -C "_build"
}

package() {
  cd "$srcdir/bsdutils"

  DESTDIR="$pkgdir" ninja -C build install

  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"

  echo ""
  echo "=================================================================="
  echo "To finish installation, add these lines to your shell config:"
  echo "export PATH=\"/opt/$pkgname/bin:/opt/$pkgname/sbin:\$PATH\""
  echo "export MANPATH=\"/opt/$pkgname/share/man:\$MANPATH\""
  echo "=================================================================="
}
