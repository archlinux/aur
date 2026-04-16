# Maintainer: Pierre Dommerc <dommerc.pierre@gmail.com>

pkgname=nvuv
pkgver=0.2.0
pkgrel=1
pkgdesc='CLI tool for undervolting NVIDIA gpu'
arch=('x86_64')
url='https://github.com/doums/nvuv'
license=('Apache-2.0 WITH Commons-Clause')
depends=('glibc' 'nvidia-utils')
makedepends=('zig-master')
provides=('nvuv')
conflicts=('nvuv')
options=(!debug)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
#source=("$pkgname-$pkgver::git+file://${PWD}/../..")
sha256sums=('3ba2d33053f4696e04c44f5df32b54a42c6c4500f988b9a395b2b7ea95c516dd')
backup=('etc/nvuv/nvuv.toml')
_pkgdir="$pkgname-$pkgver"

build() {
  cd "$srcdir/$_pkgdir"
  zig build -Doptimize=ReleaseSmall --prefix "${srcdir}/zig-out"
}

package() {
  cd "$srcdir/$_pkgdir"
  install -Dm755 "$srcdir/zig-out/bin/nvuv" "$pkgdir/usr/bin/nvuv"
  install -Dm644 "$srcdir/$_pkgdir/.pkg/nvuv.toml" "$pkgdir/etc/nvuv/nvuv.toml"
  install -Dm644 "$srcdir/$_pkgdir/.pkg/nvuv.service" "$pkgdir/usr/lib/systemd/system/nvuv.service"
  install -Dm755 "$srcdir/$_pkgdir/.pkg/50-nvuv" "$pkgdir/usr/lib/systemd/system-sleep/50-nvuv"
}

