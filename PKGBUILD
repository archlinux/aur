# Maintainer: Swapnanil Chakraborty <swapnanil2@proton.me>
pkgname="uniclip-git"
_pkgname="uniclip"
pkgver=v2.3.6.r2.g02f28f1
pkgrel=1
pkgdesc="UniClip enables cross-device clipboard synchronization across platforms without the need for sign-ins or additional software"
arch=(x86_64)
url="https://github.com/quackduck/uniclip"
license=('MIT')
depends=(git)
optdepends=('sudo: privilege elevation' 'doas: privilege elevation')
makedepends=('go>=1.21')
options=()
conflicts=(uniclip)
provides=(uniclip)
source=("git+$url")
sha256sums=("SKIP")

pkgver() {
  cd "$srcdir/$_pkgname"
  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

prepare() {
  cd "$srcdir/$_pkgname"
}

build() {
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_ENABLED=1
  export GOPATH="$srcdir/go"
  export GOBIN="$GOPATH/bin"
  mkdir -p "$GOPATH"
  mkdir -p "$GOBIN"
  cd "$srcdir/$_pkgname"
  go build -modcacherw -trimpath -o "$GOBIN/uniclip"
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 "$GOBIN/uniclip" "$pkgdir/usr/bin/uniclip"
}

clean() {
  cd "$srcdir"
  if [[ -d "$srcdir/$_pkgname" ]]; then
    chmod -R u+w "$srcdir/$_pkgname"
    rm -rf "$srcdir/$_pkgname"
  fi
  if [[ -d "$srcdir/go" ]]; then
    chmod -R u+w "$srcdir/go"
    rm -rf "$srcdir/go"
  fi
}
