# Maintainer: Pierre Dommerc <dommerc.pierre@gmail.com>

pkgname=nvuv
pkgver=0.3.4
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
sha256sums=('43d6c36a55c27153c97a0b53082034c7c1bbf1d7b3433c56ab53dea5d7026053')
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

