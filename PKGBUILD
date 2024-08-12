# Maintainer: Illia Shkroba <is at pjwstk dot edu dot pl>
# Contributor: Illia Shkroba <is at pjwstk dot edu dot pl>

pkgname=pfile
pkgver=0.1.0.1
pkgrel=1
pkgdesc="CLI program for profiles management."
url="https://github.com/illia-shkroba/pfile"
license=("BSD-3-Clause")
arch=('x86_64')
depends=('ghc-libs' 'haskell-aeson' 'haskell-aeson-pretty' 'haskell-directory'
  'haskell-filepath' 'haskell-hunit' 'haskell-mtl'
  'haskell-optparse-applicative' 'haskell-protolude' 'haskell-temporary'
  'haskell-transformers' 'haskell-unordered-containers')
makedepends=('ghc' 'uusi')
checkdepends=('haskell-hspec' 'haskell-hunit' 'haskell-tasty'
  'haskell-tasty-hspec' 'haskell-tasty-quickcheck')
install="$pkgname.install"
source=("https://hackage.haskell.org/packages/archive/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('87928f45b7cad240f136200998e4e19320602ba1cd2d32d3a2f7cd9e904c82ec0f54beed925389228d445f08d7ae562e4fa59e47f3f040b8efac9a23087d29a3')

prepare() {
  cd "$pkgname-$pkgver"
  uusi \
    -u HUnit \
    -u aeson \
    -u aeson-pretty \
    -u directory \
    -u filepath \
    -u hspec \
    -u mtl \
    -u optparse-applicative \
    -u protolude \
    -u tasty \
    -u tasty-hspec \
    -u tasty-quickcheck \
    -u temporary \
    -u transformers \
    -u unordered-containers \
    "$pkgname.cabal"
}

build() {
  cd "$pkgname-$pkgver"

  runhaskell Setup configure -O --enable-shared --enable-executable-dynamic \
    --disable-library-vanilla --prefix=/usr --docdir="/usr/share/doc/$pkgname" \
    --datasubdir="$pkgname" --enable-tests --dynlibdir=/usr/lib \
    --libsubdir=\$compiler/site-local/\$pkgid -f-ghc-lib --ghc-option='-pie'
  runhaskell Setup build
  runhaskell Setup register --gen-script
  runhaskell Setup unregister --gen-script
  sed -i -r -e "s|ghc-pkg.*update[^ ]* |&'--force' |" register.sh
  sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}

check() {
  cd "$pkgname-$pkgver"
  runhaskell Setup test --show-details=direct || echo "Tests failed"
}

package() {
  cd "$pkgname-$pkgver"

  install -D -m744 register.sh "$pkgdir/usr/share/haskell/register/$pkgname.sh"
  install -D -m744 unregister.sh "$pkgdir/usr/share/haskell/unregister/$pkgname.sh"
  runhaskell Setup copy --destdir="$pkgdir"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  rm -rf "$pkgdir/usr/share/doc"
}
