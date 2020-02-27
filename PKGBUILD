# Maintainer: Victor Roest <victor@xirion.net>
# Based on the official k9s PKGBUILD by: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=k9s-git
_pkgname=k9s
pkgver=v0.17.0.r5.ge936b17
pkgrel=1
pkgdesc='Kubernetes TUI for managing clusters and pods'
arch=(x86_64)
url='https://github.com/derailed/k9s'
license=(APACHE)
makedepends=(git go-pie)
provides=(k9s)
conflicts=(k9s)
source=("git+$url")
sha256sums=('SKIP')

build() {
  cd $_pkgname
  go build \
    -gcflags "all=-trimpath=${PWD}" \
    -asmflags "all=-trimpath=${PWD}" \
    -ldflags "-extldflags ${LDFLAGS}" \
    -o $_pkgname
}

package() {
  cd $_pkgname
  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}

pkgver() {
    cd $_pkgname
    ( set -o pipefail
      git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

# vim: ts=2 sw=2 et:

