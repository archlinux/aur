# Maintainer: Karol Babioch <karol@babioch.de>

pkgname=flamethrower-git
_pkgname=${pkgname%-git}
pkgver=0.9.r5.20dabbc
pkgrel=1
pkgdesc="DNS performance and functional testing utility"
arch=('i686' 'x86_64')
url="https://github.com/DNS-OARC/flamethrower"
license=('APACHE')
depends=('ldns' 'libuv')
makedepends=('cmake')
source=("git+https://github.com/DNS-OARC/flamethrower.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${_pkgname}"
    # Fix a issue with CMake package name of ldns
    sed -i 's/libldns/ldns/' CMakeLists.txt
    mkdir -p build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr ..
    make
}

package() {
    cd "${srcdir}/${_pkgname}"
    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    cd build
    install -Dm0755 flame "$pkgdir/usr/bin/flame"
}
