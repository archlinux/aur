# Maintainer: lanthora <lanthora@outlook.com>

pkgname=candy-git
pkgver=6.1.4.r1.gf5e40a0
pkgrel=1
pkgdesc="A tool for creating and managing a virtual network implemented in C++"
url="https://github.com/lanthora/candy"
license=('MIT')
arch=('x86_64' 'aarch64' 'armv7h' 'riscv64' 'loong64')
source=("$pkgname::git+https://github.com/lanthora/candy.git" )
sha256sums=('SKIP')
makedepends=('cmake' 'ninja' 'pkgconf' 'gcc' 'git' 'nlohmann-json')
depends=('fmt' 'glibc' 'gcc-libs' 'openssl' 'spdlog' 'poco')
conflicts=('candy')
backup=('etc/candy.cfg')

pkgver() {
        cd "$pkgname"
        git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
        cd "$pkgname"
        cmake -B build -G Ninja -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
        cmake --build build
}

package() {
        cd "$pkgname"
        install -Dm644 candy.cfg "$pkgdir/etc/candy.cfg"
        install -Dm644 candy.service "$pkgdir/usr/lib/systemd/system/candy.service"
        install -Dm644 candy@.service "$pkgdir/usr/lib/systemd/system/candy@.service"
        install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
        DESTDIR="$pkgdir" cmake --install build
}
