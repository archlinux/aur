# Maintainer: hafeoz <hafeoz@kolabnow.com>
pkgname=matrix-wechat-git
_pkgname=matrix-wechat
pkgver=0.1.0.r2.g9abc502
pkgrel=2
pkgdesc=' A Matrix-WeChat puppeting bridge'
arch=('x86_64')
url="https://github.com/duo/matrix-wechat"
license=('AGPL3')
makedepends=('go' 'git' 'libolm')
source=("git+https://github.com/duo/matrix-wechat.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}
prepare(){
  cd "$_pkgname"
  mkdir -p build/
}

build() {
  cd "$_pkgname"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build
}

check() {
  cd "$_pkgname"
  go test
}

package() {
  cd "$_pkgname"
  install -Dm755 build/$_pkgname "$pkgdir"/usr/bin/$_pkgname
  install -Dm644 example-config.yaml "$pkgdir"/etc/$_pkgname/config.yaml
  install -Dm644 "../${_pkgname}.service" "$pkgdir"/usr/lib/systemd/system/${_pkgname}.service
}

