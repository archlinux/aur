# Maintainer: Phil Ruffwind <rf@rufflewind.com>
pkgname=gitit
pkgver=0.12.2
pkgrel=1
pkgdesc="A wiki backed by a git, darcs, or mercurial filestore"
arch=(i686 x86_64)
url=https://hackage.haskell.org/package/$pkgname
license=(GPL)
depends=()
optdepends=("git: git support" "mercurial: mercurial support")
makedepends=(ghc cabal-install)
source=(https://hackage.haskell.org/package/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('160a928d992847823ab11982fa6465a4d80e59ce2a45e54e8a5e1838aba22b78')

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
