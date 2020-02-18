# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Arch Haskell Team <arch-haskell@haskell.org>

_pkgname=pandoc
pkgname=$_pkgname-sile-git
_pkgver=2.9.1.1
pkgver=2.9.1.1.r8.g4ccd9b69e
pkgrel=0.1
pkgdesc='Conversion between markup formats (sile fork)'
url='https://pandoc.org'
license=('GPL')
arch=('x86_64')
depends=('ghc-libs' 'haskell-http' 'haskell-juicypixels' 'haskell-sha' 'haskell-aeson'
         'haskell-aeson-pretty' 'haskell-attoparsec' 'haskell-base-compat'
         'haskell-base64-bytestring' 'haskell-blaze-html' 'haskell-blaze-markup'
         'haskell-case-insensitive' 'haskell-cmark-gfm' 'haskell-data-default' 'haskell-doclayout'
         'haskell-doctemplates' 'haskell-emojis' 'haskell-exceptions' 'haskell-glob'
         'haskell-haddock-library' 'haskell-ipynb' 'haskell-jira-wiki-markup' 'haskell-skylighting'
         'haskell-skylighting-core' 'haskell-hslua' 'haskell-hslua-module-system'
         'haskell-hslua-module-text' 'haskell-http-client' 'haskell-syb' 'haskell-hsyaml'
         'haskell-http-client-tls' 'haskell-http-types' 'haskell-safe' 'haskell-split'
         'haskell-texmath' 'haskell-network' 'haskell-pandoc-types' 'haskell-random'
         'haskell-scientific' 'haskell-tagsoup' 'haskell-temporary' 'haskell-text-conversions'
         'haskell-network-uri' 'haskell-unicode-transforms' 'haskell-unordered-containers'
         'haskell-zip-archive' 'haskell-vector' 'haskell-xml' 'haskell-zlib')
optdepends=('pandoc-citeproc: for citation rendering with pandoc-citeproc filter'
            'pandoc-crossref: for numbering figures, equations, tables and cross-references to them with pandoc-crossref filter'
            'texlive-core: for pdf output')
conflicts=('haskell-pandoc')
replaces=('haskell-pandoc')
makedepends=('ghc' 'haskell-diff' 'haskell-tasty' 'haskell-tasty-hunit' 'haskell-tasty-lua'
             'haskell-tasty-quickcheck' 'haskell-tasty-golden' 'haskell-quickcheck'
             'haskell-executable-path')
source=("git://github.com/alerque/$_pkgname.git#branch=sile-${_pkgver}")
sha512sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$_pkgname"
    # TODO: find a better solution
    sed -i "s|let env' = dynlibEnv ++ |let env' = dynlibEnv ++ [(\"LD_LIBRARY_PATH\", \"$PWD/dist/build\")] ++ |" test/Tests/Command.hs
}

build() {
    cd "$_pkgname"
    runhaskell Setup configure -O --enable-shared --enable-executable-dynamic --disable-library-vanilla \
        --prefix=/usr --docdir="/usr/share/doc/${pkgbase}" --datasubdir="$_pkgname" --enable-tests \
        --dynlibdir=/usr/lib --libsubdir=\$compiler/site-local/\$pkgid \
            -f-trypandoc -f-embed_data_files -f-static
    runhaskell Setup build
    runhaskell Setup register --gen-script
    runhaskell Setup unregister --gen-script
    sed -i -r -e "s|ghc-pkg.*update[^ ]* |&'--force' |" register.sh
    sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}

check() {
    cd "$_pkgname"
    LC_CTYPE=en_US.UTF-8 runhaskell Setup test || warning "Tests failed"
}

package() {
    cd "$_pkgname"
    install -D -m744 register.sh   "${pkgdir}/usr/share/haskell/register/${_pkgname}.sh"
    install -D -m744 unregister.sh "${pkgdir}/usr/share/haskell/unregister/${_pkgname}.sh"
    runhaskell Setup copy --destdir="${pkgdir}"
    rm "${pkgdir}/usr/share/doc/${_pkgname}/COPYING.md"
    install -Dm644 man/pandoc.1 "${pkgdir}"/usr/share/man/man1/pandoc.1
}
