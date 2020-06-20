# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=mylg-git
pkgver=0.2.6.r60.gfaba867
pkgrel=1
pkgdesc="An open source software utility which combines the functions of the different network probes in one network diagnostic tool"
arch=('x86_64')
url='http://mylg.io'
license=('MIT')
depends=('libpcap')
makedepends=('go' 'git')
source=("mylg::git+https://github.com/mehrdadrad/mylg")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/mylg"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/mylg"
  mkdir -p build/
}

build() {
  cd "${srcdir}/mylg"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -modcacherw"
  go build -o build ./...
}

package() {
  cd "${srcdir}/mylg"
  install -Dm755 build/mylg "${pkgdir}/usr/bin/${pkgname%-git}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}