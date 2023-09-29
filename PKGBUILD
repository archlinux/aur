# Maintainer: redstrate <josh@redstrate.com>

pkgname=astra-launcher-git
pkgver=0.4.0.r241.g0ed554d
pkgrel=1
pkgdesc="Cross-platform FFXIV launcher (git version)"
arch=('x86_64')
url="https://git.sr.ht/~redstrate/astra"
license=('GPL3')
depends=('qt6-base' 'qt6-declarative' 'qt6-webview' 'kirigami2' 'kconfig' 'kcoreaddons' 'kirigami-addons' 'quazip-qt6' 'qtkeychain-qt6' 'unshield' 'qcoro-qt6' 'rust' 'corrosion' 'extra-cmake-modules')
makedepends=('git' 'cmake')
provides=('astra-launcher')
conflicts=('astra-launcher')
source=('astra-git::git+https://git.sr.ht/~redstrate/astra' 'libcotp-git::git+https://github.com/redstrate/libcotp.git' 'libphysis-git::git+https://git.sr.ht/~redstrate/libphysis')
md5sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
    cd "astra-git"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "astra-git"
    git submodule init
    git config submodule.'external/libcotp'.url "$srcdir/libcotp-git"
    git config submodule.'external/libphysis'.url "$srcdir/libphysis-git"
    git -c protocol.file.allow=always submodule update
    cmake -DCMAKE_BUILD_TYPE=RelWithDebugInfo -DQT_MAJOR_VERSION=6 ./
    cmake --build ./
}

package() {
    cd "astra-git"
    cmake -DCMAKE_INSTALL_PREFIX="$pkgdir/usr"
    make install
}

