# Maintainer: Carlos Prieto Ortiz <prietus@live.com>

pkgbase=rivermonad
pkgname=('rivermonad' 'rivermonad-dotfiles')
pkgver=0.2.0
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
source=("$pkgbase-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('73dda2ea9441ebcb2089e02c998192a5af8c745e8470fe81d249fa64087c6ac6')

build() {
  cd $pkgbase-$pkgver

  # Arch ships Haskell libraries as shared objects only: build them that
  # way, and link the user's configuration with -dynamic too.
  runhaskell Setup configure -O \
    --enable-shared \
    --enable-executable-dynamic \
    --disable-library-vanilla \
    --prefix=/usr \
    --dynlibdir=/usr/lib \
    --docdir=/usr/share/doc/$pkgbase --datasubdir=$pkgbase \
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
  cd $pkgbase-$pkgver
  runhaskell Setup test --show-details=direct
}

package_rivermonad() {
  optdepends+=('rivermonad-dotfiles: a complete desktop configuration (run rivermonad-setup)')

  cd $pkgbase-$pkgver

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
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# The desktop of examples/dotfiles. A package must not write in /home, so
# the files go to /usr/share/rivermonad/dotfiles and each user copies them
# to ~/.config with rivermonad-setup (the session's first run says so).
package_rivermonad-dotfiles() {
  pkgdesc='A complete river + rivermonad desktop: bar, living wallpaper, widgets, launcher, screenshots'
  arch=('any')
  depends=("rivermonad=$pkgver" 'waymobar>=0.2.0' 'bgmonad' 'hasklets' 'shotlet'
           'foot' 'fuzzel' 'mako' 'kanshi' 'libnotify'
           'grim' 'slurp' 'swappy' 'wl-clipboard' 'wf-recorder'    # shot, screenrec
           'wtype' 'unicode-emoji'                                 # emoji
           'wireplumber'                                           # volume keys (wpctl)
           'xdg-desktop-portal-wlr' 'xdg-desktop-portal-gtk'
           'inter-font' 'noto-fonts-emoji' 'ttf-material-symbols-variable')
  optdepends=('powerline-fonts: Ubuntu Mono derivative Powerline, the font of foot.ini'
              'firefox: the browser on Super+B'
              'waybar: the alternative bar (needs the rivermonad modules, see contrib/waybar)')

  cd $pkgbase-$pkgver/examples/dotfiles

  local dest="$pkgdir/usr/share/rivermonad/dotfiles"
  install -d "$dest"
  cp -r --preserve=mode config local "$dest/"
  # The build scripts compile against a source checkout; with the packaged
  # libraries plain ghc is used.
  rm "$dest"/config/{rivermonad,waymobar,bgmonad}/build

  install -Dm755 install.sh "$pkgdir/usr/bin/rivermonad-setup"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 ../../LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
