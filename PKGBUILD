# Maintainer: textfuel <https://github.com/textfuel>
pkgname=lazyjira-git
pkgver=2.6.8
pkgrel=1
pkgdesc="Terminal UI for Jira (builds from git source)"
arch=('x86_64' 'aarch64')
url="https://github.com/textfuel/lazyjira"
license=('MIT')
provides=('lazyjira')
conflicts=('lazyjira' 'lazyjira-bin')
makedepends=('go' 'git')
source=("${pkgname}::git+https://github.com/textfuel/lazyjira.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' || \
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

build() {
  cd "${srcdir}/${pkgname}"
  export CGO_ENABLED=0
  go build -ldflags "-s -w -X main.version=${pkgver}" -o lazyjira ./cmd/lazyjira
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm755 lazyjira "${pkgdir}/usr/bin/lazyjira"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
