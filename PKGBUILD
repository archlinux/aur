# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="matlab-terminal-server"
pkgver=0.3.3
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
_pkgsrc="${url##*/}"
source=(
  "${_pkgsrc}::git+${url}.git#tag=v${pkgver}"
)
sha256sums=('dd866591c2ca3e4274a2899a778a4a2b80c88c8c11b8364b8e9936b6d5396db6')

prepare() {
  export GOMODCACHE="${srcdir}/go-mod-cache"

  cd "${srcdir}/${_pkgsrc}/server"
  go mod download -modcacherw -x
  go mod verify
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
  go build -v -o "build/${pkgname}" .
}

check() {
  cd "${srcdir}/${_pkgsrc}/server"
  go test ./...
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -vDm644 "README.md"  -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -vDm644 "LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"

  cd "server"
  install -vDm755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
