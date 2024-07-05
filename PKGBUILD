# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="fac"
pkgname="${_pkgname}-git"
pkgver=2.0.0.r11.gd232b05
pkgrel=1
pkgdesc="Easy-to-use command line tool for fixing git conflicts"
arch=('any')
url="https://github.com/mkchoi212/${_pkgname}"
license=('MIT')
depends=('glibc' 'git')
makedepends=('git' 'go')
provides=("${_pkgname}=${pkgver%%.r*}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}"
source=("${_pkgsrc}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgsrc}"
  git describe --long --tags --abbrev=7 | sed 's/v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  [ -d "build" ] || mkdir "build"
  # go mod init "${url#https://}"
  # go mod tidy
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o "build/${_pkgname}" .
}

check() {
  cd "${srcdir}/${_pkgsrc}"
  go test ./...
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -Dm755 "build/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm644 "assets/doc/${_pkgname}.1" "${pkgdir}/usr/share/man/man1/${_pkgname}.1"
}
