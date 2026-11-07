# Maintainer: John-Michael Mulesa <jmulesa@gmail.com>
pkgname=carryout-git
pkgver=0.2.0.r1.g1bd29a9
pkgrel=1
pkgdesc="Resumable, verifying downloader for multi-part Google Takeout exports (Git version)"
arch=('x86_64' 'aarch64')
url="https://github.com/jm2/carryout"
license=('GPL-3.0-or-later')
depends=('glibc')
makedepends=('git' 'go')
provides=("${pkgname%-git}=${pkgver}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

# Arch Go package guidelines: the repository's go, never a downloaded
# toolchain, modules fetched in prepare(), and a PIE build linked externally
# so makepkg's CFLAGS/LDFLAGS (RELRO, etc.) apply.
_goenv() {
  export GOTOOLCHAIN=local
  export GOPATH="${srcdir}/gopath"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
}

_version() {
  # Upstream's release stamps the bare version ("carryout 0.2.0"), no "v".
  git describe --tags | sed 's/^v//'
}

prepare() {
  cd "${pkgname}"
  _goenv
  go mod download
}

build() {
  cd "${pkgname}"
  _goenv
  go build -ldflags "-linkmode=external -X main.version=$(_version)" -o build/carryout .
}

check() {
  cd "${pkgname}"
  _goenv
  go test ./...
  ./build/carryout version | grep -Fx "carryout $(_version)"
}

package() {
  cd "${pkgname}"
  install -Dm755 build/carryout "${pkgdir}/usr/bin/carryout"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname%-git}/README.md"
}
