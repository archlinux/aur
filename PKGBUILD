# Maintainer: Tim Schrodi <mail at timschrodi dot tech>
pkgname=kubeswitch
pkgver=0.8.1
pkgrel=1
pkgdesc="kubeswitch (lazy: switch) is the single pane of glass for all of your kubeconfig files.
Caters to operators of large scale Kubernetes installations. Designed as a drop-in replacement for kubectx."
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/danielfoehrKn/kubeswitch"
license=('')
makedepends=('go')
provides=('switch')
install=switcher.install
source=("https://github.com/danielfoehrKn/kubeswitch/archive/${pkgver}.tar.gz")
noextract=()
sha256sums=('be9860ecbfd40e3f0b8f94b969ce4218f3cd3d4cd5e329509a1bc597f6d6108a')

build() {
  cd "${pkgname}-${pkgver}"
  DATE=$(date -u +%Y-%m-%d)

  export CGO_LDFLAGS="$LDFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export GO_FLAGS="-buildmode=pie -mod=readonly -modcacherw"

  go build -mod=vendor --ldflags "-w -X github.com/danielfoehrkn/kubeswitch/cmd/switcher.version=${pkgver} -X github.com/danielfoehrkn/kubeswitch/cmd/switcher.buildDate=${DATE}" -o ./switcher ./cmd/main.go
}

check() {
  cd "${pkgname}-${pkgver}"
  GO111MODULE=on go test -race -mod=vendor ./pkg/...
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 ./switcher "${pkgdir}/usr/bin/switcher"
  install -Dm755 ./hack/switch/switch.sh "${pkgdir}/usr/bin/switch.sh"
}