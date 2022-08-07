# Maintainer: Albert Graef <aggraef@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Arch Haskell Team <arch-haskell@haskell.org>

# Old 0.5 language-c version, required for pure-gen package.

_hkgname=language-c
pkgname=haskell-language-c5
pkgver=0.5.0
pkgrel=6
pkgdesc="Analysis and generation of C code"
url="http://visq.github.io/language-c/"
license=("custom:BSD3")
arch=('i686' 'x86_64')
makedepends=('happy' 'alex')
depends=("ghc" "haskell-syb")
provides=('haskell-language-c')
conflicts=('haskell-language-c')
source=("http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz"
	"ghc-8+.patch"
	"gcc-11.patch"
	"float128.patch")
sha256sums=('86d58bc017a7bba157fc4d5d0ab9e3a3d3f3a2f98bfe46b5b0d5d72a0f5d2222'
            'c718fd258a7a227aaad14f6abe8e6742e81c57f83b63b95bde1a3bfba71542b0'
            'fcfce6b3f6b701398bbd18ddc1b593b8136d147b2ace8c61284751939dcac858'
            '724e6eecb614ccaac16ce7d5e764a6514cbfc5974342419283d18667e0c0467a')

prepare() {
    cd "${srcdir}/${_hkgname}-${pkgver}"
    patch -p2 -i ../ghc-8+.patch
    patch -p2 -i ../gcc-11.patch
    patch -p2 -i ../float128.patch
}

build() {
    cd "${srcdir}/${_hkgname}-${pkgver}"
    
    rm -fr dist

    runhaskell Setup configure -O --enable-shared --enable-executable-dynamic --disable-library-vanilla \
        --prefix=/usr --docdir="/usr/share/doc/${pkgname}" \
        --libsubdir=\$compiler/site-local/\$pkgid \
            -fseparatesyb -fusebytestrings -fsplitbase
    runhaskell Setup build
    runhaskell Setup haddock --hoogle --html
    runhaskell Setup register --gen-script
    runhaskell Setup unregister --gen-script
    sed -i -r -e "s|ghc-pkg.*update[^ ]* |&'--force' |" register.sh
    sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}

package() {
    cd "${srcdir}/${_hkgname}-${pkgver}"
    
    install -D -m744 register.sh   "${pkgdir}/usr/share/haskell/register/${pkgname}.sh"
    install -D -m744 unregister.sh "${pkgdir}/usr/share/haskell/unregister/${pkgname}.sh"
    install -d -m755 "${pkgdir}/usr/share/doc/ghc/html/libraries"
    ln -s "/usr/share/doc/${pkgname}/html" "${pkgdir}/usr/share/doc/ghc/html/libraries/${_hkgname}"
    runhaskell Setup copy --destdir="${pkgdir}"
    install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    rm -f "${pkgdir}/usr/share/doc/${pkgname}/LICENSE"
}
