# Maintainer: Jakub Klinkovský <j.l.k@gmx.com>

pkgname=prometheus-nvidia-gpu-exporter
_pkgname=nvidia_gpu_prometheus_exporter
pkgver=r31.e7d86ca
pkgrel=4
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
        '9ded6ab52caaada85d5dedf681b74a581c75e0c9acb04cc39347c0610882d0a9eb0219a923256413085768a8c58a6ba540fd0ab91b0e2d25ccf37991d01801a0'
        'b275bf80f0dfaa8a89bb97ea28a0c5afd3e900fd82ded97c628f47cebd5442f402c62f0f814099968b31f821248d9661815deae6517917ce8eec6400d96967a6')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_pkgname"
  # github.com/cfsmp3/gonvml does not have go.mod and go.sum
  go mod download github.com/cfsmp3/gonvml
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
