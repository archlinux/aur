# Maintainer: Vlad M. <vlad@archlinux.net>
# Contributer: euclio
# Contributer: Cedric Girard <girard.cedric@gmail.com>
# Contributer: Colin Woodbury <colingw@gmail.com>

pkgname=xmobar-git
pkgver=0.23.1.r12.g1b46609
pkgrel=2
pkgdesc="A minimal status bar for the XMonad Window Manager"
arch=('i686' 'x86_64')
url="http://projects.haskell.org/xmobar/"
license=('custom:BSD3')
makedepends=(
  'ghc'
  'haskell-x11'
  'haskell-x11-xft'
  'haskell-mtl'
  'haskell-parsec'
  'haskell-stm'
  'haskell-utf8-string'
  'haskell-regex-compat'
  'haskell-http'
  'git')
depends=('wireless_tools' 'gmp' 'libxml2' 'libxrandr' 'libxinerama' 'libxft')
optdepends=(
  'haskell-alsa-mixer: Enables Volume plugin.'
  'haskell-dbus: Control xmobar with DBUS.'
  'haskell-libmpd: Enables MPD plugin.'
  'haskell-hinotify: Support for inotify.'
  'haskell-timezone-olson: With haskell-timezone-series, enables DateZone plugin'
  'haskell-timezone-series: With haskell-timezone-olson, enables DateZone plugin')
conflicts=('xmobar' 'xmobar-darcs')
_gitroot="https://github.com/jaor/xmobar.git"
source=("${pkgname}::git+${_gitroot}")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname}"

  # XMOBAR INSTALLATION
  # Several possible setup options are offered below. Choose whichever is
  # best for you. Uncomment and recomment as necessary.
  # See http://projects.haskell.org/xmobar/#optional-features for more information.

  # Default setup.
  runhaskell Setup configure --flags="with_xft with_iwlib" --prefix=/usr

  # MPD Support. Must have `haskell-libmpd` installed.
  # runhaskell Setup configure --flags="with_xft with_iwlib with_mpd" --prefix=/usr

  # Alsa Support. Must have `haskell-alsa-mixer` installed.
  # Be warned, its dependencies can be troublesome.
  # runhaskell Setup configure --flags="with_xft with_iwlib with_alsa" --prefix=/usr

  # If you have _all_ of the optdepends installed, and want all extentions:
  # runhaskell Setup configure --flags="all_extensions" --prefix=/usr

  runhaskell Setup build
}

package() {
  cd "${pkgname}"

  runhaskell Setup copy --destdir=${pkgdir}
  install -Dm644 license ${pkgdir}/usr/share/licenses/$pkgname/BSD3
}
