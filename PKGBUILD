# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=promscale
pkgver=0.1.2
pkgrel=3
pkgdesc="An open source analytical platform for Prometheus metrics"
arch=('x86_64')
url="https://github.com/timescale/promscale"
license=('Apache')
makedepends=(go)
checkdepends=()
optdepends=(timescaledb
            prometheus
            promscale_extension)
backup=("etc/conf.d/promscale")
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
        "$pkgname.service"
        "$pkgname.sysusers.conf"
        "$pkgname.conf")
b2sums=('761e00de8829fae2a6b5f2b9c6b7e1db0f3b4391076af4df2faebb02186707ed25c75ef52020b6e43eebfac414db2ee7c26bcfd535de748697ff56e7639f0408'
        '23a357e2fd252d1f6c1cd8d3cd4174bdd27d0ae5035f5afd08ac377405868ad0cc5d782fb5a73fcfdbd7169361e2c4b639aa096ebfe2d9adf95ffc1e26caa3b1'
        '2fae9c07cd255528a1c87062650956b857caa8a3c656b59e85d740f527433f510a8fe18025e03480d9145673e6dd03867d60ead5a48044353262105a173cbbfd'
        '44b673203d0d2fa3af9f7e9bce8c6aefd61f14cde9dff2a261132ab99f2433940f37a9b70c49a234689a4277b7240ec411a38b9708001f49114a960d0770d7ed')

prepare() {
  cd "$pkgname-$pkgver"
  go mod vendor
}

build() {
  cd "$pkgname-$pkgver/cmd/$pkgname"
  go build -v \
    -buildmode=pie \
    -trimpath \
    -mod=vendor \
    -modcacherw \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\""
}

package() {
  # systemd integration
  install -Dm644 -t "$pkgdir/usr/lib/systemd/system" "$srcdir/$pkgname.service"
  install -Dm644 "$srcdir/$pkgname.sysusers.conf" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"

  # environment variable file
  install -Dm644 "$srcdir/$pkgname.conf" "$pkgdir/etc/conf.d/$pkgname"

  # binary
  install -Dm755 -t "$pkgdir/usr/bin" "$pkgname-$pkgver/cmd/$pkgname/$pkgname"
}
