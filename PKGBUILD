# Maintainer: qFred Mitchell <fred.mitchell@atomlogik.de>
pkgname=swiss-army-knife-hs
pkgver=1.0.0.1
pkgrel=5
pkgdesc="A collection of powerful but useful small tools."
arch=('x86_64')
url="https://github.com/flajann2/swiss-army-knife-hs"
license=('MIT')
depends=('ghc' 'glibc')
makedepends=('wget' 'xz' 'git' 'ghc-libs' 'cabal-install')
source=("$pkgname::git+https://github.com/flajann2/swiss-army-knife-hs.git")

md5sums=('SKIP')

prepare() {
    cd "$srcdir"
    export HOME="$srcdir"
    export BOOTSTRAP_HASKELL_NONINTERACTIVE=1
    export BOOTSTRAP_HASKELL_NO_UPGRADE=1
    export BOOTSTRAP_HASKELL_MINIMAL=1
    export BOOTSTRAP_HASKELL_GHC_VERSION=9.10.1
    export BOOTSTRAP_HASKELL_CABAL_VERSION=1.14
    export BOOTSTRAP_HASKELL_INSTALL_NO_STACK=1
    export BOOTSTRAP_HASKELL_INSTALL_NO_STACK_HOOK=1

    curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
    source "$srcdir/.ghcup/env"

    # Install specific GHC version
    ghcup install ghc 9.10.1
    ghcup set ghc 9.10.1
    
    # Install cabal
    ghcup install cabal latest   
}

build() {
   cd "$srcdir/$pkgname-$pkgver"
   
   source "$srcdir/.ghcup/env"
   export HOME="$srcdir"
   
   ghc --version
   cabal --version

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
    cd "$srcdir/$pkgname-$pkgver"
    
    # Install the binary
    cabal install --installdir="$pkgdir/usr/bin" --install-method=copy
    
    # Alternative approach if the above doesn't work:
    # cabal configure --prefix=/usr --destdir="$pkgdir"
    # cabal build
    # cabal copy --destdir="$pkgdir"
    
    # Install documentation if available
    if [[ -f README.org ]]; then
        install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.org"
    fi
    
    # Install license if available
    if [[ -f LICENSE ]]; then
        install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi
}
