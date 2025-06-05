# Maintainer: D. Can Celasun <can[at]dcc[dot]im>
pkgname=prometheus-transmission-exporter-git
_pkgname=transmission-exporter
pkgver=0.3.1.r0.gc7771a1
pkgrel=1
pkgdesc="Prometheus exporter for Transmission metrics"
arch=('x86_64' 'aarch64')
url="https://github.com/dcelasun/${_pkgname}"
options=(!lto)
license=('MIT')
makedepends=('go>=1.21')
source=("git+https://github.com/dcelasun/${_pkgname}.git#branch=feat/perf-dashboard-improvements"
        "prometheus-${_pkgname}.service"
        "prometheus-${_pkgname}.conf")
b2sums=('SKIP'
        '743a4672985424f8b3d81b9a8f7e89898bb6cf16814640a0b8b0ea3eef52d41788623c8a2b9e11c29a1dd89d616bb6c586b4ad035b6c50e65d03203327f5379d'
        '7043095952720077502e4dab9c396086f24a976b272c08faf53f908169ca859e26dfc6eeb3d0fcbe538637d16a405d86e46c7ef71fca89cf25d41d54b15e9b6f')
pkgver() {
  cd "$_pkgname"
  ( set -o pipefail
    git describe --long --tags --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

prepare() {
  cd "$_pkgname"
  go mod vendor
  mkdir -p build
}

build() {
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  # set GOPATH so makepkg puts source files into the debug package
  export GOPATH="$srcdir"

  cd "$_pkgname"
  go build -o build/ "./cmd/${_pkgname}"
}

package() {
  # systemd service
  install -vDm 644 "prometheus-${_pkgname}.service" -t "$pkgdir/usr/lib/systemd/system/"
  install -vDm 644 "prometheus-${_pkgname}.conf" "$pkgdir/etc/conf.d/prometheus-${_pkgname}"

  cd "$_pkgname"

  # binary
  install -vDm 755 "build/${_pkgname}" "$pkgdir/usr/bin/prometheus-${_pkgname}"

  # license
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/prometheus-${_pkgname}/"
}

