# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=simplehttp-git
pkgver=r11.ca3634f
pkgrel=1
pkgdesc="Pretty simple and lightweight http server for serving local files"
arch=('x86_64')
url='https://github.com/snwfdhmp/simplehttp'
license=('Apache')
provides=('simplehttp')
depends=('glibc')
makedepends=('go' 'git')
source=("simplehttp::git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/simplehttp"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/simplehttp"
  mkdir -p build/
}

build() {
  cd "${srcdir}/simplehttp"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -modcacherw"
  go get -d -v ./...
  go build -o build ./...
}

package() {
  cd "${srcdir}/simplehttp"
  install -Dm755 build/simplehttp "${pkgdir}/usr/bin/simplehttp"
}