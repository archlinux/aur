# Maintainer: Yongqi Zhuo <yongqizhuo@gmail.com>

_pkgname=cc-connect
pkgname=${_pkgname}-git
pkgver=1.2.2.beta.5.r145.g9db0158
pkgrel=1
pkgdesc="Bridge local AI coding agents to messaging platforms"
arch=('x86_64')
url="https://github.com/chenhg5/cc-connect"
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("$_pkgname::git+${url}.git"
        'LICENSE.MIT')
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/^v//; s/\([^-]*-g\)/r\1/; s/-/./g'
}

prepare() {
  cd "$srcdir/$_pkgname"
  export GOPATH="$srcdir"
  mkdir -p build
  go mod download -modcacherw
}

build() {
  cd "$srcdir/$_pkgname"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOPATH="$srcdir"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

  local _commit _build_time _ldflags
  _commit="$(git rev-parse --short HEAD)"
  _build_time="$(git log -1 --format=%cI)"
  _ldflags="-linkmode external -extldflags \"${LDFLAGS}\" -X main.version=${pkgver} -X main.commit=${_commit} -X main.buildTime=${_build_time}"

  go build \
    -tags no_web \
    -ldflags "${_ldflags}" \
    -o "build/$_pkgname" \
    "./cmd/$_pkgname"
}

package() {
  cd "$srcdir/$_pkgname"

  install -Dm755 "build/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 config.example.toml "$pkgdir/usr/share/doc/$pkgname/config.example.toml"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 INSTALL.md "$pkgdir/usr/share/doc/$pkgname/INSTALL.md"
  install -Dm644 "$srcdir/LICENSE.MIT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
