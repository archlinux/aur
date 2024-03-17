# Maintainer: FLX (Paul Werther) <flx@evait.de>
pkgname=pd-tools
_pkgname=pdtm
pkgver=20240317
pkgrel=1
pkgdesc='Provides all open source tools available in one package from ProjectDiscovery by installing the precompiled binaries using pdtm'
arch=('x86_64' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/projectdiscovery/pdtm'
license=('MIT')
makedepends=('go' 'git')
provides=("aix" "chaos-client" "asnmap" "nuclei" "pdtm" "katana" "subfinder" "dnsx" "naabu" "httpx" "uncover" "cloudlist" "proxify" "tlsx" "notify" "chaos-client" "shuffledns" "mapcidr" "interactsh-server" "interactsh-client" "cvemap")
conflicts=("aix" "chaos-client" "asnmap" "nuclei" "pdtm" "katana" "subfinder" "dnsx" "naabu" "httpx" "uncover" "cloudlist" "proxify" "tlsx" "notify" "chaos-client" "shuffledns" "mapcidr" "interactsh-server" "interactsh-client" "cvemap")
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
  ./cmd/build/${_pkgname} -install-all -binary-path ${pkgdir}
  for file in ${pkgdir}/*; do
    if [ -f "$file" ]; then
      install -Dvm755 "$file" -t "${pkgdir}/usr/bin/"
    fi
  done
}
