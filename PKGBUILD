# Maintainer: Carlos Prieto Ortiz <prietus@live.com>

pkgname=waymobar
pkgver=0.2.0
pkgrel=1
pkgdesc='Wayland status bar written and configured in Haskell, with rivermonad widgets'
url='https://github.com/prietus/waymobar'
arch=('x86_64' 'aarch64')
license=('BSD-3-Clause')
# ghc: ~/.config/waymobar/waymobar.hs is compiled at run time, against the
# library this package also installs (like xmobar/xmonad).
depends=('ghc' 'ghc-libs' 'haskell-network' 'cairo' 'pango' 'glib2' 'gdk-pixbuf2' 'libpulse')
optdepends=('rivermonad: workspaces, layout and window title widgets'
            'curl: weather and calendar widgets'
            'ttf-nerd-fonts-symbols: icons'
            'ttf-material-symbols-variable: icons (the ones of rivermonad-dotfiles)'
            'libnotify: notifications when the configuration fails to compile')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('201d0fe9b91a8523f1d325b7ab6eb0e81680cec166259b4575de785a0e30e301')

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
