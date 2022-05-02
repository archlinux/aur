# Maintainer: redstrate <josh@redstrate.com>

pkgname=astra-launcher-git
pkgver=0.4.0.r0.g7cfa2e4
pkgrel=1
pkgdesc="Cross-platform FFXIV launcher (git version)"
arch=('x86_64')
url="https://git.sr.ht/~redstrate/astra"
license=('GPL3')
depends=('qt5-base' 'quazip-qt5' 'qtkeychain-qt5' 'libxcomposite' 'unshield' 'fmt' 'pugixml') # this x11 dependency is going to be removed in a future release
makedepends=('git' 'cmake')
provides=('astra-launcher')
conflicts=('astra-launcher')
source=('astra-git::git+https://git.sr.ht/~redstrate/astra' 'libxiv-git::git+https://git.sr.ht/~redstrate/libxiv')
md5sums=('SKIP' 'SKIP')

pkgver() {
    cd "astra-git"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "astra-git"
    git submodule init
    git config submodule.'external/libxiv'.url "$srcdir/libxiv-git"
    git submodule update
    cmake -DCMAKE_BUILD_TYPE=RelWithDebugInfo -DUSE_OWN_LIBRARIES=OFF ./
    cmake --build ./
}

package() {
    cd "astra-git"
    cmake -DCMAKE_INSTALL_PREFIX="$pkgdir/usr"
    make install
}

