# Maintainer: Ryan Steed <ryan.steed.usa@pm.me>
# Contributor: Self Denial <selfdenial@pm.me>
_pkgname='gollama'
pkgname="${_pkgname}-git"
pkgdesc='Go manage your Ollama models'
pkgver=1.37.3.r0.g1358225
pkgrel=1
arch=('x86_64')
url="https://github.com/sammcj/$_pkgname"
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
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
  export GOFLAGS='-buildmode=pie -trimpath -ldflags=-linkmode=external -modcacherw'
  go build -ldflags="-X main.Version=$pkgver" -o build .
}

check() {
  cd "$_pkgname"
  env CI=1 go test ./...
}

package() {
  cd "$_pkgname"
  install -Dm755 build/$_pkgname "$pkgdir"/usr/bin/$_pkgname
}
