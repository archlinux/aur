# Maintainer: Andrew Aralov <andrew-aralov@yandex.ru>

pkgname=nvidia-gpu-prometheus-exporter
pkgver=r15.0d52cd2
pkgrel=0
pkgdesc='NVIDIA GPU Prometheus Exporter'
arch=('x86_64')
url="https://github.com/mindprince/nvidia_gpu_prometheus_exporter"
license=('Apache License 2.0')
makedepends=('go')
source=("git+https://github.com/mindprince/nvidia_gpu_prometheus_exporter.git"
        go.mod.patch
        nvidia-gpu-prometheus-exporter.service)
md5sums=('SKIP'
         'e396386370bbec9a228194f1d3918df9'
         'a2d04c8c0331ae9db991ccb3c7d72f3f')

pkgver(){
  cd "$pkgname-$pkgver"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare(){
  mv "nvidia_gpu_prometheus_exporter" "$pkgname-$pkgver"
  cd "$pkgname-$pkgver"
  mkdir -p build/
  go mod init ${source[0]#git+https://}
  patch go.mod < ../go.mod.patch
  go mod tidy
  go get
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

check() {
  cd "$pkgname-$pkgver"
  go test .
}

package() {
  install -Dm644 nvidia-gpu-prometheus-exporter.service "$pkgdir"/usr/lib/systemd/system/$pkgname.service
  install -Dm755 "$pkgname-$pkgver"/build/nvidia_gpu_prometheus_exporter.git "$pkgdir"/usr/bin/$pkgname
}
