# Maintainer: Luke Shumaker <lukeshu@lukeshu.com>
# Maintainer (Arch:shellcheck): Felix Yan <felixonmars@archlinux.org>
# Contributor (Arch:shellcheck): Arch Haskell Team <arch-haskell@haskell.org>

_hkgname=ShellCheck
_pkgname=shellcheck
_pkgver=0.4.6
_gitrev='51e6bf809fc7157b60bdb2c499d6b769b48d0759'
_gitdate='20171108'
pkgname=$_pkgname-git
pkgver="$_pkgver.git$_gitdate"
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
pkgrel=1
pkgdesc="Shell script analysis tool"
pkgdesc+=" (latest git commit)"
url="http://www.shellcheck.net"
license=("GPL3") # NB: community/shellcheck is erroneously GPL2
arch=('i686' 'x86_64')
depends=('ghc' "haskell-json" "haskell-mtl" "haskell-parsec" "haskell-quickcheck"
         "haskell-regex-tdfa")
source=("$_pkgname-$_gitrev.zip::https://github.com/koalaman/$_pkgname/archive/$_gitrev.tar.gz")
sha512sums=('67a70c91ae7d7f01e522438f54f26db41567a1a6a59fad10739b53960a3469af768e38dd9e610ee188f4422fecf493bf11bf672c95760250c62f78a779eaf2de')


build() {
    cd "${srcdir}/${_pkgname}-${_gitrev}"

    # NB: community/shellcheck doesn't --disable-library-vanilla; but
    # it's required to build with current ghc/libraries.
    runhaskell Setup configure -O \
        --enable-shared --enable-executable-dynamic --disable-library-vanilla \
        --prefix=/usr --docdir="/usr/share/doc/${_pkgname}" \
        --dynlibdir=/usr/lib --libsubdir=\$compiler/site-local/\$pkgid
    runhaskell Setup build
    runhaskell Setup haddock --hoogle --html
    runhaskell Setup register --gen-script
    runhaskell Setup unregister --gen-script
    sed -i -r -e "s|ghc-pkg.*update[^ ]* |&'--force' |" register.sh
    sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}

package() {
    cd "${srcdir}/${_pkgname}-${_gitrev}"

    install -D -m744 register.sh   "${pkgdir}/usr/share/haskell/register/${_pkgname}.sh"
    install -D -m744 unregister.sh "${pkgdir}/usr/share/haskell/unregister/${_pkgname}.sh"
    install -d -m755 "${pkgdir}/usr/share/doc/ghc/html/libraries"
    ln -s "/usr/share/doc/${_pkgname}/html" "${pkgdir}/usr/share/doc/ghc/html/libraries/${_hkgname}"
    runhaskell Setup copy --destdir="${pkgdir}"
    rm -f "${pkgdir}/usr/share/doc/${_pkgname}/LICENSE"

    # Remove static libs
    find "$pkgdir"/usr/lib -name "*.a" -delete
}
