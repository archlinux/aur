# Maintainer: chaotic_cilliac <theophile.gm(at)happyngreen.fr>

pkgname=termsonic-git
pkgver=0.2.r2.gf6f61fd
pkgrel=1
pkgdesc='A terminal-based (TUI) client for any Subsonic-compatible server.'
arch=('x86_64')
url='https://git.sixfoisneuf.fr/termsonic'
license=('GPL-3.0-only')
depends=('alsa-lib')
makedepends=('git' 'go>=1.19')
# source=("${pkgname}::git+https://git.sixfoisneuf.fr/termsonic")
source=("git+https://git.sixfoisneuf.fr/termsonic")
sha256sums=('SKIP')
conflicts=('termsonic')

pkgver() {
  cd termsonic
  # If there are no tags, use commit count and hash
  local version=$(git describe --long --tags 2>/dev/null || echo "0.0.0-$(git rev-list --count HEAD)-g$(git rev-parse --short HEAD)")
  printf "%s" "$(echo "$version" | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')"
}

prepare() {
  cd termsonic
  go mod download
}

build() {
  cd termsonic
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o termsonic ./cmd/termsonic/
}

package() {
  cd termsonic
  install -Dm755 termsonic -t "${pkgdir}/usr/bin/"
}
