# Maintainer: Timur Demin <me@tdem.in>

# Ported from insomnia-src pkgbuild, thanks to @vscncls and @bruceutut

pkgname="emdl"
pkgver="2.0.1"
pkgrel=1
pkgdesc='Extensible manga downloader and reader using Electron'

_pkgarchive="$pkgname-v$pkgver"

url="https://gitlab.com/CopyNippyJoin/emdl"
arch=('x86_64')
license=('GPL3')
depends=(
    'electron'
    'jq'
    'npm'
)
makedepends=(
    'git'
    'nvm'
)
source=("https://gitlab.com/CopyNippyJoin/$pkgname/-/archive/v$pkgver/$_pkgarchive.tar.gz")
sha256sums=('b4a3d6f612815ac2e248beffae7deed3d4454bc4692f90a15229cd615fbd54fd')

build () {
    # Use node 12
    local node_version='12'
    export npm_config_cache="$srcdir/$_pkgarchive/npm_cache"
    source /usr/share/nvm/init-nvm.sh
    nvm install "$node_version"
    # Run the build
    cd "$srcdir/$_pkgarchive"
    nvm exec $node_version npm ci
    nvm exec $node_version npm run pack
}

package () {
    # Set up package directories
    install -d ${pkgdir}/{opt,usr/bin}
    # Copy built files into the package
    ( cd $srcdir/$_pkgarchive/dist/linux-unpacked && find . -type f \
        -exec install -Dm 755 "{}" "$pkgdir/opt/$pkgname/{}" \; )
    # Symlink the executable path into the package
    ln -s /opt/$pkgname/$pkgname $pkgdir/usr/bin/$pkgname
}
