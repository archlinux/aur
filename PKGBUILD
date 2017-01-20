# Maintainer: archlinux.info:tdy

pkgname=genesis-git
pkgver=r570.d96914d
pkgrel=1
pkgdesc="A digital audio workstation"
arch=(i686 x86_64)
url=https://github.com/andrewrk/genesis
license=(GPL)
depends=(libsoundio libepoxy glfw glm ffmpeg rhash rucksack)
makedepends=(git cmake unicode-character-database gcc5)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+https://github.com/andrewrk/genesis.git ${pkgname%-git}.sh)
sha256sums=(SKIP c93e4a2f6498bebc2eed7d6c1f05209a047477db73b8941a4f9f65f7b90f0495)

pkgver() {
  cd ${pkgname%-git}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  mkdir ${pkgname%-git}/build
  cd ${pkgname%-git}/build
  sed -i 's,\(unicode\)\(/Unicode\),\1-character-database\2,' ../CMakeLists.txt
  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_C_COMPILER=/usr/bin/gcc-5 \
    -DCMAKE_CXX_COMPILER=/usr/bin/g++-5
  make
}

check() {
  cd ${pkgname%-git}/build
  make test
}

package() {
  cd ${pkgname%-git}/build
  make DESTDIR="$pkgdir" install
  install -Dm644 resources.bundle "$pkgdir"/usr/share/${pkgname%-git}/resources.bundle
  install -Dm755 "$pkgdir"/usr/{bin,lib}/${pkgname%-git}
  install -Dm755 "$srcdir"/${pkgname%-git}.sh "$pkgdir"/usr/bin/${pkgname%-git}
}
