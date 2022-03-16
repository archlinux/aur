# Maintainer: redstrate <josh@redstrate.com>
pkgname=astra-launcher-git
pkgver=v0.3.1.beta.r21.g94a740a
pkgrel=1
pkgdesc="A cross-platform FFXIV launcher"
arch=('x86_64')
url="https://git.sr.ht/~redstrate/astra"
license=('GPL3')
depends=('qt5-base' 'quazip-qt5' 'qtkeychain-qt5' 'libxcomposite') # this x11 dependency is going to be removed in a future release
makedepends=('git' 'cmake')
install=
provides=('astra-launcher')
conflicts=('astra-launcher')
source=('astra-git::git+https://git.sr.ht/~redstrate/astra')
md5sums=('SKIP')

pkgver() {
	cd "astra-git"
    ( set -o pipefail
      git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
	cd "astra-git"
    cmake -DCMAKE_BUILD_TYPE=Release ./
    cmake --build ./
}

package() {
    cd "astra-git"
    cmake -DCMAKE_INSTALL_PREFIX="$pkgdir/usr"
    make install
    find "$pkgdir" -type d -name ".git" -exec rm -r '{}' +
}

