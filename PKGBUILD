# Maintainer: Fred Mitchell <fred.mitchell@atomlogik.de>
pkgname=swiss-army-knife-hs
pkgver=1.0.0.0
pkgrel=5
pkgdesc="A collection of powerful but useful small tools."
arch=('x86_64')
url="https://github.com/flajann2/swiss-army-knife-hs"
license=('MIT')
depends=('gmp' 'libffi' 'ghc' 'glibc')
makedepends=('wget' 'xz' 'git' 'ghc-libs' 'cabal-install')
source=("$pkgname::git+https://github.com/flajann2/swiss-army-knife-hs.git")

md5sums=('SKIP')

prepare() {
    cd "$srcdir"

    curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
    source "$srcdir/.ghcup/env"

    # Install specific GHC version
    ghcup install ghc 9.10.1
    ghcup set ghc 9.10.1
    
    # Install cabal
    ghcup install cabal latest   
}

build() {
   cd "$srcdir/$pkgname"
   
   source "$srcdir/.ghcup/env"
   export HOME="$srcdir"
   
   ghc --version
   cabal --version

   echo "**** $HOME **** $srcdir ****"
   cabal update
   mkdir -p "$HOME/.cabal"
   cabal configure \
        --datasubdir=$pkgname \
        --prefix=/usr \
        --extra-lib-dirs=/usr/lib \
        --extra-include-dirs=/usr/include
   cabal build --jobs=$(nproc)
}

package() {
   cd "$srcdir/$pkgname"
   mkdir -p "$pkgdir/usr/bin"
   cabal install --overwrite-policy=always
   install -Dm755 $(find . -path "*/dist-newstyle/build/*" -name sak -type f) "$pkgdir/usr/bin/sak"
   install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
