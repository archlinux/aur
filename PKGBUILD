# Maintainer: lanthora <lanthora@outlook.com>

pkgname=candy-git
pkgver=5.0.r4.g2568058
pkgrel=1
pkgdesc="Another virtual private network that supports peer-to-peer connections"
url="https://github.com/lanthora/candy"
license=('MIT')
arch=('x86_64' 'aarch64' 'armv7h' 'riscv64')
source=("$pkgname::git+https://github.com/lanthora/candy.git" )
sha256sums=('SKIP')
makedepends=('cmake' 'ninja' 'pkgconf' 'gcc' 'git')
depends=('fmt' 'glibc' 'gcc-libs' 'openssl' 'libconfig' 'uriparser' 'spdlog' 'poco')
conflicts=('candy')
backup=('etc/candy.conf')

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
        install -Dm644 candy.conf "$pkgdir/etc/candy.conf"
        install -Dm644 candy.service "$pkgdir/usr/lib/systemd/system/candy.service"
        install -Dm644 candy@.service "$pkgdir/usr/lib/systemd/system/candy@.service"
        install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
        DESTDIR="$pkgdir" cmake --install build
}
