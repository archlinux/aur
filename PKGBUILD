# Maintainer: noraj <printf %s 'YWxleGFuZHJlLnphbm5pQGV1cm9wZS5jb20='|base64 -d>

pkgname=golang-jwt-git
_namespace=golang-jwt
_projectname=jwt
pkgver=5.3.1.r8.g73c870b
pkgrel=1
pkgdesc='Go JWT simple CLI to sign, verify and show tokens.'
arch=('x86_64' 'aarch64')
url='https://golang-jwt.github.io/jwt/'
license=('MIT')
depends=()
makedepends=('git' 'go')
source=("git+https://github.com/$_namespace/$_projectname.git")
sha512sums=('SKIP')
conflicts=('golang-jwt')
provides=('golang-jwt')

pkgver() {
  cd $_projectname

  ( set -o pipefail
    git describe --long --tags --abbrev=7 2>/dev/null |
      sed 's/^v\([0-9]\)/\1/;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "%s.%s" "$(git rev-list --count HEAD)" \
      "$(git rev-parse --short=7 HEAD)"
  )
}

build() {
  cd $_projectname

  GOPATH="$srcdir" go mod download
  GOPATH="$srcdir" go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-s -w" \
    -o $_projectname ./cmd/$_projectname
}

package() {
  cd $_projectname

  install -Dm 755 $_projectname "$pkgdir/usr/bin/$_namespace"
  install -Dm 644 -t "$pkgdir/usr/share/doc/$_namespace/" README.md
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$_namespace/LICENSE"
}

