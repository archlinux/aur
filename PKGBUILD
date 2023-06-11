# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributer: Vlad M. <vlad@archlinux.net>
# Contributer: euclio
# Contributer: Cedric Girard <girard.cedric@gmail.com>
# Contributer: Colin Woodbury <colingw@gmail.com>

pkgname=xmobar-git
pkgver=0.46.r5.gb5e397b
pkgrel=1
pkgdesc='Minimalistic Text Based Status Bar'
url='https://codeberg.org/xmobar/xmobar'
license=('BSD')
arch=('x86_64')
depends=(
  alsa-lib
  ghc-libs
  haskell-aeson
  haskell-alsa-core
  haskell-alsa-mixer
  haskell-async
  haskell-cairo
  haskell-cereal
  haskell-colour
  haskell-dbus
  haskell-extensible-exceptions
  haskell-hinotify
  haskell-http
  haskell-http-client-tls
  haskell-http-conduit
  haskell-http-types
  haskell-libmpd
  haskell-netlink
  haskell-network-uri
  haskell-old-locale
  haskell-pango
  haskell-parsec-numbers
  haskell-regex-compat
  haskell-timezone-olson
  haskell-timezone-series
  haskell-utf8-string
  haskell-x11
  haskell-x11-xft
  libxft
  libxinerama
  libxpm
  libxrandr
  pango
)
makedepends=('git' 'ghc' 'haskell-hspec' 'haskell-temporary')
conflicts=('xmobar')
provides=('xmobar')
source=(${pkgname}::git+https://codeberg.org/xmobar/xmobar.git
        dynamic-compilation.patch)
sha512sums=('SKIP'
            '15db3e27d1ff957e26e706e4c67cec6e43d89f5a39cd6d81ddb5ae8426e32d938494fbba39fa322461d992a95d2e522c10b186a1ca2c5c3e996f944b6e6ef7c4')

pkgver() {
  cd ${pkgname}
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed -E 's|\.r0\.\w+$||'
}

prepare() {
  cd ${pkgname}
  patch -p1 -i "${srcdir}/dynamic-compilation.patch"
}

build() {
  cd ${pkgname}

  _flags=(with_xft with_inotify with_mpd with_alsa with_nl80211
          with_datezone with_mpris with_dbus with_xpm with_threaded
          with_rtsopts with_weather)

  runhaskell setup configure -O \
    --enable-shared \
    --enable-executable-dynamic \
    --disable-library-vanilla \
    --prefix=/usr \
    --dynlibdir=/usr/lib \
    --libsubdir=\$compiler/site-local/\$pkgid --ghc-option=-fllvm \
    --ghc-option=-optl-Wl\,-z\,relro\,-z\,now \
    --ghc-option='-pie' \
    --flags="${_flags[*]}" \
    --enable-tests
  runhaskell setup build
  runhaskell setup register --gen-script
  runhaskell setup unregister --gen-script
  sed -i -r -e "s|ghc-pkg.*update[^ ]* |&'--force' |" register.sh
  sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}

check() {
  cd ${pkgname}
  runhaskell setup test
}

package() {
  cd ${pkgname}
  install -Dm 744 register.sh   "${pkgdir}/usr/share/haskell/register/xmobar.sh"
  install -Dm 744 unregister.sh "${pkgdir}/usr/share/haskell/unregister/xmobar.sh"
  runhaskell setup copy --destdir="${pkgdir}"
  install -Dm 644 license -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
