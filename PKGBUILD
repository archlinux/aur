# PKGBUILD forked from https://aur.archlinux.org/packages/fgj by:
# Creator: Romain Bertrand <romaintb@noreply.codeberg.org>

# Maintainer: ilovemikael <itsmeguys2247 at gmail dot com>
_pkgname=fgj
pkgname=fgj-git
pkgver=0.5.0.r46.g755413f
pkgrel=1
pkgdesc="A command-line tool for working with Forgejo instances (including Codeberg.org) -"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://codeberg.org/romaintb/fgj"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("git+$url")
b2sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "${_pkgname}"
  mkdir -p build
}

build() {
  cd "${_pkgname}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-trimpath -ldflags=-linkmode=external -modcacherw"
  go build -ldflags "-X codeberg.org/romaintb/fgj/cmd.version=${pkgver}" -o build/${_pkgname} .
}

check() {
  cd "${_pkgname}"
  go test ./...
}

package() {
  cd "${_pkgname}"
  install -Dm755 "build/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}
