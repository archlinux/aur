# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=promscale
pkgver=0.3.0
pkgrel=1
pkgdesc="An open source analytical platform for Prometheus metrics"
arch=('x86_64')
url="https://github.com/timescale/promscale"
license=(Apache)
depends=(glibc)
makedepends=(go)
checkdepends=()
optdepends=(
  timescaledb
  prometheus
  promscale_extension
)
backup=("etc/conf.d/promscale")
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
        "$pkgname.service"
        "$pkgname.sysusers.conf"
        "$pkgname.conf")
b2sums=('b0f25128107a21368d28da462897accf10ba048b5b4de4ff9db39dd1157710063f626a515faf0316b701c382eef7fc7fa8ca452bc20ddb2b0593baf0edb05331'
        '23a357e2fd252d1f6c1cd8d3cd4174bdd27d0ae5035f5afd08ac377405868ad0cc5d782fb5a73fcfdbd7169361e2c4b639aa096ebfe2d9adf95ffc1e26caa3b1'
        '2fae9c07cd255528a1c87062650956b857caa8a3c656b59e85d740f527433f510a8fe18025e03480d9145673e6dd03867d60ead5a48044353262105a173cbbfd'
        '2495de270a7037dc51ea8b6e75742f07fd98995da4f928aaeb2b5d3ef41094f9fa8a5cd1836fc05c246192255c34c85bb80a056e12986094b4f80634e1450237')

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
  install -Dm644 -t "$pkgdir/usr/lib/systemd/system" "$srcdir/$pkgname.service"
  install -Dm644 "$srcdir/$pkgname.sysusers.conf" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"

  # environment variable file
  install -Dm640 "$srcdir/$pkgname.conf" "$pkgdir/etc/conf.d/$pkgname"

  # documentation
  install -Dm644 "$pkgname-$pkgver/cmd/prom-migrator/README.md" "$pkgdir/usr/share/doc/$pkgname/prom-migrator.md"
  install -Dm644 "$pkgname-$pkgver/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  cp -r "$pkgname-$pkgver/docs" "$pkgdir/usr/share/doc/$pkgname"

  # binaries
  install -Dm755 -t "$pkgdir/usr/bin" \
    "$pkgname-$pkgver/build_output/$pkgname" \
    "$pkgname-$pkgver/build_output/prom-migrator"
}
