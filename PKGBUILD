# Maintainer: Carter Green <crtrgreen@gmail.com>
# Contributor: John Jenkins <twodopeshaggy@gmail.com>

_pkgname=ccat
pkgname=ccat-git
pkgver=1.1.0.r33.g27844a7
pkgrel=1
pkgdesc="Colorizes output for cat."
arch=('any')
url="https://github.com/jingweno/ccat"
license=('MIT')
makedepends=('go' 'git')
conflicts=('ccat' 'ccrypt')
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  git -C "${_pkgname}" describe --long --tags | sed "s/-/.r/;s/-/./g;s/^v//"
}

prepare() {
    cd "${_pkgname}"
    go mod init "${url#https://}" # strips https:// from URL
    go mod tidy
}

build() {
  cd "${_pkgname}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o ccat .
}

check() {
  cd "${_pkgname}"
  go test ./...
}

package() {
  cd "${_pkgname}"
  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}

