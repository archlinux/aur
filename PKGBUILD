# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=promscale
pkgver=0.4.0
pkgrel=1
pkgdesc="An open source analytical platform for Prometheus metrics"
arch=('x86_64')
url="https://github.com/timescale/promscale"
license=('Apache')
depends=('glibc')
makedepends=('go')
optdepends=(
  'timescaledb'
  'prometheus'
  'promscale_extension'
)
backup=("etc/conf.d/promscale")
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
        "systemd.service"
        "sysusers.conf"
        "environment.conf")
b2sums=('d00232917f9e68be59c8ec3083683715ea4de18027afeaa66f4e2696f966781f90da3bf3d7cdc4e9d4e455e6ae92a9d878bc28adf5367b536a01892f019f0eae'
        '23a357e2fd252d1f6c1cd8d3cd4174bdd27d0ae5035f5afd08ac377405868ad0cc5d782fb5a73fcfdbd7169361e2c4b639aa096ebfe2d9adf95ffc1e26caa3b1'
        '2fae9c07cd255528a1c87062650956b857caa8a3c656b59e85d740f527433f510a8fe18025e03480d9145673e6dd03867d60ead5a48044353262105a173cbbfd'
        '959678ca6aa24c89249db7b3e273a659c2676ff220bee60e6c753f969b1b65f4e14a5e3f6ffcba304c4e880822929ae1125e9b468ebe24385881051e99e3752e')

prepare() {
  cd "$pkgname-$pkgver"
  mkdir build_output
  go mod vendor
}

build() {
  cd "$pkgname-$pkgver"
  go build -v \
    -buildmode=pie \
    -trimpath \
    -mod=vendor \
    -modcacherw \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
    -o build_output ./cmd/...
}

package() {
  # systemd integration
  install -Dm644 systemd.service "$pkgdir/usr/lib/systemd/system/$pkgname.service"
  install -Dm644 sysusers.conf "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"

  # environment variable file
  install -Dm640 environment.conf "$pkgdir/etc/conf.d/$pkgname"

  cd "$pkgname-$pkgver"

  # documentation
  install -Dm644 cmd/prom-migrator/README.md "$pkgdir/usr/share/doc/$pkgname/prom-migrator.md"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  cp -r docs "$pkgdir/usr/share/doc/$pkgname"

  # binaries
  install -Dm755 -t "$pkgdir/usr/bin" \
    "build_output/$pkgname" \
    build_output/prom-migrator
}
