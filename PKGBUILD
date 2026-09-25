# Maintainer: z3475 <z3475@users.noreply.github.com>
pkgname=gitmount
pkgver=0.0.2
pkgrel=1
pkgdesc='Read-only FUSE filesystem for git: every branch, tag and commit as plain directories'
arch=(x86_64)
url='https://github.com/OrbitZore/gitmount'
license=(GPL-3.0-or-later)
depends=(fuse3 libgit2 gcc-libs)
makedepends=(cmake ninja catch2)
checkdepends=(git python)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a5ccb005d30d08bb0a4cb52bd1d2acc66d0e21d2b5f97fd379c2172aeef1a7e8')

# Unit tests always run; the integration suite performs real FUSE mounts
# and self-skips when /dev/fuse or fusermount3 is unavailable (clean
# build chroots), per RFC 0000 §5.

build() {
  cmake -B build -S "$pkgname-$pkgver" -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_SBINDIR=bin \
    -DGITMOUNT_BUILD_TESTS=ON \
    -DGITMOUNT_WERROR=ON
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
