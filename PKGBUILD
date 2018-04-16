# Maintainer: Leif Warner <abimelech@gmail.com>
pkgname=taffybar
pkgver=1.0.1
pkgrel=1
license=('BSD3')
pkgdesc="A desktop bar similar to xmobar, but with more GUI"
url="http://github.com/travitch/taffybar"
arch=('i686' 'x86_64')
depends=("ghc"
         "haskell-alsa-mixer"
         "haskell-configfile"
         "haskell-either"
         "haskell-hstringtemplate"
         "haskell-http"
         "haskell-x11"
         "haskell-cairo"
         "haskell-dbus"
         "haskell-dyre"
         "haskell-enclosed-exceptions"
         "haskell-gtk"
         "haskell-gtk-traymanager"
         "haskell-mtl"
         "haskell-multimap"
         "haskell-network"
         "haskell-network-uri"
         "haskell-old-locale"
         "haskell-parsec"
         "haskell-rate-limit"
         "haskell-safe"
         "haskell-split"
         "haskell-stm"
         "haskell-text"
         "haskell-time-locale-compat"
         "haskell-tuple"
         "haskell-utf8-string"
         "haskell-xdg-basedir"
         "haskell-xml-helpers"
         "xmonad"
         "xmonad-contrib")
install=taffybar.install
source=("http://hackage.haskell.org/packages/archive/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.gz"
        "dynamic-compilation.patch"
        "taffybar.install")

sha256sums=('1632917430972d656235c4f27b485d0ea09c5df4089088281ba523380e3efda9'
            'ff90b6e3d05b3bb94cfc2365708bbabbb96fd9a9a4919c0face6f8d2b69037e7'
            'bcbdbd6d8644fda65102eb7b033b7e0b27f5a2a1f4de0d832cf7914c23c3496e')

# PKGBUILD functions

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    # See https://github.com/willdonnelly/dyre/issues/5
    patch -p1 -i ../dynamic-compilation.patch
    #sed -i -e 's/Dyre.ghcOpts = \["-threaded", "-rtsopts"\]/Dyre.ghcOpts = \["-threaded", "-rtsopts", "-dynamic"\]/'  src/System/Taffybar.hs
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

    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm 644 CHANGELOG.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    install -Dm 644 taffybar.hs.example -t "${pkgdir}/usr/share/doc/${pkgname}"

    rm -f "${pkgdir}/usr/share/doc/${pkgname}/LICENSE"
}
