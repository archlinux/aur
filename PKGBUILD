# Maintainer: Phil Ruffwind <rf@rufflewind.com>
pkgname=gitit
pkgver=0.12.0.1
pkgrel=1
pkgdesc="A wiki backed by a git, darcs, or mercurial filestore"
arch=(i686 x86_64)
url=https://hackage.haskell.org/package/$pkgname
license=(GPL)
depends=()
optdepends=("git: git support" "mercurial: mercurial support")
makedepends=(ghc cabal-install)
source=(https://hackage.haskell.org/package/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('552996f2624ed08cd21a73303d666292f08a1294416d2811f9d57293c9e89506')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cabal sandbox init
    cabal --require-sandbox update
    cabal --require-sandbox install \
          --force-reinstalls --reinstall --only-dependencies --enable-tests
    cabal --require-sandbox configure --prefix=/usr --enable-tests
    cabal --require-sandbox build
}

check() {
    cd "$srcdir/$pkgname-$pkgver"
    cabal --require-sandbox test
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    cabal --require-sandbox copy --destdir="$pkgdir"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
