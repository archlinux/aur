# Maintainer: FLX (Paul Werther) <flx@evait.de>
pkgname=pd-tools
_pkgname=pdtm
pkgver=20230423
pkgrel=1
pkgdesc='pdtm is a simple and easy-to-use golang based tool for managing open source projects from ProjectDiscovery'
arch=('x86_64' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/projectdiscovery/pdtm'
license=('MIT')
makedepends=('go' 'git')
provides=("aix" "chaos-client" "asnmap" "nuclei" "pdtm" "katana" "subfinder" "dnsx" "naabu" "httpx" "uncover" "cloudlist" "proxify" "tlsx" "notify" "chaos-client" "shuffledns" "mapcidr" "interactsh-server" "interactsh-client")
conflicts=("aix" "chaos-client" "asnmap" "nuclei" "pdtm" "katana" "subfinder" "dnsx" "naabu" "httpx" "uncover" "cloudlist" "proxify" "tlsx" "notify" "chaos-client" "shuffledns" "mapcidr" "interactsh-server" "interactsh-client")
depends=('glibc')
source=("${_pkgname}::git+https://github.com/projectdiscovery/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
  date +'%Y%m%d'
}

prepare() {
  export GOPATH="${srcdir}/gopath"
  go clean -modcache
}

build() {
  cd "${srcdir}/${_pkgname}/cmd/${_pkgname}"
  export GOPATH="${srcdir}/gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  mkdir -p ../build
  go build -o ../build -v ./...

  go clean -modcache
}

package() {
  cd "${srcdir}/${_pkgname}"
  ./cmd/build/${_pkgname} -install-all
  for file in /build/.pdtm/go/bin/*; do
    install -Dvm755 "$file" -t "${pkgdir}/usr/bin/"
  done
}
