# Maintainer: Application-Maker <Application-Maker.Uinwad@erine.email>
# Contributor: lukeshu <lukeshu@lukeshu.com>

_hkgname=ShellCheck
_pkgname=shellcheck
pkgname=$_pkgname-git
pkgver=0.10.0.r68.gd3001f3
pkgrel=1
provides=("$_pkgname")
conflicts=("$_pkgname")
pkgdesc="Shell script analysis tool"
pkgdesc+=" (latest git commit)"
url="https://www.shellcheck.net"
license=("GPL")
arch=('x86_64')
depends=('ghc-libs' 'haskell-aeson' 'haskell-diff' 'haskell-fgl' 'haskell-quickcheck'
         'haskell-regex-tdfa')
makedepends=('ghc' 'pandoc' 'uusi')
source=("git+https://github.com/koalaman/shellcheck")
sha512sums=('SKIP')

pkgver() {
    cd $_pkgname
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd $_pkgname
    gen-setup
}

build() {
    cd $_pkgname

    runhaskell Setup configure -O --enable-shared --enable-debug-info --enable-executable-dynamic --disable-library-vanilla \
        --prefix=/usr --docdir=/usr/share/doc/$_pkgname --datasubdir=$_pkgname --enable-tests \
        --dynlibdir=/usr/lib --libsubdir=\$compiler/site-local/\$pkgid \
        --ghc-option=-optl-Wl\,-z\,relro\,-z\,now \
        --ghc-option='-pie'
    runhaskell Setup build $MAKEFLAGS
    runhaskell Setup register --gen-script
    runhaskell Setup unregister --gen-script
    sed -i -r -e "s|ghc-pkg.*update[^ ]* |&'--force' |" register.sh
    sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh

    ./manpage
}

check() {
    cd $_pkgname
    # https://github.com/koalaman/shellcheck/issues/2677
    runhaskell Setup test --show-details=direct || echo "Tests failed"
}

package() {
    cd $_pkgname

    install -D -m644 $_pkgname.1    "${pkgdir}/usr/share/man/man1/${pkgname}.1"
    install -D -m744 register.sh   "${pkgdir}/usr/share/haskell/register/${pkgname}.sh"
    install -D -m744 unregister.sh "${pkgdir}/usr/share/haskell/unregister/${pkgname}.sh"
    runhaskell Setup copy --destdir="${pkgdir}"
    rm -f "$pkgdir"/usr/share/doc/$_pkgname/LICENSE
}
