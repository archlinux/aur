# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=vixl44-git
_pkgname=vixl44
pkgver=r83.8001e33
pkgrel=1
pkgdesc="Create pixel art inside your terminal using vim movements"
arch=('x86_64')
url='https://sebashwa.github.io/vixl44'
license=('GPL3')
provides=('vixl44')
depends=('glibc')
makedepends=('git' 'go')
source=("vixl44::git+https://github.com/sebashwa/vixl44")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${_pkgname}"
  mkdir -p build/
}

build() {
  cd "${_pkgname}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOPATH="${srcdir}"/go
  export PATH=$PATH:$GOPATH/bin
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go get -d -v ./...
  go build -o build ./...
  go clean -modcache # Clean go cache
}

package() {
  cd "${_pkgname}"
  install -Dm755 build/vixl44 "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}