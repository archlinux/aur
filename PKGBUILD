# Maintainer: Cody P Schafer <archlinux at codyps.com>
_bpn=bustle
pkgname=${_bpn}-git
pkgver=0.5.4.r2.g0a426c3
pkgrel=2
pkgdesc="A dbus profiler"
arch=(x86_64)
url="https://www.freedesktop.org/wiki/Software/Bustle/"
license=('GPLv3')
groups=()
depends=(ghc happy alex gtk2hs-buildtools haskell-cairo haskell-dbus haskell-glib haskell-gtk haskell-mtl haskell-pango haskell-parsec haskell-setlocale haskell-pcap haskell-hgettext haskell-gio)
makedepends=(git)
provides=(${_bpn})
conflicts=(${_bpn})
replaces=()
backup=()
options=(!emptydirs)
install=
source=($pkgname::git+https://anongit.freedesktop.org/git/bustle.git)
md5sums=(SKIP)

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/^bustle-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$pkgname"
  runhaskell Setup configure -O --prefix=/usr "--docdir=/usr/share/doc/${pkgname}" --datasubdir="$pkgname"
  runhaskell Setup build
}

_ghcver_set() {
  local _i
  _ghcver=`pacman -Q ghc | cut -f2 -d\  | cut -f1 -d-`
  depends[0]="ghc=$_ghcver"
}

package() {
  _ghcver_set
  cd "$pkgname"

  runhaskell Setup copy --destdir=${pkgdir}
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  rm -f ${pkgdir}/usr/share/doc/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:
