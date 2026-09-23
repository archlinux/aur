# Maintainer: Huseyn Teymurzade <huseynteymurrr74@gmail.com>
pkgname=kizamu
pkgver=0.1.1
pkgrel=1
pkgdesc="A modern terminal typing trainer, built with Zig"
arch=('x86_64' 'aarch64')
url="https://github.com/Huseynteymurzade28/Kizamu"
license=('MIT')
depends=('glibc')
makedepends=('zig>=0.16.0' 'zig<0.17.0' 'git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8689de7f1a272099b40918b1668a9cf96d547224ee37e28489e338202a5dce7d')

prepare() {
  cd "$srcdir/Kizamu-$pkgver"
  # Zig fetches its package dependencies (libvaxis) over the network.
  # Do it here so build() itself stays offline, and keep the cache in $srcdir.
  export ZIG_GLOBAL_CACHE_DIR="$srcdir/zig-global-cache"
  zig build --fetch
}

build() {
  cd "$srcdir/Kizamu-$pkgver"
  export ZIG_GLOBAL_CACHE_DIR="$srcdir/zig-global-cache"
  zig build \
    --release=safe \
    --prefix "$srcdir/install" \
    -Dcpu=baseline
}

package() {
  cd "$srcdir/Kizamu-$pkgver"
  install -Dm755 "$srcdir/install/bin/kizamu" "$pkgdir/usr/bin/kizamu"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
