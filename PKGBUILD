# Maintainer: Dasith Gunawardhana <dasith.gunawardhana@gmail.com>

_pkgname=consul
pkgname=${_pkgname}-git
pkgver=v1.5.0_35_gf452de1c5
pkgrel=1
pkgdesc="Consul is a distributed, highly available, and data center aware solution to connect and configure applications across dynamic, distributed infrastructure."
arch=('x86_64')
url="https://www.consul.io/"
license=('MPL2')
depends=('glibc')
makedepends=('go' 'git')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("git+https://github.com/hashicorp/consul.git")
sha256sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  git describe | sed 's/[- ]/_/g'
}

prepare() {
  mkdir -p gopath
  export GOPATH="${srcdir}/gopath"
  export PATH="$PATH:$GOPATH/bin"

  cd ${_pkgname}
  make tools
}

build() {
  export GOFLAGS="-gcflags=all=-trimpath=${PWD} -asmflags=all=-trimpath=${PWD} -ldflags=-extldflags=-zrelro -ldflags=-extldflags=-znow"

  cd ${_pkgname}
  make dev

  unset GOFLAGS
}

# check() {
#   cd ${_pkgname}
#   make test
# }

package() {
  cd ${_pkgname}
  install -Dm755 bin/consul "$pkgdir"/usr/bin/consul
  install -m644 -D LICENSE "$pkgdir/usr/share/licenses/consul/LICENSE"
}
