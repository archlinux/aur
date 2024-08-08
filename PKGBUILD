# Maintainer: Christian Heusel <christian@heusel.eu>
pkgname=prometheus-mosquitto-exporter
_pkgname=mosquitto-exporter
pkgver=0.8.0
pkgrel=2
pkgdesc='a prometheus exporter for the mosquitto mqtt server'
arch=('x86_64')
url="https://github.com/sapcc/mosquitto-exporter"
license=('Apache-2.0')
makedepends=('go' 'glibc')
backup=("etc/conf.d/prometheus-mosquitto-exporter")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        prometheus-mosquitto-exporter.conf
        prometheus-mosquitto-exporter.service
        prometheus-mosquitto-exporter.sysusers)
sha256sums=('47572232b5943630c3c24a10eac64c0010d68b33d591a39cc8870300c6fad291'
            '4a6a6f5adee31f3b53f5c4f2de4d3cc73e97e9175c23640214ae5c5199c319f6'
            '2bf191446d190249b6fb90b2a0ed4c4c96403082f05942a9665039cff6001bc0'
            'fd8eac813579e3deca842c6da328d8429e3b4d039e5cd9b596cfe0bb2113d9ff')

prepare(){
  cd "$_pkgname-$pkgver"
  mkdir -p build/
}

build() {
  cd "$_pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build -ldflags="-linkmode=external -compressdwarf=false" -o build .
}

package() {
  install -Dm644 prometheus-mosquitto-exporter.conf     "$pkgdir"/etc/conf.d/prometheus-mosquitto-exporter
  install -Dm644 prometheus-mosquitto-exporter.service  "$pkgdir"/usr/lib/systemd/system/prometheus-mosquitto-exporter.service
  install -Dm644 prometheus-mosquitto-exporter.sysusers "$pkgdir"/usr/lib/sysusers.d/prometheus-mosquitto-exporter.conf

  cd "$_pkgname-$pkgver"
  install -Dm755 build/$_pkgname "$pkgdir"/usr/bin/$_pkgname
}
