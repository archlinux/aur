# Maintainer : Damien Flament <damien.flament___at___gmx___dot___com>:w
# Contributor: Daniel Nagy <danielnagy___at___gmx___dot___de>

pkgname=cabal2arch
pkgver=1.2
pkgrel=3
pkgdesc="Create Arch Linux packages from Cabal packages."
arch=('i686' 'x86_64')
url="http://github.com/archhaskell/${pkgname}"
license=("BSD3")
depends=()
makedepends=("ghc"
             "haskell-archlinux"
             "haskell-cmdargs"
             "haskell-mtl")
provides=()
conflicts=()
replaces=()
backup=()
options=('strip' 'staticlibs')
install=
source=("https://github.com/archhaskell/${pkgname}/archive/v${pkgver}.tar.gz"
        'Make_build_pass.patch')
noextract=()
md5sums=('68f08d55400a31927e63942f0ca5e462'
         'b22ef0e1bcc21f81b4dbd34e9599d441')
validpgpkeys=()

prepare() {
  cd ${pkgname}-${pkgver}

  patch -Np1 -i "${srcdir}/Make_build_pass.patch"
}

build() {
    cd ${pkgname}-${pkgver}

    runhaskell Setup configure --ghc -O \
                               --prefix='/usr' \
                               --libsubdir='$compiler/site-local/$pkgid' \
                               --docdir='$prefix/share/doc/$pkg' \
                               --datadir='$prefix/share' \
                               --datasubdir='$pkg'
    runhaskell Setup build
}

package() {
    cd ${pkgname}-${pkgver}

    install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

    runhaskell Setup copy --destdir=${pkgdir}

    rm -f ${pkgdir}/usr/share/doc/${pkgname}/LICENSE
    rmdir --ignore-fail-on-non-empty -p ${pkgdir}/usr/share/doc/${pkgname}
}
