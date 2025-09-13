# Maintainer: Jakub Klinkovský <lahwaacz@archlinux.org>

pkgname=prometheus-slurm-exporter
pkgver=1.8.0
pkgrel=1
pkgdesc="Prometheus exporter for slurm metrics"
arch=(x86_64)
url="https://github.com/rivosinc/prometheus-slurm-exporter"
license=(Apache-2.0)
depends=(glibc)
makedepends=(go)
backup=(etc/conf.d/$pkgname)
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz
        $pkgname.conf
        $pkgname.service
        $pkgname.sysusers)
b2sums=('e3ceda1748e3f00692794cd0a576a978189bd1968949dd98df4a9d88be7ca31cc1ea860f19c7607ee443e69de4bc62dbe950d0403856fc82dff9b7452f0a8e3d'
        '6d0d7a3cfb9563553440f2dd1c7bf0c09ad2583fd6a7b471a9d6b7a32f46f8dae04b4a6abbbd271e1c21c888f959aa071d627b642511998f8d8410be34f34646'
        'a760ee6c1af298ccc77a2b4bc09e8d3442141d6b42e0d4b3e374731edddeb4c6eac3882b7abab3718e736f2c770084dd5f7455e296b19e69665a3934bc9afaea'
        '62b1e255175c7b9475c2bbf2860696200a79891de00706a6e42283cadea17193042f96aacc4f06f27bb2643554f31d1f5244dc4f301cce31393d239bbc35e70a')

prepare() {
  cd $pkgname-$pkgver
  mkdir -p build
}

build() {
  cd $pkgname-$pkgver

  # set flags for cgo
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"

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
  install -vDm 644 $pkgname.service -t "$pkgdir"/usr/lib/systemd/system/
  install -vDm 644 $pkgname.sysusers -t "$pkgdir"/usr/lib/sysusers.d/
  install -vDm 644 $pkgname.conf "$pkgdir"/etc/conf.d/$pkgname

  cd $pkgname-$pkgver

  # binary
  install -vDm 755 build/$pkgname "$pkgdir"/usr/bin/$pkgname

  # license
  install -vDm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
