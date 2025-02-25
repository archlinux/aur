_pkgname=bpf2go
pkgname=go-"${_pkgname}"
_gomodulename=ebpf
pkgver=0.17.3
pkgrel=1
pkgdesc='Compiles a C source file into eBPF bytecode and then emits a Go file containing the eBPF'
arch=('x86_64')
url="https://github.com/cilium/${_gomodulename}/tree/main/cmd/bpf2go"
license=('MIT')
makedepends=('go')
source=("${_gomodulename}-$pkgver.tar.gz"::"https://github.com/cilium/${_gomodulename}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ec157b1d8547a3bbce18b5c7e8cf37e40a697a02173d9fbf4cfd4410b60747f3')

prepare(){
  cd "${_gomodulename}-$pkgver"
  mkdir -p build/
}

build() {
  cd "${_gomodulename}-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build ./cmd/"${_pkgname}"
}

#check() {
#  cd "${_gomodulename}-$pkgver"
#  go test ./cmd/"${_pkgname}"/...
#}

package() {
  cd "${_gomodulename}-$pkgver"
  install -Dm755 build/"${_pkgname}" "$pkgdir"/usr/bin/"${_pkgname}"
}
