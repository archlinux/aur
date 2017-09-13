# Maintainer: Phil Ruffwind <rf@rufflewind.com>
pkgname=gitit
pkgver=0.12.2.1
pkgrel=3
pkgdesc="A wiki backed by a git, darcs, or mercurial filestore"
arch=(i686 x86_64)
url=https://hackage.haskell.org/package/gitit
license=(GPL)
depends=(libffi gmp zlib)
optdepends=("git: git support" "mercurial: mercurial support")
makedepends=(ghc-pristine ghc-static)
source=(https://github.com/jgm/gitit/archive/$pkgver.tar.gz)
sha256sums=('017cd716c8844036600e8aee858861ac41d8ef3c1ab02b43cd50532e4d5472b9')

prepare() {
    mkdir -p "$srcdir/.cabal"
    cat >"$srcdir/.cabal/config" <<EOF
repository hackage.haskell.org
  url: https://hackage.haskell.org/
remote-repo-cache: $srcdir/.cabal/packages
with-compiler: /usr/share/ghc-pristine/bin/ghc
jobs: \$ncpus
EOF
}

build() {
    cd "$srcdir/gitit-$pkgver"
    cabal --config="$srcdir/.cabal/config" update
    cabal --config="$srcdir/.cabal/config" sandbox init
    cabal --config="$srcdir/.cabal/config" install --enable-relocatable --datadir='$prefix/share/gitit' --docdir='$prefix/share/doc/$abi/$pkgid' --ghc-options=-rtsopts
}

package() {
    cd "$srcdir/gitit-$pkgver"
    mkdir -p "$pkgdir/usr/share"
    cp -PR .cabal-sandbox/share/gitit "$pkgdir/usr/share/"
    rm -fr "$pkgdir/usr/share/gitit/man"
    install -Dm755 .cabal-sandbox/bin/gitit "$pkgdir/usr/bin/gitit"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/gitit/LICENSE"
}
