# Maintainer: Gergely Imreh <imrehg@gmail.com>
# This package is heavily inspired by go-ipfs-git, wich has the following contributors:
# Contributor: Jakub "Kubuxu" Sztandera <kubuxu@protonmail.ch>
# Contributor: Frederik “Freso” S. Olesen <freso.dk@gmail.com>
# Contributor: kpcyrd <git@rxv.cc>
# Contributor: Ian Naval <ianonavy@gmail.com>

pkgname=go-filecoin
pkgver=0.2.2
pkgrel=1
pkgdesc='A decentralized storage network, full node implementation in Go'
_organization='filecoin-project'
url="https://github.com/$_organization/$pkgname"
arch=('x86_64')
license=('MIT' 'Apache-2.0')
#makedepends=('git' 'go>=1.11.2' 'rust>=1.31.0' 'pkgconf' 'clang')
makedepends=('git' 'go>=1.11.2' 'rustup' 'pkgconf' 'clang')
optdepends=()
conflicts=("${pkgname}-git")
source=("git+https://github.com/filecoin-project/go-filecoin.git#tag=${pkgver}")

md5sums=('SKIP')
sha256sums=('SKIP')
sha512sums=('SKIP')

prepare() {
  # Get all the submodules as well
  cd "${srcdir}/${pkgname}"

  # Set up go build environment
  local targetorg="${srcdir}/src/github.com/${_organization}"
  local targetrepo="${targetorg}/${pkgname}"
  mkdir -p "${targetorg}"
  if [ ! -e "${targetrepo}" ]; then
    ln -sf "${srcdir}/${pkgname}" "${targetrepo}"
  fi
}

build() {
  # Required for go get
  export GOPATH="$srcdir"
  export GOBIN="$srcdir/bin"
  export PATH=$PATH:$GOPATH/bin

  msg2 'Installing dependencies...'
  cd "$GOPATH/src/github.com/${_organization}/${pkgname}"
  # Use precompiled versions of proofs here
  export FILECOIN_USE_PRECOMPILED_RUST_PROOFS=true
  export FILECOIN_USE_PRECOMPILED_BLS_SIGNATURES=yes
  make deps

  msg2 'Building binary...'
  make all
}

package() {
  cd "${srcdir}/src/github.com/${_organization}/${pkgname}"

  install -Dm 755 go-filecoin "${pkgdir}/usr/bin/go-filecoin"
}
