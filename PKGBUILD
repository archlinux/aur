# Maintainer: Jamison Lahman <jamison@lahman.dev>
# Contributor:

pkgname=aligo
pkgver=2.5.3
pkgrel=3
pkgdesc="Utility for checking and viewing Golang struct alignment info"
arch=('x86_64' 'aarch64')
url="https://github.com/essentialkaos/aligo"
license=('Apache-2.0')
depends=('glibc')
makedepends=('git' 'go')
_commit='9abac81a4ae65054144ace987aa971a48ee327c6'
source=("${pkgname}::git+$url.git#commit=$_commit")
sha256sums=('SKIP')

prepare() {
  cd "${pkgname}" || exit

  go mod download -modcacherw
}

build() {
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  cd "${pkgname}" || exit

  # Upstream's Makefile builds with CGO_ENABLED=0 and none of the distribution
  # flags, which yields a non-PIE, unstripped, architecture-specific binary in
  # an arch=('any') package. Build it directly instead.
  go build -trimpath -buildmode=pie -mod=readonly -modcacherw \
    -ldflags="-linkmode=external -X main.gitrev=${_commit:0:7} -s -w" -o "$pkgname"
}

package() {
  cd "${pkgname}" || exit

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
