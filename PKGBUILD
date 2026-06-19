# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=bbscope-git
pkgver=r409.2d3bae6
pkgrel=1
pkgdesc="Scope aggregation tool for bug bounty platforms (HackerOne, Bugcrowd, Intigriti, YesWeHack, Immunefi)"
arch=('x86_64')
url="https://github.com/sw33tLie/bbscope"
license=('Apache-2.0')
depends=('glibc')
makedepends=('git' 'go')
source=("${pkgname%-git}::git+https://github.com/sw33tLie/bbscope.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname%-git}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  go build -buildmode=pie -trimpath -ldflags="-s -w -linkmode=external -extldflags \"${LDFLAGS}\""
}

package() {
  cd "${pkgname%-git}"
  install -Dm755 bbscope "${pkgdir}/usr/bin/bbscope"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
}
