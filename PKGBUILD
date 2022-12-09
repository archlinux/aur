# Marco Rubin <marco.rubin@protonmail.com>

pkgname=discord-rpc
pkgver=20200921
_commit=963aa9f3e5ce81a4682c6ca3d136cddda614db33
pkgrel=1
pkgdesc="Discord Rich Presence library"
arch=('aarch64' 'armv7h' 'i486' 'i686' 'pentium4' 'x86_64')
url="https://github.com/discord/discord-rpc"
license=('MIT')
depends=('gcc-libs')
makedepends=('cmake' 'git' 'rapidjson>=1.1')
provides=("$pkgname=$pkgver" 'libdiscord-rpc.so')
conflicts=("$pkgname-git")
source=(git+$url#commit=$_commit)
b2sums=('SKIP')

pkgver() {
    cd $pkgname
    git log -n1 --pretty='format:%cd' --date=format:'%Y%m%d' $_commit
}

build() {
    cd $pkgname
    cmake -B build \
        -DBUILD_SHARED_LIBS=ON \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_C_FLAGS_RELEASE="-DNDEBUG" \
        -DCMAKE_CXX_FLAGS_RELEASE="-DNDEBUG" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -Wno-dev
    cmake --build build
}

package() {
    cd $pkgname
    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
