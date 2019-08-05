# Maintainer: Solomon Choina <shlomochoina@gmail.com
# Maintainer: Leif Warner <abimelech@gmail.com>
pkgname=taffybar
pkgver=3.2.1
pkgrel=3
license=('BSD3')
pkgdesc="A desktop bar similar to xmobar, but with more GUI"
url="http://github.com/travitch/taffybar"
arch=('i686' 'x86_64')
depends=("ghc-libs"
         "haskell-alsa-mixer"
         "haskell-configfile"
         "haskell-either"
         "haskell-gi-pango"
         "haskell-broadcast-chan"
         "haskell-http-client"
         "haskell-http-types"
         "haskell-http-client-tls"
         "haskell-gi-cairo-connector"
         "haskell-gi-cairo-render"
         "haskell-hstringtemplate"
         "haskell-http"
         "haskell-x11"
         "haskell-scotty"
         "haskell-dyre"
         "haskell-enclosed-exceptions"
         "haskell-dbus"
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
         "haskell-gi-cairo"
         "haskell-gi"
         "haskell-gi-base"
         "haskell-utf8-string"
         "haskell-xdg-basedir"
         "haskell-dbus-hslogger"
         "haskell-xml-helpers"
         "haskell-status-notifier-item"
         "haskell-gi-gdkx11"
         "haskell-gi-gtk"
         "haskell-gtk-strut"
         "gtk-sni-tray"
         "haskell-gi-gtk-hs"
         "xmonad"
         "xmonad-contrib")
makedepends=('ghc')
install=taffybar.install
source=("https://github.com/taffybar/taffybar/archive/v${pkgver}.tar.gz"
        "dynamic-compilation.patch"
        "taffybar.install"
        "taffybar.service"
        "https://raw.githubusercontent.com/taffybar/taffybar/13b32fc2bc62129093494e939339a979d641691c/xmonad.hs.example"
        )

sha256sums=('51ca3f4dd505a9d5fb03a3150898bcd090e037ca851f04a4ce4185135bf537ca'
            'ff90b6e3d05b3bb94cfc2365708bbabbb96fd9a9a4919c0face6f8d2b69037e7'
            '554340a052abecb78fbb959d1a05b8f4f4db947fc151e7f0f8c49f2300f1ab6d'
            'f4a08e887ba527a24f4cecc22393023bf7230172cc76f840ddfc5cfc54182a7e'
            '1a8ca4f177891941960585e228d5386ea9f120a1bb12ac0a956200de839032cb')

# PKGBUILD functions

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    # See https://github.com/willdonnelly/dyre/issues/5
    #sed -i -e 's/Dyre.ghcOpts = \["-threaded", "-rtsopts"\]/Dyre.ghcOpts = \["-threaded", "-rtsopts", "-dynamic"\]/'  src/System/Taffybar.hs
    patch -p1 -i ../dynamic-compilation.patch
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    
    runhaskell Setup configure -O --enable-shared --disable-library-vanilla \
        --enable-executable-dynamic \
        --prefix=/usr --docdir="/usr/share/doc/${pkgname}" \
        --dynlibdir=/usr/lib  --libsubdir=\$compiler/site-local/\$pkgid \
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
    install -Dm 644 ${srcdir}/taffybar.service -t "${pkgdir}/usr/lib/systemd/user"
    install -Dm 644 ${srcdir}/xmonad.hs.example -t "{$pkgdir}/usr/share/doc/${pkgname}"

    rm -f "${pkgdir}/usr/share/doc/${pkgname}/LICENSE"
}
