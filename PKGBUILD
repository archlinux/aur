# Maintainer: robinpie <robin413@protonmail.com>
pkgname=dinky-git
_pkgname=dinky
pkgver=r169.3f5b2ff
pkgrel=1
pkgdesc='A terminal text editor for those who just want to edit some text (VCS version)'
arch=('x86_64')
url='https://github.com/sedwards2009/dinky'
license=('MIT')
depends=('glibc')
makedepends=('go>=1.24' 'git')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "${_pkgname}"
  export GOPATH="${srcdir}"
  go mod download -modcacherw
}

build() {
  cd "${_pkgname}"

  export CGO_ENABLED=0
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  export GOPATH="${srcdir}"

  go build -v -o dinky .
}

check() {
  cd "${_pkgname}"
  go test ./...
}

package() {
  cd "${_pkgname}"
  install -Dm755 dinky "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
