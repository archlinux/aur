# Maintainer: Uzbek Open Source Community <https://floss.uz/>
pkgname=tarmoqchi
_pkgname=tarmoqchi
pkgver=r143.b666993
pkgrel=1
pkgdesc="A lightweight HTTP tunneling tool to expose local servers to the internet"
arch=('x86_64' 'aarch64' 'armv7h' 'i686')
url="https://github.com/dilshodturab/tarmoqchi"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc')
makedepends=('go' 'git')
source=("git+${url}.git")
sha256sums=('SKIP')

# Auto-generate version from git commits
pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${_pkgname}/cli"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go build -o "${_pkgname}" .
}

package() {
  cd "${_pkgname}"

  # Install binary
  install -Dm755 "cli/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  # Install license
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install documentation
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
