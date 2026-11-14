# Maintainer: Carlos Prieto Ortiz <prietus@live.com>

pkgname=hasklets
pkgver=0.1.0.0
pkgrel=2
pkgdesc='Desktop widgets for Wayland (weather, system, media, disks, processes, calendar) in Haskell'
url='https://github.com/prietus/hasklets'
arch=('x86_64' 'aarch64')
license=('BSD-3-Clause')
depends=('gtk4' 'gtk4-layer-shell' 'cairo' 'pango' 'gdk-pixbuf2' 'glib2'
         'gobject-introspection-runtime' 'gmp' 'libffi')
optdepends=('curl: weather, calendars and cover art served over HTTP')
# hasklets is a plain program, nothing is compiled against it at run time,
# and Arch has no packages of the GTK 4 bindings it uses (gi-gtk4,
# gi-gtk4-layer-shell). So the Haskell libraries come from Hackage and are
# linked statically (ghc-static); only the C libraries are shared.
makedepends=('ghc' 'ghc-static' 'cabal-install' 'gobject-introspection')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('b8725f1504582d1f92680b66c4048f7066d64cc6dd9e2d147f74462127e53174')

# Arch's haskell-* packages (cabal-install itself depends on some) are
# registered in GHC's global package database, so cabal would pick them
# instead of building its own. But they are shared objects only and cannot
# be linked statically ("There are files missing in the random package").
# So every library that does not come with GHC itself is built from source.
_cabal_build() {
  local conf name constraints=()
  for conf in "$(ghc --print-libdir)"/package.conf.d/*.conf; do
    case $(pacman -Qoq "$conf" 2>/dev/null) in
      ghc|ghc-libs|ghc-static) continue ;;
    esac
    name=$(sed -n 's/^name: *//p' "$conf")
    [[ -n $name ]] && constraints+=("--constraint=any.$name source")
  done
  cabal build "${constraints[@]}" "$@"
}

prepare() {
  cd $pkgname-$pkgver
  export CABAL_DIR="$srcdir/cabal"
  cabal update
  _cabal_build --only-download
}

build() {
  cd $pkgname-$pkgver
  export CABAL_DIR="$srcdir/cabal"
  _cabal_build --ghc-option=-optl-Wl\,-z\,relro\,-z\,now
}

package() {
  cd $pkgname-$pkgver
  export CABAL_DIR="$srcdir/cabal"
  install -Dm755 "$(cabal list-bin exe:hasklets)" "$pkgdir/usr/bin/hasklets"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
