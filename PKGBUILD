# Maintainer: seiuneko <chfsefefgesfen foxmail>

_pkgname=cloak
pkgname=cloak-obfuscation-git
pkgver=v2.2.1.r0.g98a7b73
pkgrel=2
pkgdesc=' A censorship circumvention tool to evade detection against state adversaries  '
arch=('x86_64')
url="https://github.com/cbeuw/Cloak/"
license=('GPL3')
makedepends=('go')
source=("cloak::git+https://github.com/cbeuw/Cloak.git")
sha256sums=('SKIP')
backup=('etc/cloak/ckclient.json' 'etc/cloak/ckserver.json')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare(){
  mkdir -p gopath "$_pkgname"/build
}

build() {
  cd "$_pkgname"
  export GOPATH="$srcdir/gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build -o build -ldflags "-X main.version=${pkgver}" ./cmd/...
}

package() {

  cd "$_pkgname"

  cd build
  install -Dm755 ck-server "$pkgdir"/usr/bin/ck-server
  install -Dm755 ck-client "$pkgdir"/usr/bin/ck-client

  cd ../example_config
  install -Dm644 ckclient.json "$pkgdir"/etc/cloak/ckclient.json
  install -Dm644 ckserver.json "$pkgdir"/etc/cloak/ckserver.json
}
