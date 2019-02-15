# Maintainer: Gergely Imreh <imrehg@gmail.com>
# This package is heavily inspired by go-ipfs-git, wich has the following contributors:
# Contributor: Jakub "Kubuxu" Sztandera <kubuxu@protonmail.ch>
# Contributor: Frederik “Freso” S. Olesen <freso.dk@gmail.com>
# Contributor: kpcyrd <git@rxv.cc>
# Contributor: Ian Naval <ianonavy@gmail.com>

_pkgname=go-filecoin
pkgname=$_pkgname-git
pkgver=0.0.1.r23.g271a6812
pkgrel=3
pkgdesc='A decentralized storage network, full node implementation in Go'
_organization='filecoin-project'
url="https://github.com/$_organization/$_pkgname"
arch=('x86_64')
license=('MIT' 'Apache-2.0')
makedepends=('git' 'go>=1.11.2' 'rust>=1.31.0' 'pkgconf' 'jq')
optdepends=()
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+${url}.git")

sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  VERSION=$(jq -r .version package.json)
  REST=$(git describe --long --tags | sed -e 's/^v//' -e 's/^\(.*\)-\([0-9]*\)-\(g[0-9a-f]*\)$/r\2.\3/')
  printf "%s.%s" "$VERSION" "$REST" | sed -e 's/-//g'
}

prepare() {
  # Get all the submodules as well
  cd "${srcdir}/${_pkgname}"

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
  make deps

  msg2 'Building binary...'
  make all
}

package() {
  cd "${srcdir}/src/github.com/${_organization}/${_pkgname}"

  install -Dm 755 go-filecoin "${pkgdir}/usr/bin/go-filecoin"
}
