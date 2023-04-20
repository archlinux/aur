# Maintainer: Christian Heusel <christian@heusel.eu>
pkgname=prometheus-mosquitto-exporter-git
_reponame=mosquitto-exporter
pkgver=v0.8.0.r1.ge097dec
pkgrel=1
pkgdesc='a prometheus exporter for the mosquitto mqtt server'
arch=('x86_64')
url="https://github.com/sapcc/mosquitto-exporter"
license=('Apache')
makedepends=('go' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
backup=("etc/conf.d/prometheus-mosquitto-exporter")
source=("git+https://github.com/sapcc/$_reponame.git"
        prometheus-mosquitto-exporter.conf
        prometheus-mosquitto-exporter.service
        prometheus-mosquitto-exporter.sysusers)
sha256sums=('SKIP'
            '4a6a6f5adee31f3b53f5c4f2de4d3cc73e97e9175c23640214ae5c5199c319f6'
            '2bf191446d190249b6fb90b2a0ed4c4c96403082f05942a9665039cff6001bc0'
            'fd8eac813579e3deca842c6da328d8429e3b4d039e5cd9b596cfe0bb2113d9ff')

pkgver() {
  cd "${_reponame}"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare(){
  cd "${_reponame}"
  mkdir -p build/
}

build() {
  cd "${_reponame}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build .
}

package() {
  install -Dm644 prometheus-mosquitto-exporter.conf     "$pkgdir"/etc/conf.d/prometheus-mosquitto-exporter
  install -Dm644 prometheus-mosquitto-exporter.service  "$pkgdir"/usr/lib/systemd/system/prometheus-mosquitto-exporter.service
  install -Dm644 prometheus-mosquitto-exporter.sysusers "$pkgdir"/usr/lib/sysusers.d/prometheus-mosquitto-exporter.conf

  cd "${_reponame}"
  install -Dm755 build/$_reponame "$pkgdir"/usr/bin/$_reponame
}
