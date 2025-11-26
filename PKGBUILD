# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>

_name=nvidia_gpu_prometheus_exporter
_pkgname=prometheus-nvidia-gpu-exporter
pkgname=prometheus-nvidia-gpu-exporter-git
pkgver=0.2.2.r1.gb942879
pkgrel=1
pkgdesc="Prometheus exporter for NVIDIA GPU metrics"
arch=(x86_64)
url="https://github.com/plazonic/nvidia_gpu_prometheus_exporter"
license=(Apache-2.0)
depends=(
  glibc
  nvidia-utils
)
makedepends=(
  git
  go
)
conflicts=($_pkgname)
provides=($_pkgname)
backup=(etc/conf.d/prometheus-nvidia-gpu-exporter)
source=(
  git+$url.git
  $_pkgname.conf
  $_pkgname.service
  $_pkgname.sysusers
)
b2sums=('SKIP'
        '47fb8b927f0f8f83521ffabe83076ae0dee39de9ea35e8f14520e6bd2bea746eff2c73838dcf0b4e84b71d4dbfc8280b1f874afc95f7f696aba4cfd9fccdc36a'
        '648f4b72feee744b2512bf8a988b59d9c157b43416b2278077c86d52255fccd5c113b4400c71e0d112af128e8b81a95b9c6ee65a5e0fd2c590ad3d0d6ae778b7'
        'ed08af182f80ab7b1b6e08a7a8f348255c1c3788a1695ca5ede167011a378d8d3bf389d37714b953bf91fc81976f63c168bc11dbc4d2943b5ec51b51ea8c38f7')

pkgver() {
  cd $_name
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $_name
  mkdir -p build
}

build() {
  cd $_name

  # set flags for cgo
  export CGO_CPPFLAGS="${CPPFLAGS}"
  # go-nvml breaks with -fno-plt, see below
  export CGO_CFLAGS="${CFLAGS/-fno-plt/}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  # FIXME: go-nvml requires lazy binding (-Wl,-z,lazy) https://github.com/NVIDIA/go-nvml/issues/18
  # Unfortunately lazy binding prevents FULL RELRO but otherwise we get:
  # symbol lookup error: /usr/bin/prometheus-nvidia-gpu-exporter: undefined symbol: nvmlGpuInstanceGetComputeInstanceProfileInfoV
  export CGO_LDFLAGS="${LDFLAGS} -Wl,-z,lazy"

  # set GOPATH so makepkg puts source files into the debug package
  export GOPATH="$srcdir"

  go build -v \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-compressdwarf=false -linkmode external" \
    -o build .
}

package() {
  # systemd files
  install -vDm 644 $_pkgname.conf "$pkgdir"/etc/conf.d/$_pkgname
  install -vDm 644 $_pkgname.service -t "$pkgdir"/usr/lib/systemd/system/
  install -vDm 644 $_pkgname.sysusers "$pkgdir"/usr/lib/sysusers.d/$_pkgname.conf

  cd $_name

  # binary
  install -vDm 755 build/$_name "$pkgdir"/usr/bin/$_pkgname

  # license
  install -vDm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
