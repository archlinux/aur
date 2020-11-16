# Maintainer: Thomas Girod <tgirod@altu.fr>

_name=Tidal
pkgname=haskell-tidal-git
pkgver=latest
pkgrel=1
pkgdesc="A domain specific language for live coding pattern."
arch=('x86_64')
url="https://tidalcycles.org/"
license=('GPL3')
groups=('pro-audio')
depends=('ghc' 'ghc-libs' 'glibc' 'haskell-bifunctors' 'haskell-clock'
'haskell-colour' 'haskell-hosc' 'haskell-mwc-random' 'haskell-network'
'haskell-primitive' 'haskell-random' 'haskell-vector' 'supercollider')
checkdepends=('haskell-microspec')
optdepends=('sc3-plugins: Examples using special UGens')
makedepends=('git')
conflicts=('tidalcycles' 'haskell-tidal')
replaces=('tidalcycles' 'haskell-tidal')
source=("${pkgname}::git+https://github.com/tidalcycles/Tidal.git")
sha512sums=('SKIP')

build() {
  cd "$pkgname"
  runhaskell Setup configure -O \
                             --enable-shared \
                             --enable-executable-dynamic \
                             --disable-library-vanilla \
                             --prefix=/usr \
                             --docdir="/usr/share/doc/${pkgname}" \
                             --enable-tests \
                             --dynlibdir=/usr/lib \
                             --libsubdir=\$compiler/site-local/\$pkgid
  runhaskell Setup build $MAKEFLAGS
  runhaskell Setup register --gen-script
  runhaskell Setup unregister --gen-script
  sed -i -r -e "s|ghc-pkg.*update[^ ]* |&'--force' |" register.sh
  sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}

check() {
  cd "$pkgname"
  runhaskell Setup test
}

package() {
  cd "$pkgname"
  runhaskell Setup copy --destdir="${pkgdir}"
  install -vDm 744 register.sh "$pkgdir/usr/share/haskell/register/$pkgname.sh"
  install -vDm 744 unregister.sh "$pkgdir/usr/share/haskell/unregister/$pkgname.sh"
}
