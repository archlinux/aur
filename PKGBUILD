# Maintainer: Jakub Klinkovský <lahwaacz@archlinux.org>

pkgname=prometheus-slurm-exporter
pkgver=0.20
pkgrel=1
pkgdesc="Prometheus exporter for slurm metrics"
arch=(x86_64)
url="https://github.com/vpenso/prometheus-slurm-exporter"
license=(GPL3)
makedepends=(go)
backup=("etc/conf.d/$pkgname")
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
        "$pkgname.conf"
        "$pkgname.service"
        "$pkgname.sysusers"
        "gpus.patch")
b2sums=('795dfd221cd6249b249bc3b46e2da5afd85e641ae667c6bbc79dd6fd525920427e9b5e2518f429eef625a23428f5f84816790a093f2253b5490c747c83879cb4'
        'a709e377eb2f63acda614c7db973e1df212c2e35caeff303f607afdf82675e8f3a2a4c630b9bc9b8495976b28a7755062b5f28cf78ee72c4aadffaa0703132dc'
        'a760ee6c1af298ccc77a2b4bc09e8d3442141d6b42e0d4b3e374731edddeb4c6eac3882b7abab3718e736f2c770084dd5f7455e296b19e69665a3934bc9afaea'
        '66f53e52502dc528f9ed20de9f45a1e23d884cb70f870024a3248e5965be598f88e8a9fa463ee93d7d7bd2a44acf7417a158f43d571f794c0f0a12385c9e9e28'
        '2eb4c885bd70cab03c766ecfe9d51421847071cb247b69a1b769f7272f57cd13ce817fdd97bfc94460ad4a83c8313a08f9ea68b97812068c562bba168d4d4738')

prepare() {
  cd "$pkgname-$pkgver"
  mkdir -p build

  # patch for https://github.com/vpenso/prometheus-slurm-exporter/issues/38
  patch -Np 1 < "$srcdir/gpus.patch"
}

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build .
}

package() {
  # systemd files
  install -Dm644 "$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
  install -Dm644 "$pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  install -Dm644 "$pkgname.conf" "$pkgdir/etc/conf.d/$pkgname"

  cd "$pkgname-$pkgver"

  # binary
  install -Dm755 "build/$pkgname" "$pkgdir/usr/bin/$pkgname"

  # license
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$srcdir/$pkgname-$pkgver/LICENSE"
}
