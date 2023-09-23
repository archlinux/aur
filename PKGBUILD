# Maintainer: Sebastian Meßlinger <sebastian.messlinger@posteo.de>
pkgname=dnslookup-git
pkgver=1.10.0.r75.20230921.0acf48e
pkgrel=1
pkgdesc="Simple command line utility to make DNS lookups to the specified server"
arch=(
  'aarch64'
  'armv6h'
  'armv7h'
  'i686'
  'x86_64'
)
url="https://github.com/ameshkov/dnslookup"
license=('GPL3')
depends=()
makedepends=('go' 'git')
provides=("dnslookup=${pkgver}")
conflicts=("dnslookup")
source=('git+https://github.com/ameshkov/dnslookup.git')
sha1sums=('SKIP')

pkgver() {
  cd "${srcdir}/dnslookup"

  _ver="$(git describe  --tags | sed 's|^[vV]||' | sed 's|-g[0-9a-fA-F]*$||' | tr '-' '+')"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_ver}" ]; then
    error "Version could not be determined."
    return 1
  else
    printf '%s' "${_ver}.r${_rev}.${_date}.${_hash}"
  fi
}

build(){
    cd "${srcdir}/dnslookup"
    mkdir -p "${srcdir}/gopath"
    export GOPATH="${srcdir}/gopath"
    go install -x -v -buildmode=pie -ldflags "-s -w" -trimpath
}

package(){
    mkdir -p "${pkgdir}/usr/bin"

    if [ -v GOBIN ]; then
      _binpath="${GOBIN}"
    else
      _binpath="${srcdir}/gopath/bin"
    fi
    install "${_binpath}/dnslookup" "${pkgdir}/usr/bin/dnslookup"
}
