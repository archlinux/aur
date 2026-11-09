# Maintainer: Carlos Prieto Ortiz <prietus@live.com>

pkgname=rivermonad
pkgver=0.1.0
pkgrel=1
pkgdesc='xmonad-style tiling window manager for the river Wayland compositor'
url='https://github.com/prietus/rivermonad'
arch=('x86_64' 'aarch64')
license=('BSD-3-Clause')
# ghc: ~/.config/rivermonad/rivermonad.hs is compiled at run time, against
# the library this package also installs (like xmonad).
depends=('river>=0.4' 'ghc' 'ghc-libs' 'haskell-network' 'libxkbcommon')
optdepends=('foot: the default terminal'
            'fuzzel: the default launcher (mod-p)'
            'kanshi: monitor resolution and scale, started by the session'
            'libnotify: notifications when the configuration fails to compile')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('4012a2147c8b20c8cefcb0c9ba041b54005549b670582bc2173215cc370ca003')

build() {
  cd $pkgname-$pkgver

  # Arch ships Haskell libraries as shared objects only: build them that
  # way, and link the user's configuration with -dynamic too.
  runhaskell Setup configure -O \
    --enable-shared \
    --enable-executable-dynamic \
    --disable-library-vanilla \
    --prefix=/usr \
    --dynlibdir=/usr/lib \
    --docdir=/usr/share/doc/$pkgname --datasubdir=$pkgname \
    --enable-tests \
    --libsubdir=\$compiler/site-local/\$pkgid \
    --flags=dynamic-config \
    --ghc-option=-optl-Wl\,-z\,relro\,-z\,now \
    --ghc-option='-pie'
  runhaskell Setup build $MAKEFLAGS
  runhaskell Setup register --gen-script
  runhaskell Setup unregister --gen-script
  sed -i -r -e "s|ghc-pkg.*update[^ ]* |&'--force' |" register.sh
  sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}

check() {
  cd $pkgname-$pkgver
  runhaskell Setup test --show-details=direct
}

package() {
  cd $pkgname-$pkgver

  install -Dm744 register.sh   "$pkgdir/usr/share/haskell/register/$pkgname.sh"
  install -Dm744 unregister.sh "$pkgdir/usr/share/haskell/unregister/$pkgname.sh"
  runhaskell Setup copy --destdir="$pkgdir"

  # The session: river-session starts river with /usr/share/rivermonad/init
  # unless the user has a ~/.config/river/init.
  install -Dm755 contrib/session/river-session "$pkgdir/usr/bin/river-session"
  install -Dm755 contrib/session/init "$pkgdir/usr/share/rivermonad/init"
  sed 's|@BINDIR@|/usr/bin|' contrib/session/rivermonad.desktop |
    install -Dm644 /dev/stdin "$pkgdir/usr/share/wayland-sessions/rivermonad.desktop"

  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  cp -r examples/dotfiles "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
