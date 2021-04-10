# Maintainer: Andrea Denisse Gómez-Martínez <aur at denisse dot dev>

pkgname=oauth2-proxy-git
_pkgname=${pkgname%-git}
pkgdesc='A reverse proxy that provides authentication with Google, Github or other providers.'
arch=(aarch64 armv6h x86_64)
url='https://oauth2-proxy.github.io/oauth2-proxy/'
_url='https://github.com/oauth2-proxy/oauth2-proxy'
_branch='master'
pkgver=v0.1.r1467.g42475c28
pkgrel=1
license=('MIT')
makedepends=(git go sed)
source=("$_pkgname::git+$_url.git#branch=$_branch")
sha256sums=('SKIP')
provides=($_pkgname)
conflicts=($_pkgname)

pkgver() {
  cd "$_pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "${_pkgname}"
  mkdir -p build
  sed -i 's|/usr/local/bin/oauth2-proxy|/usr/bin/oauth2-proxy|' "contrib/$_pkgname.service.example"
}

build() {
  cd "${_pkgname}"

  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go build -o build/ .
}

check() {
  cd "${_pkgname}"
  go test ./...
}

package() {
  cd "${_pkgname}"

  install -Dm755 "build/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "contrib/$_pkgname.cfg.example" "$pkgdir/etc/oauth2-proxy.cfg"
  install -Dm644 "contrib/$_pkgname.service.example" "$pkgdir/usr/lib/systemd/system/oauth2-proxy.service"
}
