# Maintainer: Gergely Imreh <imrehg@gmail.com>
# This package is heavily inspired by go-ipfs-git, wich has the following contributors:
# Contributor: Jakub "Kubuxu" Sztandera <kubuxu@protonmail.ch>
# Contributor: Frederik “Freso” S. Olesen <freso.dk@gmail.com>
# Contributor: kpcyrd <git@rxv.cc>
# Contributor: Ian Naval <ianonavy@gmail.com>

_pkgname=go-filecoin
pkgname=$_pkgname-git
pkgver=nightly_33814_fb13ac_246_gd75e700d
pkgrel=1
pkgdesc='A decentralized storage network, full node implementation in Go'
_organization='filecoin-project'
url="https://github.com/$_organization/$_pkgname"
arch=('x86_64')
license=('MIT' 'Apache-2.0')
makedepends=('git' 'go>=1.11.2' 'pkgconf' 'clang' 'jq')
optdepends=('rustup: compiling proofs from scratch')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+${url}.git")

sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed -e 's/-/_/g'
}

prepare() {
  # Get all the submodules as well
  cd "${srcdir}/${_pkgname}"
  git submodule update --init --recursive

  # Set up go build environment
  local targetorg="${srcdir}/src/github.com/${_organization}"
  local targetrepo="${targetorg}/${_pkgname}"
  mkdir -p "${targetorg}"
  if [ ! -e "${targetrepo}" ]; then
    ln -sf "${srcdir}/${_pkgname}" "${targetrepo}"
  fi
}

build() {
  # Required for go get
  export GOPATH="$srcdir"
  export GOBIN="$srcdir/bin"
  export PATH=$PATH:$GOPATH/bin

  msg2 'Installing dependencies...'
  cd "$GOPATH/src/github.com/${_organization}/${_pkgname}"
  if ! command -v rustup > /dev/null; then
    echo "No rustup, will be using precompiled rust proofs and bls signatures."
    export FILECOIN_USE_PRECOMPILED_BLS_SIGNATURES=yes
    export FILECOIN_USE_PRECOMPILED_RUST_PROOFS=yes
  fi
  make deps

  msg2 'Building binary...'
  make all
}

package() {
  cd "${srcdir}/src/github.com/${_organization}/${_pkgname}"

  install -Dm 755 go-filecoin "${pkgdir}/usr/bin/go-filecoin"
}
