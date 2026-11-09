# Maintainer: Carlos Prieto Ortiz <prietus@live.com>

pkgname=waymobar
pkgver=0.1.0
pkgrel=1
pkgdesc='Wayland status bar written and configured in Haskell, with rivermonad widgets'
url='https://github.com/prietus/waymobar'
arch=('x86_64' 'aarch64')
license=('BSD-3-Clause')
# ghc: ~/.config/waymobar/waymobar.hs is compiled at run time, against the
# library this package also installs (like xmobar/xmonad).
depends=('ghc' 'ghc-libs' 'haskell-network' 'cairo' 'pango' 'gdk-pixbuf2' 'libpulse')
optdepends=('rivermonad: workspaces, layout and window title widgets'
            'ttf-nerd-fonts-symbols: icons'
            'libnotify: notifications when the configuration fails to compile')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('77539a0593a6a174fcfd6ab359f709a6452e0af26852256f400300f41a34d6b1')

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

package() {
  cd $pkgname-$pkgver

  install -Dm744 register.sh   "$pkgdir/usr/share/haskell/register/$pkgname.sh"
  install -Dm744 unregister.sh "$pkgdir/usr/share/haskell/unregister/$pkgname.sh"
  runhaskell Setup copy --destdir="$pkgdir"

  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
