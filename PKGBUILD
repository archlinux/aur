# Maintainer: Bao Trinh <qubidt@gmail.com>
# Contributor: George Rawlinson <grawlinson@archlinux.org>

_pkgname=nomad-driver-podman
pkgname=${_pkgname}-git
pkgver=v0.3.0.r13.g7e3d018
pkgrel=1
pkgdesc="A nomad taskdriver for podman containers"
arch=('x86_64')
url="https://github.com/hashicorp/nomad-driver-podman"
license=('MPL2')
depends=('nomad' 'podman')
makedepends=('go' 'git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("$pkgname::git+https://github.com/hashicorp/nomad-driver-podman")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$pkgname"
  mkdir -p build
}

build() {
  cd "$srcdir/$pkgname"
  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
    -o build \
    .
}

package() {
  cd "$srcdir/$pkgname"

  # binary
  install -vDm755 -t "$pkgdir/usr/lib/nomad/plugins" "build/$_pkgname"

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$_pkgname" README.md
  cp -vr examples "$pkgdir/usr/share/doc/$_pkgname"
  # note: examples/plugins is an empty folder
  rm -rf "$pkgdir/usr/share/doc/$_pkgname/examples/plugins"
}
