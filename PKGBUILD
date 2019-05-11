# Maintainer: Dasith Gunawardhana <dasith.gunawardhana@gmail.com>

_pkgname=nomad
pkgname=${_pkgname}-git
pkgver=v0.9.0_451_g9b6e5c1fd
pkgrel=1
pkgdesc="Nomad is an easy-to-use, flexible, and performant workload orchestrator that can deploy a mix of microservice, batch, containerized, and non-containerized applications. Nomad is easy to operate and scale and has native Consul and Vault integrations."
arch=('x86_64')
url="https://www.nomadproject.io/"
license=('MPL2')
depends=('glibc')
makedepends=('go' 'git')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("git+https://github.com/hashicorp/nomad.git")
sha256sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  git describe | sed 's/[- ]/_/g'
}

prepare() {
  mkdir -p gopath/src/github.com/hashicorp
  ln -rTsf ${_pkgname} gopath/src/github.com/hashicorp/${_pkgname}
  export GOPATH="$srcdir"/gopath

  cd gopath/src/github.com/hashicorp/${_pkgname}
  make bootstrap
}

build() {
  export GOPATH="$srcdir"/gopath
  export GOFLAGS="-gcflags=all=-trimpath=${PWD} -asmflags=all=-trimpath=${PWD} -ldflags=-extldflags=-zrelro -ldflags=-extldflags=-znow"

  cd gopath/src/github.com/hashicorp/${_pkgname}
  make dev
}

# check() {
#   export GOPATH="$srcdir"/gopath

#   cd gopath/src/github.com/hashicorp/${_pkgname}
#   make test
# }

package() {
  cd gopath/src/github.com/hashicorp/${_pkgname}
  install -Dm755 bin/nomad "$pkgdir"/usr/bin/nomad
  install -m644 -D LICENSE "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
}
