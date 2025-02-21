# Maintainer: Fernando Mumbach <fermuch at cryptolab dot net>
_pkgname=qq
pkgname=$_pkgname-git
pkgver=v0.2.5
pkgrel=2
pkgdesc="jq inspired interoperable config format transcoder with interactive querying; JSON/YAML/TOML/XML/... support; MIT license - git development version"
arch=('i686' 'x86_64')
url="https://github.com/JFryy/qq/"
license=('MIT')
groups=()
depends=()
makedepends=('git' 'go' 'jq')
optdepends=()
provides=("$_pkgname")
conflicts=("$_pkgname")
backup=()
source=("$_pkgname::git+https://github.com/JFryy/qq.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --tags | sed 's|-|.|g'
}

build() {
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  cd "$srcdir/$_pkgname"
  go build -o "bin/${_pkgname}" "${srcdir}/${_pkgname}"
}

check() {
  cd "${srcdir}/${_pkgname}"
  ./tests/test.sh
}

package() {
  mkdir -p "${pkgdir}/usr/local/bin/"

  cd "${srcdir}/${_pkgname}"
  install -Dm755 ./bin/qq "${pkgdir}/usr/local/bin/${_pkgname}"
}
