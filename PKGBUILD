# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=gopro-utils-git
_pkgname=gopro-utils
pkgver=r51.cfaf1ce
pkgrel=1
pkgdesc="Tools to parse GPMF telemetry (GPS, accelerometer, gyro) from GoPro cameras"
arch=('x86_64' 'i686')
url="https://github.com/KonradIT/gopro-utils"
license=('BSD-2-Clause')
depends=('glibc')
makedepends=('go' 'git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}"::git+https://github.com/KonradIT/gopro-utils)
md5sums=(SKIP)

pkgver() {
  cd "$srcdir/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/${_pkgname}"
  export GOPATH="$srcdir/gopath"
  go mod download
}

build() {
  cd "$srcdir/${_pkgname}"
  export GOPATH="$srcdir/gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build/ ./bin/...
}

package() {
  cd "$srcdir/${_pkgname}"
  for b in gopro2gpx gopro2json gpmdinfo; do
    install -Dm755 "build/$b" "$pkgdir/usr/bin/$b"
  done
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
