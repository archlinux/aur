# Maintainer: Leif Warner <abimelech@gmail.com>
pkgname=taffybar
pkgver=0.4.6
pkgrel=1
license=('BSD3')
pkgdesc="A desktop bar similar to xmobar, but with more GUI"
url="http://github.com/travitch/taffybar"
arch=('i686' 'x86_64')
depends=("ghc"
         "haskell-hstringtemplate"
         "haskell-http"
         "haskell-x11"
         "haskell-cairo"
         "haskell-dbus"
         "haskell-dyre"
         "haskell-enclosed-exceptions"
         "haskell-gtk2"
         "haskell-gtk-traymanager"
         "haskell-mtl"
         "haskell-network"
         "haskell-network-uri"
         "haskell-old-locale"
         "haskell-parsec"
         "haskell-safe"
         "haskell-split"
         "haskell-stm"
         "haskell-text"
         "haskell-time-locale-compat"
         "haskell-utf8-string"
         "haskell-xdg-basedir"
         "xmonad"
         "xmonad-contrib")
source=("http://hackage.haskell.org/packages/archive/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.gz"
        "dynamic-compilation.patch"
        "ghc_8.2.patch")

sha256sums=('620918469d79d33067808114bdf8d4d6f5a5ae6d77ff672a37ea04ecc5e0caf5'
            'ab4f83891b764938d4750e7a1835761028b3c8761f7f6089053b3696325851d3'
            '127746e08c91035adb38c9e6f046bd7a5377d95c9cb61d81a186e3e20f5dd808')

# PKGBUILD functions

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    # Submitted upstream: https://github.com/travitch/taffybar/pull/247
    patch -p1 -i ../ghc_8.2.patch
    #sed -i -e "s/time >= 1.4 && < 1.7/time >= 1.4 \&\& < 1.9/" taffybar.cabal
    # See https://github.com/willdonnelly/dyre/issues/5
    patch -p1 -i ../dynamic-compilation.patch
    #sed -i -e 's/Dyre.ghcOpts = ["-threaded", "-rtsopts"]/Dyre.ghcOpts = \["-threaded", "-rtsopts", "-dynamic"\]/'  src/System/Taffybar.hs
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    
    runhaskell Setup configure -O --enable-shared --disable-library-vanilla \
        --enable-executable-dynamic \
        --prefix=/usr --docdir="/usr/share/doc/${pkgname}" \
        --libsubdir=\$compiler/site-local/\$pkgid \
            -fnetwork-uri
    runhaskell Setup build
    runhaskell Setup register --gen-script
    runhaskell Setup unregister --gen-script
    sed -i -r -e "s|ghc-pkg.*update[^ ]* |&'--force' |" register.sh
    sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    
    install -Dm 744 register.sh   "${pkgdir}/usr/share/haskell/register/${pkgname}.sh"
    install -Dm 744 unregister.sh "${pkgdir}/usr/share/haskell/unregister/${pkgname}.sh"

    runhaskell Setup copy --destdir="${pkgdir}"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    rm -f "${pkgdir}/usr/share/doc/${pkgname}/LICENSE"
}
