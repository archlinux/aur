# Maintainer: Keiran <q4ow@proton.me>
pkgname=hostman-git
pkgver=1.1.4
pkgrel=1
pkgdesc="A simple file host manager for various image hosting services (latest commit)"
arch=('x86_64')
url="https://github.com/q4ow/hostman"
license=('MIT')
depends=('curl' 'sqlite' 'openssl' 'cjson')
makedepends=('cmake' 'git')
provides=('hostman')
conflicts=('hostman')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/hostman"
  printf "%s.r%s.g%s" \
    "$(grep -Po 'project\(hostman VERSION \K[0-9.]+' CMakeLists.txt)" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/hostman"
  mkdir -p build
  cd build
  cmake .. -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "$srcdir/hostman/build"

  install -Dm755 hostman "$pkgdir/usr/bin/hostman"

  install -Dm644 ../README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 ../CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"

  install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
