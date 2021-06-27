# Maintainer: Davide Depau <davide@depau.eu>

_pkgname=ttyc
pkgname=ttyc-git
pkgver=20210628.v0.3.0.ttyc.gdf4a5c7
pkgrel=1
pkgdesc='ttyd protocol client + Wi-Se remote terminal configuration tool'
arch=('x86_64' 'i686' 'pentium4' 'armv7h' 'aarch64')
url="https://github.com/Depau/ttyc"
license=('GPL3')
makedepends=('go')
source=("git+https://github.com/Depau/ttyc.git#branch=main")
conflicts=('ttyc' 'wistty')
provides=('ttyc' 'wistty')
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  # Ensure version always increases
  local commit_date="$(date --date="@$(git log -1 --format=%ct)" +%Y%m%d)"
  local descr="$(git describe --long --tags)"
  local projtag="${descr%%-*}"
  local ver_long="${descr#*-}"
  local ver="${ver_long%-*}"
  local commit="${ver_long##*-}"
  printf '%s-%s' "$commit_date" "$ver" | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
  printf '.%s.%s' "$projtag" "$commit"
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
  go build -o build ./cmd/ttyc
  go build -o build ./cmd/wistty
}

package() {
  cd "$_pkgname"
  install -Dm755 build/ttyc "$pkgdir"/usr/bin/ttyc
  install -Dm755 build/wistty "$pkgdir"/usr/bin/wistty
}
