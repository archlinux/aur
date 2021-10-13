# Maintainer Thiago Mota <thiagomota510@gmail.com>

pkgname=xmobar-dynamic
pkgver=0.39
pkgrel=16
pkgdesc='Minimalistic Text Based Status Bar. Compiled using -dynamic flag.'
url='https://hackage.haskell.org/package/xmobar'
license=('BSD')
arch=('x86_64')
provides=('xmobar')
conflicts=('xmobar')
depends=('libxft' 'libxinerama' 'libxrandr' 'libxpm' 'ghc-libs' 'haskell-x11'
         'haskell-x11-xft' 'haskell-utf8-string' 'haskell-network-uri'
         'haskell-hinotify' 'haskell-parsec-numbers'
         'haskell-regex-compat' 'haskell-old-locale'
         'haskell-http' 'haskell-dbus' 'haskell-libmpd' 'haskell-cereal' 'haskell-netlink'
         'haskell-async' 'haskell-aeson'
         'haskell-timezone-olson' 'haskell-timezone-series' 'alsa-lib'
         'haskell-extensible-exceptions' 'haskell-http-conduit'
         'haskell-http-types' 'haskell-http-client-tls' 'haskell-alsa-core' 'haskell-alsa-mixer')
makedepends=('ghc' 'uusi' 'haskell-hspec' 'haskell-temporary')
source=(https://github.com/jaor/xmobar/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz
        dynamic.patch)
sha512sums=('a47d7cf16fdea4bece1d622db1c2ac76acc9d9369043eec6ff41a22c1f59c9757932fbcebfe804a636c783e9a66317bb3aaf72edc4a373c48e7db3c9292d9658'
            '7a8d6f157716c41f1e0f5749b79477fb560bb36c8f0eb244f9659a4e17918fb792b81e0622be00429445186e2a3f89caaa0bbdd30d3bd52975472e64502460f5')

prepare() {
  cd xmobar-${pkgver}
  patch -i "${srcdir}/dynamic.patch" src/Xmobar/App/Compile.hs
  uusi -u base xmobar.cabal
}

build() {
  cd xmobar-${pkgver}

  _flags=(with_xft with_utf8 with_inotify with_mpd with_alsa with_nl80211
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
  cd xmobar-${pkgver}
  runhaskell setup test
}

package() {
  cd xmobar-${pkgver}
  install -Dm 744 register.sh   "${pkgdir}/usr/share/haskell/register/xmobar.sh"
  install -Dm 744 unregister.sh "${pkgdir}/usr/share/haskell/unregister/xmobar.sh"
  runhaskell setup copy --destdir="${pkgdir}"
  install -Dm 644 license -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
