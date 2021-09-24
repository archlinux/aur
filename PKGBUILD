# Maintainer: Gregory G Danielson III <gregdan3@protonmail.com>

pkgname=dmenu-grid
pkgver=5.0
pkgrel=2
pkgdesc="A menu for quickly opening applications. Grid/Gridnav patches pre-applied."
arch=("any")
license=('MIT')
depends=()
provides=('dmenu')
conflicts=('dmenu')
url=https://tools.suckless.org/dmenu
_patches=("https://tools.suckless.org/dmenu/patches/numbers/dmenu-numbers-4.9.diff"
          "https://tools.suckless.org/dmenu/patches/fuzzymatch/dmenu-fuzzymatch-4.9.diff"
          "https://tools.suckless.org/dmenu/patches/grid/dmenu-grid-4.9.diff"
          "https://tools.suckless.org/dmenu/patches/gridnav/dmenu-gridnav-5.0.diff")
source=("$pkgname::git://git.suckless.org/dmenu#tag=5.0"
        "config.h"
        "${_patches[@]}")
sha256sums=('SKIP'
            '07828a145bf1d75b4fd92bf58b27120dedbd4422b6d8345891a1350208d3a98a'
            'f79de21544b83fa1e86f0aed5e849b1922ebae8d822e492fbc9066c0f07ddb69'
            'd9a1e759cd518348fc37c2c83fbd097232098562ebfd1edf85b51413ff524b79'
            'd70d888c1d70289aaad7a9bcaec61203654a588ae11e10ce2fc8d03c8c38a3b4'
            'a11a5a25e45cf745e48bc8815bf6964de1d261f2238afcf6e38b429271d6f766')
_sourcedir=("$pkgname")
_makeopts="--directory=$_sourcedir"

prepare() {
  for patch in "${_patches[@]}"; do
	echo "Applying patch $(basename $patch)..."
    patch -Np1 -d "$srcdir/$pkgname" -i "$srcdir/$(basename $patch)"
  done
  cp "config.h" "$srcdir/$pkgname"
}

build() {
  make $_makeopts
}

package() {
  local installopts='--mode 0644 -D --target-directory'
  local binopts='--mode 0755 -D --target-directory'
  local bindir="$pkgdir/usr/bin"
  local shrdir="$pkgdir/usr/share"
  local licdir="$shrdir/licenses/$pkgname"
  local docdir="$shrdir/doc/$pkgname"
  make $_makeopts PREFIX=/usr DESTDIR="$pkgdir"
  install $installopts "$licdir" "$_sourcedir/LICENSE"
  install $installopts "$docdir" "$_sourcedir/README"
  install $binopts "$bindir" "$_sourcedir/dmenu"
  install $binopts "$bindir" "$_sourcedir/dmenu_run"
  install $binopts "$bindir" "$_sourcedir/dmenu_path"
  install $binopts "$bindir" "$_sourcedir/stest"
}
