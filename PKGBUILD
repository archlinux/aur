# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributer: Vlad M. <vlad@archlinux.net>
# Contributer: euclio
# Contributer: Cedric Girard <girard.cedric@gmail.com>
# Contributer: Colin Woodbury <colingw@gmail.com>

pkgname=xmobar-git
pkgver=0.36.r24.ga071c2a
pkgrel=1
pkgdesc='Minimalistic Text Based Status Bar'
url='https://hackage.haskell.org/package/xmobar'
license=('custom:BSD3')
arch=('x86_64')
depends=('libxft' 'libxinerama' 'libxrandr' 'libxpm' 'ghc-libs' 'haskell-x11'
         'haskell-x11-xft' 'haskell-utf8-string' 'haskell-network-uri'
         'haskell-hinotify' 'haskell-stm' 'haskell-parsec' 'haskell-parsec-numbers'
         'haskell-mtl' 'haskell-regex-base' 'haskell-regex-compat'
         'haskell-http' 'haskell-dbus' 'haskell-libmpd' 'haskell-cereal' 'haskell-netlink'
         'haskell-text' 'haskell-async' 'haskell-aeson' 'haskell-hspec'
         'haskell-timezone-olson' 'haskell-timezone-series' 'alsa-lib'
         'haskell-extensible-exceptions' 'haskell-http-conduit' 'haskell-temporary'
         'haskell-http-types' 'haskell-http-client-tls' 'haskell-alsa-core' 'haskell-alsa-mixer'
         'haskell-iwlib')
makedepends=('git' 'ghc')
conflicts=('xmobar')
provides=('xmobar')
source=(${pkgname}::git+https://github.com/jaor/xmobar.git)
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname}
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed -E 's|\.r0\.\w+$||'
}

build() {
  cd ${pkgname}

  _flags=(with_xft with_utf8 with_inotify with_mpd with_alsa with_nl80211
          with_datezone with_mpris with_dbus with_xpm with_threaded
          with_rtsopts with_weather)

  runhaskell setup configure -O \
    --enable-shared \
    --enable-executable-dynamic \
    --disable-library-vanilla \
    --prefix=/usr \
    --dynlibdir=/usr/lib \
    --libsubdir=\$compiler/site-local/\$pkgid \
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
