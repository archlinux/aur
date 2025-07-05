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
    cd "$srcdir"
    
    # Debug: List the contents to see what directory was actually created
    echo "Contents of srcdir:"
    ls -la
    
    # Find the actual source directory
    if [[ -d "$pkgname-$pkgver" ]]; then
        cd "$pkgname-$pkgver"
    elif [[ -d "$pkgname" ]]; then
        cd "$pkgname"
    else
        # If it's a git checkout, it might be in a subdirectory
        cd $(find . -maxdepth 1 -type d -name "*$pkgname*" | head -1)
    fi
    
    # Build the project
    cabal update
    cabal build
}

package() {
    cd "$srcdir"
    
    # Find the actual source directory (same logic as build)
    if [[ -d "$pkgname-$pkgver" ]]; then
        cd "$pkgname-$pkgver"
    elif [[ -d "$pkgname" ]]; then
        cd "$pkgname"
    else
        cd $(find . -maxdepth 1 -type d -name "*$pkgname*" | head -1)
    fi
    
    # Install the binary - find the actual executable
    find dist-newstyle -name "sak" -type f -executable -exec install -Dm755 {} "$pkgdir/usr/bin/sak" \;
    
    # Alternative: Install using cabal (if the find method doesn't work)
    # cabal install --installdir="$pkgdir/usr/bin" --install-method=copy
    
    # Install documentation if available
    if [[ -f README.md ]]; then
        install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    fi
    
    # Install license if available
    if [[ -f LICENSE ]]; then
        install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi
}
