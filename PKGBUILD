# Maintainer: Justin Kromlinger <hashworks@archlinux.org>

pkgname=alertmanager-bot
pkgver=0.4.3
pkgrel=5
pkgdesc="Telegram Bot for Prometheus' Alertmanager"
arch=('x86_64')
url="https://github.com/metalmatze/alertmanager-bot"
license=('Apache')
depends=('glibc')
makedepends=('go')
options=(!lto)
backup=(etc/conf.d/alertmanager-bot)
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
  'systemd.service'
)
sha512sums=('b7ee8edcd062e7d6c8d54532673be4e2d270ae8638d5389092dae8528b3da240c3844229642b49f5a043c0167124a8f03c30d8d3c3b9585656a2bc55b62d37d9'
            '1297f1e44464f3e7c7cc1b49c60d5b209a11f44eb2eba7a9800af636bbce498bf3f3fec4eb6adc14de8c3e1280631995508dc508fc2c860a29e1d666c1be349c')

prepare() {
  cd "$pkgname-$pkgver"

  # create folder for build output
  rm -Rf build
  mkdir build

  # download dependencies
  go mod download

  # download test dependencies
  for pkg in $(go list ./... | grep -v /vendor/); do
    go get -t "$pkg"
  done

  echo "TEMPLATE_PATHS=/etc/alertmanager-bot/default.tmpl" >> .env.example
}

build() {
  cd "$pkgname-$pkgver"
  go build -v \
    -buildmode=pie \
    -trimpath \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags ${LDFLAGS} \
    -X main.Version=${pkgver} \
    -X main.Revision=${pkgver}-${pkgrel} \
    -X main.BuildDate=$(date -d@"$SOURCE_DATE_EPOCH" +%Y%m%d-%H:%M:%S)" \
    -o build "./cmd/${pkgname}"
}

check() {
  cd "$pkgname-$pkgver"
  for pkg in $(go list ./... | grep -v /vendor/); do
    go test "$pkg"
  done
}

package() {
  # systemd integration
  install -Dm644 systemd.service "$pkgdir/usr/lib/systemd/system/$pkgname.service"

  # example config & template
  install -Dm600 "$pkgname-$pkgver/.env.example" "$pkgdir/etc/conf.d/alertmanager-bot"
  install -Dm644 "$pkgname-$pkgver/default.tmpl" "$pkgdir/etc/alertmanager-bot/default.tmpl"

  # binary
  install -Dm755 "$pkgname-$pkgver/build/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

