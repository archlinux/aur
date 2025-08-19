# Maintainer: Carl Kittelberger <icedream@icedream.pw>
_pkgname=docker-credential-ghcr-login
pkgname="${_pkgname}-git"
pkgver=r20.e4e5dc0
pkgrel=2
pkgdesc="Automagically auth to GitHub Container Registry via docker credential helper."
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64' 'riscv64')
url="https://github.com/bradschwartz/docker-credential-ghcr-login"
options=(!lto)
license=('unknown')
depends=()
makedepends=('go>=1.23' 'git')
source=("${_pkgname}::git+https://github.com/bradschwartz/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  if git show-ref --tags >/dev/null 2>/dev/null; then
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  else
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  fi
}

build() {
  export GOPATH="$srcdir"/gopath
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_ENABLED=1

  cd "$srcdir/$_pkgname"
  make VERSION=$pkgver DESTDIR="$pkgdir" PREFIX="/usr" build
}

package() {
  cd "$srcdir/$_pkgname"
  install -dm0755 "$pkgdir"/usr/bin
  install -m0755 ./bin/local/"${_pkgname}" "$pkgdir"/usr/bin
}
