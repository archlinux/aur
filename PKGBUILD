# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
_projectname=skycoin
pkgname=skycoin-explorer
_pkgname=${pkgname}
_githuborg=${_projectname}
pkgdesc="Skycoin Blockchain Explorer: https://explorer.skycoin.com/"
pkgver=20230423.647_5409e9a
pkgrel=1
_pkggopath="github.com/${_githuborg}/${_pkgname}"
arch=( 'i686' 'x86_64' 'aarch64' 'armv8' 'armv7' 'armv7l' 'armv7h' 'armv6h' 'armhf' 'armel' 'arm' )
url="https://${_pkggopath}"
license=()
makedepends=('git' 'go' 'npm' 'musl' 'kernel-headers-musl' 'npm' 'angular-cli')
source=("git+${url}.git#branch=${BRANCH:-develop}")
sha256sums=('SKIP')


pkgver() {
  cd "${srcdir}/${_pkgname}"
  local date=$(git log -1 --format="%cd" --date=short | sed s/-//g)
  local count=$(git rev-list --count HEAD)
  local commit=$(git rev-parse --short HEAD)
  echo "${date}.${count}_${commit}"
}


build () {
#  msg2 'installing go dependencies'
  export GOPATH="${srcdir}"/go
  export GOBIN=${GOPATH}/bin
  #use musl-gcc for static compilation
  export CC=musl-gcc
  mkdir -p ${srcdir}/go/bin
  cd ${_pkgname}
  #[[ ! -f go.mod ]] && go mod init
  #go mod tidy ; go mod vendor
  go build -trimpath --ldflags="" --ldflags " -s -w -linkmode external -extldflags '-static' -buildid=" -o $GOBIN/ .
  if [[ ! -d dist ]]; then
  #build the UI
  NG_FORCE_TTY=false npm install
  NG_FORCE_TTY=false npm run build
fi
}


package() {
  mkdir -p ${pkgdir}/usr/bin
  mkdir -p ${pkgdir}/opt/${_pkgname}/bin
  install -Dm755 ${srcdir}/go/bin/${_pkgname} ${pkgdir}/opt/${_pkgname}/bin/${_pkgname}
  ln -rTsf ${pkgdir}/opt/${_pkgname}/bin/${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
  cp -ar ${srcdir}/${_pkgname}/dist ${pkgdir}/opt/${_pkgname}/dist
}
