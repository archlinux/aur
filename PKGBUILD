# Maintainer: Trevor Mosey <trevor dot mosey at gmail dot com>

pkgname=flyctl
pkgver="0.0.435"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("any")
url="https://github.com/superfly/flyctl"
license=("Apache")
makedepends=(git go)
provides=("flyctl")
conflicts=("flyctl")
_commit=c51496292b7885982e3f0994f7a548424abb908a        #refs/tags/v0.0.435^{}
source=("git+$url#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/^v//;s/-/+/g'
}

build() {
  cd $pkgname
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  make VERSION=$pkgver build
}

check() {
  make -C $pkgname test
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  ln -s "/usr/bin/flyctl" "$pkgdir/usr/bin/fly"
  install -m755 "$srcdir/flyctl/bin/flyctl" "$pkgdir/usr/bin"
}

# getver: github.com/superfly/flyctl/releases
# vim: ts=2 sw=2 et:
