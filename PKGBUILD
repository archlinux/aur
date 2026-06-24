# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="matlab-terminal-server"
pkgname="${_pkgname}-git"
pkgver=0.3.0.r0.g78e2c68
pkgrel=1
pkgdesc="Use a terminal in MATLAB® to run command-line interface tools (server)"
arch=(
  'x86_64' # glnxa64
)
url="https://github.com/matlab/terminal-in-matlab"
license=(
  'custom:BSD-2-Clause-alike'
)
depends=(
  'glibc'
  'matlab-release>=R2024b'
)
makedepends=(
  'go'
  'git'
)
provides=(
  "${_pkgname}=${pkgver%.r0.g*}"
)
conflicts=(
  "${_pkgname}"
)
_pkgsrc="${url##*/}"
source=(
  "${_pkgsrc}::git+${url}.git"
)
sha256sums=('SKIP')

prepare() {
  export GOMODCACHE="${srcdir}/go-mod-cache"

  cd "${srcdir}/${_pkgsrc}/server"
  go mod download -modcacherw -x
  go mod verify
}

pkgver() {
  cd "${srcdir}/${_pkgsrc}"
  git describe --long --tags --abbrev=7 | sed 's/v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOCACHE="${srcdir}/go-cache"
  export GOMODCACHE="${srcdir}/go-mod-cache"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  cd "${srcdir}/${_pkgsrc}/server"
  go build -v -o "build/${_pkgname}" .
}

check() {
  cd "${srcdir}/${_pkgsrc}/server"
  go test ./...
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -vDm644 "README.md"  -t "${pkgdir}/usr/share/doc/${_pkgname}"
  install -vDm644 "LICENSE.md" -t "${pkgdir}/usr/share/licenses/${_pkgname}"

  cd "server"
  install -vDm755 "build/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
