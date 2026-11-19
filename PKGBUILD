# Maintainer: Pierre Dommerc <dommerc.pierre@gmail.com>

pkgname=nvuv
pkgver=0.3.3
pkgrel=1
pkgdesc='CLI tool for undervolting and overclocking NVIDIA gpu'
arch=('x86_64')
url='https://github.com/doums/nvuv'
license=('Apache-2.0 WITH Commons-Clause')
depends=('glibc' 'nvidia-utils')
makedepends=('zig')
provides=('nvuv')
conflicts=('nvuv')
options=(!debug)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
#source=("$pkgname-$pkgver::git+file://${PWD}/../..")
sha256sums=('ff64265f6b8e085ae99e6db084299d55227b48306ae6a21f4c7caa3940cc66ae')
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

