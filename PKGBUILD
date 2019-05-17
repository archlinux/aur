# Maintainer: Dasith Gunawardhana <dasith.gunawardhana@gmail.com>

_pkgname=nomad
pkgname=${_pkgname}-git
pkgver=v0.9.0_553_ge8a2fdba9
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
  export PATH="$PATH:$GOPATH/bin"

  cd gopath/src/github.com/hashicorp/${_pkgname}
  make bootstrap
}

build() {
  export GOFLAGS="-gcflags=all=-trimpath=${PWD} -asmflags=all=-trimpath=${PWD} -ldflags=-extldflags=-zrelro -ldflags=-extldflags=-znow"

  cd gopath/src/github.com/hashicorp/${_pkgname}
  make dev

  unset GOFLAGS
}

# check() {
#   cd gopath/src/github.com/hashicorp/${_pkgname}
#   make test-nomad
# }

package() {
  cd gopath/src/github.com/hashicorp/${_pkgname}
  install -Dm755 bin/nomad "$pkgdir"/usr/bin/nomad
  install -m644 -D LICENSE "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
}
