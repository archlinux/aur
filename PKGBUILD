# Maintainer: Jakub Klinkovský <j.l.k@gmx.com>

pkgname=prometheus-nvidia-gpu-exporter
_pkgname=nvidia_gpu_prometheus_exporter
pkgver=r31.e7d86ca
pkgrel=3
pkgdesc="Prometheus exporter for Nvidia GPU metrics"
arch=(x86_64)
url="https://github.com/cfsmp3/nvidia_gpu_prometheus_exporter"
license=(Apache)
makedepends=(go git)
backup=("etc/conf.d/prometheus-nvidia-gpu-exporter")
source=("git+$url.git"
        "$pkgname.conf"
        "$pkgname.service"
        "$pkgname.sysusers")
b2sums=('SKIP'
        '47fb8b927f0f8f83521ffabe83076ae0dee39de9ea35e8f14520e6bd2bea746eff2c73838dcf0b4e84b71d4dbfc8280b1f874afc95f7f696aba4cfd9fccdc36a'
        '41982b18a355b80a2b7a14e92bfcd7ca4d2bd8020c922c1219261d0b15a91eaab895eb2317a16625cd61d71527b9420fb188fffeb2ed765ff256a6eaeccb9330'
        'b275bf80f0dfaa8a89bb97ea28a0c5afd3e900fd82ded97c628f47cebd5442f402c62f0f814099968b31f821248d9661815deae6517917ce8eec6400d96967a6')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_pkgname"
  go mod vendor
  mkdir -p build
}

build() {
  cd "$_pkgname"
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

  cd "$_pkgname"

  # binary
  install -Dm755 "build/$_pkgname" "$pkgdir/usr/bin/$pkgname"

  # license
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$srcdir/$_pkgname/LICENSE"
}
