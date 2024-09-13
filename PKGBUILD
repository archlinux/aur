# Maintainer: Self Denial <selfdenial@pm.me>
_pkgname='maestro'
pkgname="${_pkgname}-git"
pkgdesc='Turn natual language into commands. Your CLI tasks, now as easy as a conversation.'
pkgver=0.3.0.r3.g6e6360a
pkgrel=1
arch=('x86_64')
url="https://github.com/pluja/$_pkgname"
depends=('glibc')
makedepends=('go')
optdepends=('ollama: ollama support.')
provides=("$_pkgname=${pkgver/\.r*/}")
conflicts=("$_pkgname")
source=("git+${url}.git")
b2sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --tags --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"
  mkdir -p build/
}

build() {
  cd "$_pkgname"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS='-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw'
  go build -o build .
}

package() {
  cd "$_pkgname"
  install -Dm755 build/$_pkgname "$pkgdir"/usr/bin/$_pkgname
}
